import { REFRESH_INTERVAL_MS } from "./config.js";
import {
  fetchHeatmapInputs,
  fetchAllQuotes,
  fetchLastRefreshTime,
} from "./api.js";
import {
  prepareHeatmapData,
  applyQuoteToStock,
  buildStockRegistry,
} from "./grouping.js";
import {
  renderError,
  hideStockTooltip,
  renderHeatmap,
  renderLoading,
  updateSubtitle,
  patchStockBlocks,
} from "./render.js";

let lastHierarchy = null;
let stockBySymbol = new Map();
let blockRegistry = new Map();
let refreshTimerId = null;
let isRefreshing = false;
const EARLY_REFRESH_MS = 30 * 1000;

function openStockChartPage(stock) {
  hideStockTooltip();
  const params = new URLSearchParams({
    symbol: stock.symbol,
    name: stock.companyName || stock.name || "",
  });
  const onCleanUrls = !window.location.pathname.endsWith(".html");
  const chartPath = onCleanUrls ? "chart" : "chart.html";
  const url = new URL(`${chartPath}?${params}`, window.location.href);
  window.open(url.href, "_blank", "noopener,noreferrer");
}

function formatSubtitle(updatedAt = null) {
  const time = updatedAt
    ? updatedAt.toLocaleString([], {
      timeZone: "America/New_York",
        month: "numeric",
        day: "numeric",
        year: "numeric",
        hour: "numeric",
        minute: "2-digit",
        second: "2-digit",
      })
    : "Not fetched yet";
  return `🇺🇸 S&P 500 Index · Last fetch: ${time}`;
}

async function refreshQuotes() {
  if (isRefreshing || stockBySymbol.size === 0) return;
  isRefreshing = true;
  try {
    const [quotes, meta] = await Promise.all([
      fetchAllQuotes(),
      fetchLastRefreshTime(),
    ]);
    const changedSymbols = [];
    for (const quote of quotes) {
      const stock = stockBySymbol.get(quote.symbol);
      const { changed } = applyQuoteToStock(stock, quote);
      if (changed) changedSymbols.push(quote.symbol);
    }
    patchStockBlocks(blockRegistry, changedSymbols, stockBySymbol);
    updateSubtitle(formatSubtitle(parseLastRefreshTime(meta)));
  } catch (err) {
    console.warn("Quote refresh failed:", err);
  } finally {
    isRefreshing = false;
  }
}

function startQuoteRefresh() {
  if (refreshTimerId) clearInterval(refreshTimerId);
  refreshTimerId = setInterval(refreshQuotes, REFRESH_INTERVAL_MS);
  window.addEventListener("beforeunload", () => clearInterval(refreshTimerId));

  setTimeout(refreshQuotes, EARLY_REFRESH_MS);
}

function observeHeatmapResize(container) {
  const observer = new ResizeObserver(() => {
    if (lastHierarchy) {
      blockRegistry = renderHeatmap(
        container,
        lastHierarchy,
        openStockChartPage,
      );
    }
  });
  observer.observe(container);
}

async function initHeatmap() {
  const container = document.querySelector(".heatmap");
  if (!container) {
    throw new Error("Heatmap container not found.");
  }

  observeHeatmapResize(container);

  renderLoading(container, "Loading stock data…");
  updateSubtitle("Fetching symbols, profiles, and live quotes…");

  try {
    const [{ symbols, profiles, quotes }, meta] = await Promise.all([
      fetchHeatmapInputs(),
      fetchLastRefreshTime(),
    ]);
    const { hierarchy, stocks } = prepareHeatmapData(symbols, profiles, quotes);
    lastHierarchy = hierarchy;
    stockBySymbol = buildStockRegistry(stocks);

    blockRegistry = renderHeatmap(container, hierarchy, openStockChartPage);
    updateSubtitle(formatSubtitle(parseLastRefreshTime(meta)));
    startQuoteRefresh();
  } catch (error) {
    console.error(error);
    renderError(
      container,
      "Failed to load heatmap data. Ensure both Spring Boot apps are running on ports 8080 and 8081.",
    );
    updateSubtitle("Data load failed");
  }
}

document.addEventListener("DOMContentLoaded", initHeatmap);

function parseLastRefreshTime(meta) {
  const raw = meta?.lastRefreshTime;
  if (!raw) return null;
  const date = new Date(raw);
  return Number.isNaN(date.getTime()) ? null : date;
}
