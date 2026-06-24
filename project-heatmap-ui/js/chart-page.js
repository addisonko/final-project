import { fetchHistoricalOhlc, fetchStockProfile } from "./api.js";

let chart;
let candleSeries;
let resizeObserver;

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

async function initChartPage() {
  const symbolEl = document.getElementById("chart-symbol");
  const subtitleEl = document.getElementById("chart-subtitle");
  const statusEl = document.getElementById("chart-status");
  const containerEl = document.getElementById("chart-container");
  const logoWrap = document.getElementById("chart-logo-wrap");
  const logoImg = document.getElementById("chart-logo");

  const { symbol, name } = getQueryParams();
  if (!symbol) {
    setStatus(statusEl, containerEl, "No stock symbol provided.");
    return;
  }

  document.title = `${symbol} Chart`;
  symbolEl.textContent = symbol;
  subtitleEl.textContent = name;
  setStatus(statusEl, containerEl, "Loading 10 years of historical OHLC data…");

  try {
    const [rows, profile] = await Promise.all([
      fetchHistoricalOhlc(symbol, 10),
      fetchStockProfile(symbol).catch(() => null),
    ]);

    if (!name && profile?.companyName) {
      subtitleEl.textContent = profile.companyName;
    }
    renderLogo(logoWrap, logoImg, symbol, profile);

    if (!rows.length) {
      setStatus(statusEl, containerEl, // 
        `No historical data available for ${symbol}.`); //
      return;
    }

    showChart(statusEl, containerEl);
    const { chartInstance, series } = createCandlestickChart(containerEl);
    chart = chartInstance;
    candleSeries = series;
    candleSeries.setData(mapCandles(rows));
    chart.timeScale().fitContent();
    observeChartResize(containerEl, chart);
  } catch (error) {
    console.error(error);
    setStatus(statusEl, containerEl, "Failed to load historical chart.");
  }
}

document.addEventListener("DOMContentLoaded", initChartPage);