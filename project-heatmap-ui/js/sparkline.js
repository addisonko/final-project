/** Extract close prices from OHLC rows, optionally downsampled. */
export function downsampleCloses(rows, maxPoints = 120) {
  const closes = rows
    .map((row) => Number(row.close))
    .filter((value) => Number.isFinite(value));
  if (closes.length <= maxPoints) return closes;

  const step = (closes.length - 1) / (maxPoints - 1);
  const sampled = [];
  for (let i = 0; i < maxPoints; i++) {
    sampled.push(closes[Math.round(i * step)]);
  }
  return sampled;
}

export function getSparklineColor(percentChange) {
  const value = Number(percentChange) || 0;
  if (value > 0) return "#2ea043";
  if (value < 0) return "#c93c37";
  return "#656d76";
}

export function drawSparkline(
  container,
  closes,
  { color = "#656d76", width, height } = {},
) {
  container.replaceChildren();
  if (!closes || closes.length < 2) return false;

  const w = width || container.clientWidth || 260;
  const h = height || container.clientHeight || 56;
  const padX = 2;
  const padY = 4;
  const innerW = w - padX * 2;
  const innerH = h - padY * 2;

  const min = Math.min(...closes);
  const max = Math.max(...closes);
  const range = max - min || 1;

  const points = closes.map((value, index) => {
    const x = padX + (index / (closes.length - 1)) * innerW;
    const y = padY + innerH - ((value - min) / range) * innerH;
    return `${x.toFixed(1)},${y.toFixed(1)}`;
  });

  const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
  svg.setAttribute("viewBox", `0 0 ${w} ${h}`);
  svg.setAttribute("preserveAspectRatio", "none");
  svg.setAttribute("aria-hidden", "true");

  const path = document.createElementNS("http://www.w3.org/2000/svg", "path");
  path.setAttribute("d", `M ${points.join(" L ")}`);
  path.setAttribute("fill", "none");
  path.setAttribute("stroke", color);
  path.setAttribute("stroke-width", "1.5");
  path.setAttribute("stroke-linecap", "round");
  path.setAttribute("stroke-linejoin", "round");

  svg.appendChild(path);
  container.appendChild(svg);
  return true;
}
