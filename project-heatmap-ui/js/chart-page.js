import {
  fetchCompanyNews,
  fetchHistoricalOhlc,
  fetchStockProfile,
  fetchQuotesForSymbols,
} from "./api.js";
import { MAX_OHLC_HISTORY_YEARS, REFRESH_INTERVAL_MS } from "./config.js";
import { formatPrice, formatPercentChange } from "./grouping.js";

let chart;
let candleSeries;
let resizeObserver;

const RANGE_OPTIONS = {
  "1M": { backendYears: 1, months: 1 },
  "3M": { backendYears: 1, months: 3 },
  "6M": { backendYears: 1, months: 6 },
  "1Y": { backendYears: 1 },
  "5Y": { backendYears: 5 },
  "10Y": { backendYears: 10 },
};

const DEFAULT_RANGE = "3M";

let activeSymbol = "";
let activeRange = DEFAULT_RANGE;
const ohlcCache = new Map();

function getQueryParams() {
  const params = new URLSearchParams(window.location.search);
  return {
    symbol: params.get("symbol")?.toUpperCase() ?? "",
    name: params.get("name") ?? "",
  };
}

function mapCandles(rows) {
  return rows.map((row) => ({
    time: row.tradeDate,
    open: Number(row.open),
    high: Number(row.high),
    low: Number(row.low),
    close: Number(row.close),
  }));
}

function filterRowsByMonths(rows, months) {
  if (!months) return rows;
  const cutoff = new Date();
  cutoff.setMonth(cutoff.getMonth() - months);

  return rows.filter((row) => {
    const tradeDate = new Date(row.tradeDate);
    return tradeDate >= cutoff;
  });
}

function getRowsForRange(rows, rangeKey) {
  const option = RANGE_OPTIONS[rangeKey];
  if (!option) return rows;
  if (!option.months) return rows;
  return filterRowsByMonths(rows, option.months);
}

async function getOhlcRows(symbol, rangeKey) {
  const option = RANGE_OPTIONS[rangeKey];
  const cacheKey = `${symbol}:${option.backendYears}`;

  if (!ohlcCache.has(cacheKey)) {
    ohlcCache.set(cacheKey, fetchHistoricalOhlc(symbol, option.backendYears));
  }

  const rows = await ohlcCache.get(cacheKey);
  return getRowsForRange(rows, rangeKey);
}

function setActiveRangeButton(rangeKey) {
  document.querySelectorAll(".chart-page__range-btn").forEach((button) => {
    button.classList.toggle("is-active", button.dataset.range === rangeKey);
  });
}

function isRangeAvailable(rangeKey) {
  const option = RANGE_OPTIONS[rangeKey];
  return option && option.backendYears <= MAX_OHLC_HISTORY_YEARS;
}

function initRangeButtons() {
  document.querySelectorAll(".chart-page__range-btn").forEach((button) => {
    const rangeKey = button.dataset.range;
    if (!isRangeAvailable(rangeKey)) {
      button.disabled = true;
      button.title = `Only ${MAX_OHLC_HISTORY_YEARS} years of history available`;
    }
  });
}

async function loadRange(rangeKey, statusEl, containerEl) {
  if (!activeSymbol || !chart || !candleSeries) return;
  if (!isRangeAvailable(rangeKey)) return;

  const rows = await getOhlcRows(activeSymbol, rangeKey);

  if (!rows.length) {
    setStatus(
      statusEl,
      containerEl,
      `No historical data available for ${activeSymbol}.`,
    );
    return;
  }

  showChart(statusEl, containerEl);
  candleSeries.setData(mapCandles(rows));
  chart.timeScale().fitContent();

  activeRange = rangeKey;
  setActiveRangeButton(rangeKey);
}

