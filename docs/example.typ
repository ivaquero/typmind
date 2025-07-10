#import "@preview/typhorm:0.1.0": *
#import "@local/typmind:0.1.0": *

#let info = toml("../0.1.0/config/info.toml").zh
#set block(spacing: 0pt)

#title-box(info: info)[
  *Lesson Plan*
]

#tab-box(info: info)[
  *General Scheme*
]

#body-box(info: info)[
  *Mindmap*
  #v(30pt)

  #let data = csv("mindmap.csv")
  #let mmp = mmap-2layer(
    data,
    forward: "contain",
    backward: "support",
    label-side: center,
  ).body
  #mmp
]

// #with-index-tab-box2(
//   [idx],
//   [tab1],
//   [
//     #lorem(10)
//   ],
//   [tab2],
//   [
//     #lorem(50)
//   ],
// )

// #with-index-tab-box(
//   [idx],
//   [tab],
//   [
//     #lorem(20)
//   ],
// )

// #with-index-box2(
//   [idx1],
//   [
//     #lorem(50)
//   ],
//   [idx2],
//   [
//     #lorem(30)
//   ],
// )

// #with-index-box(
//   [idx],
//   [
//     #lorem(25)
//   ],
// )

// #with-index-tab4-box(
//   [idx],
//   [tab1],
//   [tab2],
//   [tab3],
//   [tab4],
// )

// #with-index-mat32-box(
//   [idx],
//   [
//     #lorem(25)
//   ],
//   [upper],
//   [60],
//   [
//     #lorem(5)
//   ],
//   [lower],
//   [30],
//   [
//     #lorem(5)
//   ],
// )

// // #with-mat31-box(
// //   [
// //     #lorem(25)
// //   ],
// //   [row1],
// //   [
// //     #lorem(15)
// //   ],
// //   [row2],
// //   [
// //     #lorem(5)
// //   ],
// //   [row3],
// //   [
// //     #lorem(5)
// //   ],
// // )
