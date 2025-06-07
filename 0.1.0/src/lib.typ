#import "utlis.typ": *

#let mmap-2layer(
  data,
  spacing: 21pt,
  forward: none,
  backward: none,
  label-side: left,
  y1-coef: (1.5, -4),
  y2-coef: (1.05, -3),
) = {
  let root = filter-col-name(data, "layer", 0).at(1).at(2)
  let nodes1 = filter-col-name(data, "layer", 1)
  let nodes2 = filter-col-name(data, "layer", 2)
  let ori = (0, 0)

  diagram(
    spacing: spacing,
    node-stroke: black,

    node(ori, [#root], shape: rect),

    for row-idx in range(1, nodes1.len()) {
      let name = nodes1.at(row-idx).at(2)
      let idx-base = nodes1.at(row-idx).at(0)
      let sub-nodes2 = filter-col-idx(nodes2, 0, idx-base, string-func: str.starts-with)

      let x0 = 1
      let (x1, x2, x3) = (x0 + .5, x0 + 1.8, x0 + 3.2)
      let y1 = y1-coef.at(0) * row-idx * sub-nodes2.len() / nodes1.len() + y1-coef.at(1)

      node((x1, y1), [#name], shape: rect)
      edge(ori, (x1, y1), "-|>", label: ctext(forward), label-side: label-side)

      for row-idx2 in range(1, sub-nodes2.len()) {
        let name2 = sub-nodes2.at(row-idx2).at(2)
        let y2 = y1 + row-idx2 * y2-coef.at(0) + y2-coef.at(1)

        node((x2, y2), [#name2])
        edge((x1, y1), (x2, y2), "-|>", label: ctext(forward), label-side: label-side)

        let supp = sub-nodes2.at(row-idx2).at(3)

        if supp.ends-with(regex("\\w")) {
          let name2-supp = sub-nodes2.at(row-idx2).at(3)

          edge((x3, y2), (x2, y2), "-|>", label: ctext(backward), label-side: label-side)

          let shape = if supp.ends-with("instance") { document } else { rect }

          node((x3, y2), [#name2-supp], shape: shape)
        }
      }
    },
  )
}
