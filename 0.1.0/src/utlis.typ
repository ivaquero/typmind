#import "deps.typ": *

#let ctext(
  label,
  size: .8em,
  font: "Songti SC",
) = text(
  label,
  size: size,
  font: font,
)

#let find-col-ind(data, col-name) = {
  for col-ind in range(1, data.at(0).len()) {
    let col = data.at(0).at(col-ind)
    if col == col-name {
      return col-ind
    }
  }
}

#let filter-col-ind(data, col-ind, value, string-func: none) = {
  let results = array(())
  results.push(data.at(0))

  for row-ind in range(1, data.len()) {
    let row = if type(value) == int { int(data.at(row-ind).at(col-ind)) } else { data.at(row-ind).at(col-ind) }

    if string-func != none {
      if string-func(row, value) {
        results.push(data.at(row-ind))
      }
    } else {
      if (row == value) {
        results.push(data.at(row-ind))
      }
    }
  }
  return results
}

#let filter-col-name(data, col-name, value, string-func: none) = {
  let results = array(())
  results.push(data.at(0))
  let col-ind = find-col-ind(data, col-name)

  for row-ind in range(1, data.len()) {
    let row = if type(value) == int { int(data.at(row-ind).at(col-ind)) } else { data.at(row-ind).at(col-ind) }

    if string-func != none {
      if string-func(row, value) {
        results.push(data.at(row-ind))
      }
    } else {
      if (row == value) {
        results.push(data.at(row-ind))
      }
    }
  }
  return results
}

#let rect-tilde-lower(node, extrude, color: gradient.radial(aqua, white)) = {
  let (w, h) = node.size.map(i => i / 2 + extrude)

  let hh = h * 1.5
  draw.rect(
    (-w, -hh),
    (+w, +hh),
    stroke: white,
    fill: color,
  )
  draw.line(
    (-w, -hh),
    (-w, +hh),
  )
  draw.line(
    (+w, -hh),
    (+w, +hh),
  )
  draw.line(
    (-w, +hh),
    (+w, +hh),
  )
  let eff = 1.25
  draw.arc-through(
    (-w, -hh),
    (-w / 2, -hh * eff),
    (0, -hh),
    fill: white,
  )
  draw.arc-through(
    (w, -hh),
    (w / 2, -hh / eff),
    (0, -hh),
  )
}
