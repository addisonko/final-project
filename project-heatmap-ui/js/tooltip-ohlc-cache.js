import { fetchHistoricalOhlc } from "./api.js";
import { TOOLTIP_SPARKLINE_YEARS } from "./config.js";

const cache = new Map();

export function getTooltipOhlc(symbol) {
  const key = symbol.toUpperCase();
  if (!cache.has(key)) {
    cache.set(
      key,
      fetchHistoricalOhlc(key, TOOLTIP_SPARKLINE_YEARS).catch(() => []),
    );
  }
  return cache.get(key);
}