function createCandlestickChart(container) {
  const { width, height } = container.getBoundingClientRect();
  const chartInstance = window.LightweightCharts.createChart(container, {
    width: Math.max(320, Math.floor(width)),
    height: Math.max(320, Math.floor(height)),
    layout: {
      background: { color: "#161b22" },
      textColor: "#e6edf3",
    },
    grid: {
      vertLines: { color: "#30363d" },
      horzLines: { color: "#30363d" },
    },
    timeScale: {
      borderColor: "#30363d",
      timeVisible: true,
    },
    rightPriceScale: {
      borderColor: "#30363d",
    },
    crosshair: {
      mode: window.LightweightCharts.CrosshairMode.Normal,
    },
  });

  const series = chartInstance.addSeries(
    window.LightweightCharts.CandlestickSeries,
    {
      upColor: "#2ea043",
      borderUpColor: "#2ea043",
      wickUpColor: "#2ea043",
      downColor: "#c93c37",
      borderDownColor: "#c93c37",
      wickDownColor: "#c93c37",
    },
  );

  return { chartInstance, series };
}

function observeChartResize(container, chartInstance) {
  resizeObserver = new ResizeObserver(() => {
    const { width, height } = container.getBoundingClientRect();
    if (width > 0 && height > 0) {
      chartInstance.applyOptions({ width, height });
    }
  });
  resizeObserver.observe(container);
}

function setStatus(statusEl, containerEl, message) {
  statusEl.hidden = false;
  statusEl.textContent = message;
  containerEl.hidden = true;
}

function showChart(statusEl, containerEl) {
  statusEl.hidden = true;
  containerEl.hidden = false;
}

function renderLogo(logoWrap, logoImg, symbol, profile) {
  const logoUrl = profile?.logo?.trim();
  if (!logoUrl) {
    logoWrap.hidden = true;
    return;
  }

  logoImg.onerror = () => {
    logoWrap.hidden = true;
  };
  logoImg.src = logoUrl;
  logoImg.alt = `${symbol} logo`;
  logoWrap.hidden = false;
}

let quoteTimerId = null;

function updateLiveQuote(quoteEl, priceEl, changeEl, quote) {
  if (!quote?.currentPrice) {
    quoteEl.hidden = true;
    return;
  }

  const pct = Number(quote.percentChange) || 0;
  priceEl.textContent = formatPrice(quote.currentPrice);
  changeEl.textContent = formatPercentChange(pct);

  changeEl.className = "chart-page__change";
  if (pct > 0) changeEl.classList.add("chart-page__change--up");
  else if (pct < 0) changeEl.classList.add("chart-page__change--down");
  else changeEl.classList.add("chart-page__change--neutral");

  quoteEl.hidden = false;
}

async function refreshLiveQuote(symbol, quoteEl, priceEl, changeEl) {
  const quotes = await fetchQuotesForSymbols([symbol]);
  updateLiveQuote(quoteEl, priceEl, changeEl, quotes[0]);
}

function startLiveQuoteRefresh(symbol, quoteEl, priceEl, changeEl) {
  if (quoteTimerId) clearInterval(quoteTimerId);
  const tick = () =>
    refreshLiveQuote(symbol, quoteEl, priceEl, changeEl).catch(() => {});
  tick(); // immediate fetch on load
  quoteTimerId = setInterval(tick, REFRESH_INTERVAL_MS);
  window.addEventListener("beforeunload", () => clearInterval(quoteTimerId));
}

function bindRangeControls(statusEl, containerEl) {
  document.querySelectorAll(".chart-page__range-btn").forEach((button) => {
    button.addEventListener("click", async () => {
      const rangeKey = button.dataset.range;
      if (!rangeKey || rangeKey === activeRange || button.disabled) return;

      try {
        await loadRange(rangeKey, statusEl, containerEl);
      } catch (error) {
        console.error(error);
        setStatus(statusEl, containerEl, "Failed to update chart range.");
      }
    });
  });
}

function formatNewsDate(unixSeconds) {
  if (!unixSeconds) return "";
  return new Date(unixSeconds * 1000).toLocaleString("en-US", {
    month: "short",
    day: "numeric",
    year: "numeric",
    hour: "numeric",
    minute: "2-digit",
  });
}

function createNewsPlaceholder(message) {
  const el = document.createElement("p");
  el.className = "chart-page__news-placeholder";
  el.textContent = message;
  return el;
}

