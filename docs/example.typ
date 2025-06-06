#import "@local/typhorm:0.1.0": *
#import "@local/typmind:0.1.0": *

#let info = toml("../0.1.0/config/info.toml").zh
#set block(spacing: 0pt)

#title-box(info: info)[
  *《大数据》专业基础课教案*
]

#tab-box(info: info)[
  *2024第1学期 第6次课*
]

#body-box(info: info)[
  *知识建模图：*

  本节知识建模图

  #let data0 = csv("mindmap.csv")
  #let mmp = mmap-2layer(data0).body
  #mmp
]

#idx-tab-body-box2(
  [学习目标],
  [知识点],
  [#lorem(10)],
  [素质目标],
  [#lorem(50)],
)

#idx-tab-body-box(
  [学习先觉知识],
  [知识点],
  [#lorem(20)],
)

#idx-body-box2(
  [课上资源],
  [#lorem(50)],
  [课下资源],
  [#lorem(30)],
)

#idx-body-box(
  [活动目标],
  [#lorem(25)],
)

#idx-tab4-box(
  [学习序列],
  [学习目标],
  [地点],
  [时间],
  [学习资源],
)

#idx-body-mat23-box(
  [学习序列],
  [#lorem(25)],
  [课上],
  [60],
  [#lorem(5)],
  [课下],
  [30],
  [#lorem(5)],
)

#body-mat31-box(
  [#lorem(25)],
  [任务描述],
  [#lorem(15)],
  [任务时长],
  [#lorem(5)],
  [学习地点],
  [#lorem(5)],
)
