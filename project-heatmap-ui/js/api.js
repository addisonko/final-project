import { ENDPOINTS } from "./config.js";

async function fetchJson(url) {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Request failed (${response.status}): ${url}`);
  }
  return response.json();
}

export function fetchSymbols() {
  return fetchJson(ENDPOINTS.symbols);
}

export function fetchProfiles() {
  return fetchJson(ENDPOINTS.profiles);
}

export function fetchStockProfile(symbol) {
  return fetchJson(ENDPOINTS.stockProfile(symbol));
}

/** Single request — reads all quotes from Redis cache via backend. */
export function fetchAllQuotes() {
  return fetchJson(ENDPOINTS.quotesAll);
}

/** Fetch live quotes for one or more symbols from Redis cache. */
export function fetchQuotesForSymbols(symbols) {
  const list = Array.isArray(symbols) ? symbols : [symbols];
  if (list.length === 0) return Promise.resolve([]);
  return fetchJson(ENDPOINTS.quotes(list));
}

export function fetchHistoricalOhlc(symbol, years = 10) {
  return fetchJson(ENDPOINTS.historicalOhlc(symbol, years));
}

export async function fetchHeatmapInputs() {
  const [symbols, profiles, quotes] = await Promise.all([
    fetchSymbols(),
    fetchProfiles(),
    fetchAllQuotes(),
  ]);

  return { symbols, profiles, quotes };
}

export function fetchLastRefreshTime() {
  return fetchJson(ENDPOINTS.quotesLastRefresh);
}
