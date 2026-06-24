export const SECTOR_HEADER_HEIGHT = 22;
export const INDUSTRY_HEADER_HEIGHT = 20;

export function layoutHeatmap(hierarchy, width, height) {
  const sectorChildren = hierarchy.map((s) => ({
    name: s.name,
    value: s.value,
    industries: s.industries,
  }));
  const sectorRoot = layoutChildren(sectorChildren, width, height);
  sectorRoot.children?.forEach((sectorNode) => {
    const sw = sectorNode.x1 - sectorNode.x0;
    const sh = sectorNode.y1 - sectorNode.y0;
    const bodyH = Math.max(0, sh - SECTOR_HEADER_HEIGHT);
    const industryChildren = sectorNode.data.industries.map((i) => ({
      name: i.name,
      value: i.value,
      stocks: i.stocks,
    }));
    sectorNode.industryRoot = layoutChildren(industryChildren, sw, bodyH);
    sectorNode.industryRoot?.children?.forEach((industryNode) => {
      const iw = industryNode.x1 - industryNode.x0;
      const ih = industryNode.y1 - industryNode.y0;
      const stockBodyH = Math.max(0, ih - INDUSTRY_HEADER_HEIGHT);
      const stockChildren = industryNode.data.stocks.map((stock) => ({
        name: stock.symbol,
        value: stock.value,
        stock,
      }));
      industryNode.stockRoot = layoutChildren(stockChildren, iw, stockBodyH);
    });
  });
  return sectorRoot;
}

function layoutChildren(children, width, height) {
  if (width <= 0 || height <= 0) return null;
  const root = d3.hierarchy({ name: 'root', children })
    .sum((d) => d.value)
    .sort((a, b) => b.value - a.value);
  d3.treemap()
    .tile(d3.treemapSquarify.ratio(1))
    .size([width, height])
    .paddingInner(2)
    (root);
  return root;
}