function renderNewsCard(article) {
  const hasUrl = Boolean(article.url?.trim());
  const card = document.createElement(hasUrl ? "a" : "article");
  card.className = "news-card";

  if (hasUrl) {
    card.href = article.url;
    card.target = "_blank";
    card.rel = "noopener noreferrer";
  }

  const body = document.createElement("div");
  body.className = "news-card__body";

  if (article.headline) {
    const headline = document.createElement("span");
    headline.className = "news-card__headline";
    headline.textContent = article.headline;
    body.appendChild(headline);
  } else if (hasUrl) {
    const headline = document.createElement("span");
    headline.className = "news-card__headline";
    headline.textContent = "Read article";
    body.appendChild(headline);
  }

  const meta = document.createElement("div");
  meta.className = "news-card__meta";
  const parts = [];
  if (article.source) parts.push(article.source);
  const dateStr = formatNewsDate(article.datetime);
  if (dateStr) parts.push(dateStr);
  meta.textContent = parts.join(" · ");
  if (parts.length) body.appendChild(meta);

  if (article.summary) {
    const summary = document.createElement("p");
    summary.className = "news-card__summary";
    summary.textContent = article.summary;
    body.appendChild(summary);
  }

  card.appendChild(body);
  return card;
}

async function loadCompanyNews(symbol) {
  const container = document.getElementById("news-feed-container");
  if (!container) return;

  container.replaceChildren();
  container.appendChild(createNewsPlaceholder("Loading news…"));

  try {
    const articles = await fetchCompanyNews(symbol);
    container.replaceChildren();

    if (!articles?.length) {
      container.appendChild(
        createNewsPlaceholder("No recent news for this symbol."),
      );
      return;
    }

    const fragment = document.createDocumentFragment();
    for (const article of articles) {
      fragment.appendChild(renderNewsCard(article));
    }
    container.appendChild(fragment);
  } catch (error) {
    console.error(error);
    container.replaceChildren();
    container.appendChild(createNewsPlaceholder("Failed to load news."));
  }
}

async function setActiveSymbol(
  symbol,
  { statusEl, containerEl, quoteEl, priceEl, changeEl },
) {
  activeSymbol = symbol;
  startLiveQuoteRefresh(symbol, quoteEl, priceEl, changeEl);
  loadCompanyNews(symbol);
  await loadRange(activeRange, statusEl, containerEl);
}

async function initChartPage() {
  const symbolEl = document.getElementById("chart-symbol");
  const subtitleEl = document.getElementById("chart-subtitle");
  const statusEl = document.getElementById("chart-status");
  const containerEl = document.getElementById("chart-container");
  const logoWrap = document.getElementById("chart-logo-wrap");
  const logoImg = document.getElementById("chart-logo");
  const quoteEl = document.getElementById("chart-quote");
  const priceEl = document.getElementById("chart-price");
  const changeEl = document.getElementById("chart-change");

  const { symbol, name } = getQueryParams();
  if (!symbol) {
    setStatus(statusEl, containerEl, "No stock symbol provided.");
    return;
  }

  document.title = `${symbol} Chart`;
  symbolEl.textContent = symbol;
  subtitleEl.textContent = name;
  setStatus(statusEl, containerEl, "Loading historical OHLC data…");

  try {
    const profile = await fetchStockProfile(symbol).catch(() => null);

    if (!name && profile?.companyName) {
      subtitleEl.textContent = profile.companyName;
    }
    renderLogo(logoWrap, logoImg, symbol, profile);

    showChart(statusEl, containerEl);
    const { chartInstance, series } = createCandlestickChart(containerEl);
    chart = chartInstance;
    candleSeries = series;

    initRangeButtons();
    bindRangeControls(statusEl, containerEl);
    await setActiveSymbol(symbol, {
      statusEl,
      containerEl,
      quoteEl,
      priceEl,
      changeEl,
    });

    observeChartResize(containerEl, chart);
  } catch (error) {
    console.error(error);
    setStatus(statusEl, containerEl, "Failed to load historical chart.");
  }
}

document.addEventListener("DOMContentLoaded", initChartPage);
