#import "utlis.typ": *

#let mmap-2layer(data, spacing: 21pt, y1-coef: (1.5, -4), y2-coef: (1.05, -3)) = {
  let root = filter-col-name(data, "Layer", 0).at(1).at(2)
  let nodes1 = filter-col-name(data, "Layer", 1)
  let nodes2 = filter-col-name(data, "Layer", 2)
  let ori = (0, 0)
  let y1s = range(-int(nodes2.len() / 2), int(nodes2.len() / 2))
  let y2s = range(-int(nodes2.len() / 2), int(nodes2.len() / 2))

  diagram(
    spacing: spacing,
    node-stroke: black,

    node(ori, [#root], shape: rect),

    for row-ind in range(1, nodes1.len()) {
      let name = nodes1.at(row-ind).at(2)
      let ind-base = nodes1.at(row-ind).at(0)
      let sub-nodes2 = filter-col-ind(nodes2, 0, ind-base, string-func: str.starts-with)

      let x0 = 1
      let (x1, x2, x3) = (x0 + .5, x0 + 1.8, x0 + 3.2)
      let y1 = y1-coef.at(0) * row-ind * sub-nodes2.len() / nodes1.len() + y1-coef.at(1)

      node((x1, y1), [#name], shape: rect)
      edge(ori, (x1, y1), "-|>", label: ctext("包含"), label-side: center)

      for row-ind2 in range(1, sub-nodes2.len()) {
        let name2 = sub-nodes2.at(row-ind2).at(2)
        let y2 = y1 + row-ind2 * y2-coef.at(0) + y2-coef.at(1)

        node((x2, y2), [#name2])
        edge((x1, y1), (x2, y2), "-|>", label: ctext("包含"), label-side: center)

        let supp = sub-nodes2.at(row-ind2).at(3)

        if supp.ends-with(regex("\\w")) {
          let name2-supp = sub-nodes2.at(row-ind2).at(3)

          edge((x3, y2), (x2, y2), "-|>", label: ctext("支持"), label-side: center)

          let shape = if supp.ends-with("instance") { rect-tilde-lower } else { rect }

          node((x3, y2), [#name2-supp], shape: shape)
        }
      }
    },
  )
}
