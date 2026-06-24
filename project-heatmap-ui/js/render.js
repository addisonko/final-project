import { formatPercentChange, formatPrice } from "./grouping.js";
import { layoutHeatmap } from "./treemap-layout.js";
import {
  downsampleCloses,
  drawSparkline,
  getSparklineColor,
} from "./sparkline.js";
import { getTooltipOhlc } from "./tooltip-ohlc-cache.js";

const FULL_WIDTH = 56;
const FULL_HEIGHT = 44;
const COMPACT_WIDTH = 40;
const COMPACT_HEIGHT = 25;
const MICRO_WIDTH = 18;
const MICRO_HEIGHT = 18;
const LOGO_MIN_DIM = 24;

function getVisibilityTier(width, height) {
  if (width < MICRO_WIDTH || height < MICRO_HEIGHT) return "micro";
  if (width < COMPACT_WIDTH || height < COMPACT_HEIGHT) return "compact";
  if (width < FULL_WIDTH || height < FULL_HEIGHT) return "medium";
  return "full";
}

function computeFontSizes(width, height) {
  const minDim = Math.min(width, height);
  const symbolPx = Math.max(8, Math.min(18, minDim * 0.28));
  const changePx = Math.max(7, Math.min(14, symbolPx * 0.82));
  return { symbolPx, changePx };
}

function computeLogoSize(width, height) {
  const minDim = Math.min(width, height);
  if (minDim < LOGO_MIN_DIM) return 0;
  return Math.max(12, Math.min(28, Math.round(minDim * 0.35)));
}

function setRect(el, node) {
  el.style.left = `${node.x0}px`;
  el.style.top = `${node.y0}px`;
  el.style.width = `${node.x1 - node.x0}px`;
  el.style.height = `${node.y1 - node.y0}px`;
}

function setTooltipChangeClass(el, performanceClass) {
  el.className = "stock-tooltip__change";
  if (performanceClass?.startsWith("change-green")) {
    el.classList.add("stock-tooltip__change--up");
  } else if (performanceClass?.startsWith("change-red")) {
    el.classList.add("stock-tooltip__change--down");
  } else {
    el.classList.add("stock-tooltip__change--neutral");
  }
}

function setChartLoading(chartEl, message = "Loading chart…") {
  chartEl.replaceChildren();
  const loading = document.createElement("span");
  loading.className = "stock-tooltip__chart-loading";
  loading.textContent = message;
  chartEl.appendChild(loading);
}

function createStockTooltip() {
  const el = document.createElement("div");
  el.className = "stock-tooltip";
  el.hidden = true;
  el.innerHTML = `
    <div class="stock-tooltip__header">
      <span class="stock-tooltip__symbol"></span>
      <span class="stock-tooltip__change"></span>
    </div>
    <div class="stock-tooltip__name"></div>
    <div class="stock-tooltip__price-row">
      <span class="stock-tooltip__price" data-field="price"></span>
    </div>
    <div class="stock-tooltip__chart" data-field="chart"></div>`;
  document.body.appendChild(el);

  const fields = {
    symbol: el.querySelector(".stock-tooltip__symbol"),
    change: el.querySelector(".stock-tooltip__change"),
    name: el.querySelector(".stock-tooltip__name"),
    price: el.querySelector('[data-field="price"]'),
    chart: el.querySelector('[data-field="chart"]'),
  };

  let activeSymbol = null;

  return {
    show(stock, rect) {
      activeSymbol = stock.symbol;
      fields.symbol.textContent = stock.symbol;
      fields.change.textContent = formatPercentChange(stock.percentChange);
      setTooltipChangeClass(fields.change, stock.performanceClass);
      fields.name.textContent = stock.companyName || stock.name;
      fields.price.textContent = formatPrice(stock.currentPrice);
      setChartLoading(fields.chart);
      el.hidden = false;
      this._anchor = rect;
      this._position(rect);

      const symbol = stock.symbol;
      getTooltipOhlc(symbol).then((rows) => {
        if (activeSymbol !== symbol) return;

        const closes = downsampleCloses(rows);
        const color = getSparklineColor(stock.percentChange);
        const { width, height } = fields.chart.getBoundingClientRect();
        const drawn = drawSparkline(fields.chart, closes, {
          color,
          width: Math.max(1, Math.floor(width)),
          height: Math.max(1, Math.floor(height)),
        });

        if (!drawn) {
          setChartLoading(fields.chart, "No chart data");
          fields.chart.firstChild.className = "stock-tooltip__chart-empty";
        }
        if (this._anchor) this._position(this._anchor);
      });
    },
    move(rect) {
      if (rect) this._anchor = rect;
      if (this._anchor) this._position(this._anchor);
    },
    hide() {
      activeSymbol = null;
      el.hidden = true;
      this._anchor = null;
    },
    _position(rect) {
      const pad = 8;
      const tw = el.offsetWidth;
      const th = el.offsetHeight;
      let left = rect.right + pad;
      let top = rect.top + rect.height / 2 - th / 2;
      if (left + tw > window.innerWidth - pad) {
        left = rect.left - tw - pad;
      }
      top = Math.max(pad, Math.min(top, window.innerHeight - th - pad));
      el.style.left = `${left}px`;
      el.style.top = `${top}px`;
    },
  };
}

const stockTooltip = createStockTooltip();

export function hideStockTooltip() {
  stockTooltip.hide();
}

function swapPerformanceClass(block, nextClass) {
  for (const cls of [...block.classList]) {
    if (cls.startsWith("change-")) block.classList.remove(cls);
  }
  block.classList.add(nextClass);
}

