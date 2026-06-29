export const API = {
  stockDataBase: "https://project-stock-data-production-8ee5.up.railway.app",
  liveDataBase: "https://project-data-provider-production-f081.up.railway.app",
};

export const ENDPOINTS = {
  symbols: `${API.stockDataBase}/api/stocks/symbols`,
  profiles: `${API.stockDataBase}/api/stocks/profiles`,
  quotesAll: `${API.liveDataBase}/api/liveData/quotes/all`,
  quotesLastRefresh: `${API.liveDataBase}/api/liveData/quotes/lastRefresh`,

  historicalOhlc: (symbol, years = 10) =>
    `${API.stockDataBase}/api/stocks/${encodeURIComponent(symbol)}/ohlc?years=${years}`,
  quotes: (symbols) =>
    `${API.liveDataBase}/api/liveData/quotes?symbols=${symbols
      .map((symbol) => encodeURIComponent(symbol))
      .join(",")}`,
  stockProfile: (symbol) =>
    `${API.stockDataBase}/api/stocks/${encodeURIComponent(symbol)}/profile`,
  stockNews: (symbol) =>
    `${API.stockDataBase}/api/stocks/${encodeURIComponent(symbol)}/news`,
};

/** How often to refresh UI from Redis-cached quotes (2 mins). */
export const REFRESH_INTERVAL_MS = 60 * 1000;

/** Years of OHLC history shown in the hover tooltip sparkline. */
export const TOOLTIP_SPARKLINE_YEARS = 1;

/** Max years of OHLC history seeded in the database (disables longer chart ranges). */
export const MAX_OHLC_HISTORY_YEARS = 5;

/**
 * Maps Finnhub industry strings to coarse GICS-style sectors.
 * Unmapped industries fall back to keyword matching, then "Other".
 */
export const INDUSTRY_SECTOR_MAP = {
  // Technology
  Technology: "Technology",
  Semiconductors: "Technology",
  Communications: "Communication Services",
  Media: "Communication Services",
  Telecommunication: "Communication Services",

  // Consumer Cyclical
  Automobiles: "Consumer Cyclical",
  "Auto Components": "Consumer Cyclical",
  Retail: "Consumer Cyclical",
  "Hotels, Restaurants & Leisure": "Consumer Cyclical",
  "Leisure Products": "Consumer Cyclical",
  "Textiles, Apparel & Luxury Goods": "Consumer Cyclical",

  // Financial
  Banking: "Financial",
  "Financial Services": "Financial",
  Insurance: "Financial",

  // Healthcare
  "Health Care": "Healthcare",
  Biotechnology: "Healthcare",
  Pharmaceuticals: "Healthcare",
  "Life Sciences Tools & Services": "Healthcare",

  // Consumer Defensive
  Beverages: "Consumer Defensive",
  "Food Products": "Consumer Defensive",
  Tobacco: "Consumer Defensive",
  "Consumer products": "Consumer Defensive",

  // Energy & Utilities
  Energy: "Energy",
  Utilities: "Utilities",

  // Industrials
  "Aerospace & Defense": "Industrials",
  Airlines: "Industrials",
  "Industrial Conglomerates": "Industrials",
  Machinery: "Industrials",
  "Road & Rail": "Industrials",
  "Logistics & Transportation": "Industrials",
  "Electrical Equipment": "Industrials",
  Building: "Industrials",
  Construction: "Industrials",
  "Commercial Services & Supplies": "Industrials",
  "Professional Services": "Industrials",
  Packaging: "Industrials",

  // Real Estate
  "Real Estate": "Real Estate",

  // Basic Materials
  Chemicals: "Basic Materials",
  "Metals & Mining": "Basic Materials",

  // Other
  Distributors: "Industrials",
  "Trading Companies & Distributors": "Industrials",
};

export const SECTOR_KEYWORDS = [
  {
    sector: "Technology",
    keywords: [
      "software",
      "semiconductor",
      "electronic",
      "technology",
      "computer",
    ],
  }, //
  {
    sector: "Communication Services",
    keywords: ["telecom", "media", "entertainment", "broadcast"],
  }, //
  {
    sector: "Consumer Cyclical",
    keywords: ["retail", "auto", "motor", "apparel", "restaurant", "leisure"],
  }, //
  {
    sector: "Financial",
    keywords: [
      "bank",
      "insurance",
      "finance",
      "capital",
      "investment",
      "credit",
    ],
  }, //
  {
    sector: "Healthcare",
    keywords: ["health", "drug", "pharma", "biotech", "medical", "hospital"],
  }, //
  {
    sector: "Consumer Defensive",
    keywords: [
      "food",
      "beverage",
      "tobacco",
      "household",
      "grocery",
      "discount",
    ],
  }, //
  {
    sector: "Industrials",
    keywords: [
      "industrial",
      "aerospace",
      "defense",
      "machinery",
      "transport",
      "airline",
      "rail",
    ],
  }, //
  { sector: "Energy", keywords: ["oil", "gas", "energy", "coal", "pipeline"] }, //
  { sector: "Utilities", keywords: ["utility", "electric", "water", "power"] }, //
  { sector: "Real Estate", keywords: ["reit", "real estate", "property"] }, //
  {
    sector: "Basic Materials",
    keywords: [
      "mining",
      "metal",
      "chemical",
      "steel",
      "material",
      "copper",
      "gold",
    ],
  }, //
];

export const DEFAULT_SECTOR = "Other";

/** Minimum flex weight for any stock cell. */
export const MIN_STOCK_WEIGHT = 1;

/** Scale market cap (USD) into treemap flex weights. */
export const MARKET_CAP_SCALE = 1_000_000_000;
