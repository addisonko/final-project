import {
  DEFAULT_SECTOR,
  INDUSTRY_SECTOR_MAP,
  MARKET_CAP_SCALE,
  MIN_STOCK_WEIGHT,
  SECTOR_KEYWORDS,
} from "./config.js";

export function deriveSector(industry) {
  if (!industry) {
    return DEFAULT_SECTOR;
  }

  if (INDUSTRY_SECTOR_MAP[industry]) {
    return INDUSTRY_SECTOR_MAP[industry];
  }

  const normalized = industry.toLowerCase();
  for (const { sector, keywords } of SECTOR_KEYWORDS) {
    if (keywords.some((keyword) => normalized.includes(keyword))) {
      return sector;
    }
  }

  return DEFAULT_SECTOR;
}

export function marketCapWeight(marketCap) {
  const numeric = Number(marketCap);
  if (!Number.isFinite(numeric) || numeric <= 0) {
    return MIN_STOCK_WEIGHT;
  }
  return Math.max(MIN_STOCK_WEIGHT, Math.round(numeric / MARKET_CAP_SCALE));
}

export function getPerformanceClass(percentChange) {
  const value = Number(percentChange) || 0;
  if (value === 0) {
    return "change-neutral";
  }
  if (value > 0) {
    if (value <= 1) return "change-green-dark";
    if (value <= 3) return "change-green-medium";
    return "change-green-bright";
  }
  if (value >= -1) return "change-red-dark";
  if (value >= -3) return "change-red-medium";
  return "change-red-bright";
}

export function formatPercentChange(percentChange) {
  const value = Number(percentChange) || 0;
  const prefix = value > 0 ? "+" : "";
  return `${prefix}${value.toFixed(2)}%`;
}

export function formatPrice(value) {
  const n = Number(value);
  if (!Number.isFinite(n)) return "—";
  return `$${n.toFixed(2)}`;
}

export function mergeStockData(symbols, profiles, quotes) {
  const profileBySymbol = new Map(
    profiles.map((profile) => [profile.symbol, profile]),
  );
  const quoteBySymbol = new Map(quotes.map((quote) => [quote.symbol, quote]));

  return symbols.map((stock) => {
    const profile = profileBySymbol.get(stock.symbol) ?? {};
    const quote = quoteBySymbol.get(stock.symbol) ?? {};
    const industry = profile.industry || "Unknown";

    return {
      symbol: stock.symbol,
      name: stock.name,
      companyName: profile.companyName || stock.name,
      logo: profile.logo?.trim() || null,
      industry,
      sector: deriveSector(industry),
      marketCap: Number(profile.marketCap) || MIN_STOCK_WEIGHT,
      percentChange: Number(quote.percentChange) || 0,
      currentPrice: quote.currentPrice ?? null,
      highPrice: quote.highPrice ?? null,
      lowPrice: quote.lowPrice ?? null,
      weight: marketCapWeight(profile.marketCap),
      performanceClass: getPerformanceClass(Number(quote.percentChange) || 0),
    };
  });
}

export function applyQuoteToStock(stock, quote) {
  if (!stock || !quote) return { changed: false };

  const prevPrice = stock.currentPrice;
  const prevChange = stock.percentChange;

  stock.currentPrice = quote.currentPrice ?? stock.currentPrice;
  stock.percentChange = Number(quote.percentChange) || 0;
  stock.highPrice = quote.highPrice ?? stock.highPrice;
  stock.lowPrice = quote.lowPrice ?? stock.lowPrice;
  stock.performanceClass = getPerformanceClass(stock.percentChange);

  const changed =
    prevPrice !== stock.currentPrice || prevChange !== stock.percentChange;

  return { changed };
}

export function buildStockRegistry(stocks) {
  return new Map(stocks.map((stock) => [stock.symbol, stock]));
}

/**
 * Groups flat stock records into { [sector]: { [industry]: Stock[] } } via reduce.
 */
export function groupBySectorAndIndustry(stocks) {
  return stocks.reduce((sectors, stock) => {
    const { sector, industry } = stock;

    if (!sectors[sector]) {
      sectors[sector] = {};
    }
    if (!sectors[sector][industry]) {
      sectors[sector][industry] = [];
    }

    sectors[sector][industry].push(stock);
    return sectors;
  }, {});
}

function sumWeight(items) {
  return items.reduce((total, item) => total + item.weight, 0);
}

/**
 * Converts grouped object into a sorted hierarchy ready for rendering.
 */
function buildRenderHierarchy(grouped) {
  return Object.entries(grouped).map(([sectorName, industriesMap]) => {
    const industries = Object.entries(industriesMap).map(
      ([industryName, stocks]) => ({
        name: industryName,
        value: sumMarketCap(stocks),
        stocks: stocks.map((stock) => {
          stock.value = stockValue(stock);
          return stock;
        }),
      }),
    );
    return {
      name: sectorName,
      value: sumMarketCap(industries.flatMap((i) => i.stocks)),
      industries,
    };
  });
}

export function prepareHeatmapData(symbols, profiles, quotes) {
  const merged = mergeStockData(symbols, profiles, quotes);
  const grouped = groupBySectorAndIndustry(merged);
  return {
    hierarchy: buildRenderHierarchy(grouped),
    stocks: merged,
  };
}

const MIN_MARKET_CAP = 1; // fallback when profile missing
export function stockValue(stock) {
  const cap = Number(stock.marketCap);
  return Number.isFinite(cap) && cap > 0 ? cap : MIN_MARKET_CAP;
}

export function sumMarketCap(items) {
  return items.reduce((total, item) => total + stockValue(item), 0);
}