export function patchStockBlock(block, stock, { flash = false } = {}) {
  const changeEl = block.querySelector(".stock-change");
  if (changeEl) {
    changeEl.textContent = formatPercentChange(stock.percentChange);
  }
  swapPerformanceClass(block, stock.performanceClass);

  if (flash) {
    block.classList.remove("stock-block--flash");
    void block.offsetWidth;
    block.classList.add("stock-block--flash");
    block.addEventListener(
      "animationend",
      () => block.classList.remove("stock-block--flash"),
      { once: true },
    );
  }
}

export function patchStockBlocks(blockRegistry, changedSymbols, stockBySymbol) {
  for (const symbol of changedSymbols) {
    const block = blockRegistry.get(symbol);
    const stock = stockBySymbol.get(symbol);
    if (block && stock) patchStockBlock(block, stock, { flash: true });
  }
}

function appendStockLogo(block, stock, logoPx) {
  if (!logoPx || !stock.logo) return;

  const wrap = document.createElement("div");
  wrap.className = "stock-logo-wrap";
  wrap.style.width = `${logoPx}px`;
  wrap.style.height = `${logoPx}px`;

  const img = document.createElement("img");
  img.className = "stock-logo";
  img.alt = "";
  img.loading = "lazy";
  img.decoding = "async";
  img.onerror = () => wrap.remove();
  img.src = stock.logo;

  wrap.appendChild(img);
  block.appendChild(wrap);
}

function createStockBlock(stockNode, blockRegistry, onStockOpenChart) {
  const stock = stockNode.data.stock;
  const width = stockNode.x1 - stockNode.x0;
  const height = stockNode.y1 - stockNode.y0;
  const tier = getVisibilityTier(width, height);

  const block = document.createElement("div");
  block.className = `stock-block ${stock.performanceClass}`;
  block.dataset.symbol = stock.symbol;
  if (tier === "medium") {
    block.classList.add("stock-block--medium");
  }
  if (tier === "compact") {
    block.classList.add("stock-block--compact");
  }
  if (tier === "micro") {
    block.classList.add("stock-block--micro");
  }

  setRect(block, stockNode);
  blockRegistry.set(stock.symbol, block);

  block.addEventListener("mouseenter", () => {
    stockTooltip.show(stock, block.getBoundingClientRect());
  });
  block.addEventListener("mousemove", () => {
    stockTooltip.move(block.getBoundingClientRect());
  });
  block.addEventListener("mouseleave", () => {
    stockTooltip.hide();
  });
  block.addEventListener("dblclick", () => {
    stockTooltip.hide();
    onStockOpenChart?.(stock);
  });

  if (tier === "micro") {
    return block;
  }

  const { symbolPx, changePx } = computeFontSizes(width, height);

  const symbolEl = document.createElement("span");
  symbolEl.className = "stock-symbol";
  symbolEl.textContent = stock.symbol;
  symbolEl.style.fontSize = `${symbolPx}px`;

  if (tier === "compact") {
    block.append(symbolEl);
    return block;
  }

  const logoPx = computeLogoSize(width, height);
  appendStockLogo(block, stock, logoPx);
  block.append(symbolEl);

  if (tier === "medium") {
    return block;
  }

  const changeEl = document.createElement("span");
  changeEl.className = "stock-change";
  changeEl.textContent = formatPercentChange(stock.percentChange);
  changeEl.style.fontSize = `${changePx}px`;
  block.append(changeEl);
  return block;
}

function createIndustryPlate(industryNode, blockRegistry, onStockOpenChart) {
  const plate = document.createElement("div");
  plate.className = "industry-plate";
  setRect(plate, industryNode);

  const header = document.createElement("div");
  header.className = "industry-header";
  header.textContent = industryNode.data.name;
  const body = document.createElement("div");
  body.className = "industry-body";
  industryNode.stockRoot?.children?.forEach((stockNode) => {
    body.appendChild(
      createStockBlock(stockNode, blockRegistry, onStockOpenChart),
    );
  });
  plate.append(header, body);
  return plate;
}

function createSectorPlate(sectorNode, blockRegistry, onStockOpenChart) {
  const plate = document.createElement("section");
  plate.className = "sector-plate";
  setRect(plate, sectorNode);

  const header = document.createElement("div");
  header.className = "sector-header";
  header.textContent = sectorNode.data.name;

  const body = document.createElement("div");
  body.className = "sector-body";

  sectorNode.industryRoot?.children?.forEach((industryNode) => {
    body.appendChild(
      createIndustryPlate(industryNode, blockRegistry, onStockOpenChart),
    );
  });

  plate.append(header, body);
  return plate;
}

export function renderHeatmap(container, hierarchy, onStockOpenChart) {
  const { width, height } = container.getBoundingClientRect();
  if (width === 0 || height === 0) {
    return new Map();
  }
  const blockRegistry = new Map();
  const sectorRoot = layoutHeatmap(hierarchy, width, height);
  container.replaceChildren();
  container.classList.add("heatmap--treemap");
  sectorRoot.children?.forEach((sectorNode) => {
    container.appendChild(
      createSectorPlate(sectorNode, blockRegistry, onStockOpenChart),
    );
  });
  return blockRegistry;
}

export function renderLoading(container, message) {
  container.replaceChildren();
  container.classList.remove("heatmap--treemap");
  const loading = document.createElement("div");
  loading.className = "heatmap-status";
  loading.textContent = message;
  container.appendChild(loading);
}

export function renderError(container, message) {
  container.replaceChildren();
  container.classList.remove("heatmap--treemap");
  const error = document.createElement("div");
  error.className = "heatmap-status heatmap-status--error";
  error.textContent = message;
  container.appendChild(error);
}

export function updateSubtitle(text) {
  const subtitle = document.querySelector(".dashboard-subtitle");
  if (subtitle) {
    subtitle.textContent = text;
  }
}
