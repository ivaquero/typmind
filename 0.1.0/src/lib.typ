#import "utlis.typ": *

#let mmap-2layer(data, spacing: 21pt) = {
  let root = filter-col-name(data, "Layer", 0).at(1).at(2)
  let nodes1 = filter-col-name(data, "Layer", 1)
  let nodes2 = filter-col-name(data, "Layer", 2)

  diagram(
    spacing: spacing,
    node-stroke: black,
    node((0, 0), [#root], shape: rect),

    for row-ind in range(1, nodes1.len()) {
      let name = nodes1.at(row-ind).at(2)
      let ind-base = nodes1.at(row-ind).at(0)

      let x0 = 1
      let (x1, x2, x3) = (x0 + .5, x0 + 2, x0 + 2.95)
      let y1 = (row-ind * 1.5 - 3)

      node((x1, y1), [#name], shape: rect)
      edge((0, 0), (x1, y1), "-|>", label: ctext("包含"), label-side: center)

      let nodes-with = filter-col-ind(nodes2, 0, ind-base, string-func: str.starts-with)

      for row-ind2 in range(1, nodes-with.len()) {
        let name2 = nodes-with.at(row-ind2).at(2)
        let y2 = y1 * 2.5 + (row-ind2 - 1) * 1.25

        node((x2, y2), [#name2])
        edge((x1, y1), (x2, y2), "-|>", label: ctext("包含"), label-side: center)

        let supp = nodes-with.at(row-ind2).at(3)

        if supp.ends-with(regex("\\w")) {
          let name2-supp = nodes-with.at(row-ind2).at(3)

          edge((x3, y2), (x2, y2), "-|>", label: ctext("包含"), label-side: center)

          let shape = if supp.ends-with("instance") { rect-tilde-lower } else { rect }

          node((x3, y2), [#name2-supp], shape: shape)
        }
      }
    },
  )
}
