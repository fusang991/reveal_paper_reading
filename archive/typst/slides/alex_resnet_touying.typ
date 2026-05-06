#import "@preview/touying:0.7.3": *
#import themes.simple: *

#show: simple-theme.with(
  aspect-ratio: "16-9",
)

#set text(
  font: ("Noto Sans CJK SC", "Microsoft YaHei", "SimSun"),
  lang: "zh",
  size: 20pt,
)

#set par(
  leading: 0.72em,
)

#let blue = rgb("#1f5fbf")
#let muted = rgb("#5b6472")
#let line = rgb("#d7dde8")
#let pale = rgb("#eef5ff")

#let key(body) = block(
  fill: pale,
  stroke: (left: 4pt + blue),
  inset: 12pt,
  radius: 5pt,
  width: 100%,
)[#body]

#let small(body) = text(size: 16pt, fill: muted)[#body]

= AlexNet 与 ResNet

从深度 CNN 的突破到超深网络的训练

#v(1em)

#small[阅读笔记与报告稿]

== 论文信息

#table(
  columns: (auto, 1fr, auto),
  stroke: 0.6pt + line,
  inset: (x: 8pt, y: 6pt),
  table.header([*模型*], [*论文*], [*发表*]),
  [AlexNet],
  [ImageNet Classification with Deep Convolutional Neural Networks],
  [NeurIPS 2012],
  [ResNet],
  [Deep Residual Learning for Image Recognition],
  [CVPR 2016],
)

#pause

#key[
  AlexNet 证明深层 CNN 在大规模视觉任务上有效；ResNet 解决网络继续加深后的训练退化问题。
]

== 报告结构

+ 背景：为什么要研究深层 CNN
+ AlexNet：深度学习视觉突破
+ ResNet：深层网络训练问题
+ 对比：两篇论文的关系
+ 总结：对后续模型的影响

= AlexNet

== 背景

AlexNet 面向 ImageNet 大规模图像分类任务。

当时传统方法仍大量依赖人工设计特征，例如 SIFT、HOG 等。

#pause

#key[
  AlexNet 的意义不只是提出一个网络结构，而是证明端到端训练的深层 CNN 可以显著超过传统视觉方法。
]

== AlexNet 要解决的问题

#key[
  在大规模标注数据集上，深层卷积神经网络是否能显著超过传统视觉方法？
]

#pause

实际困难：

- 模型参数多，容易过拟合。
- 训练计算量大，需要 GPU 加速。
- 深层网络训练不稳定，需要合适的激活函数和正则化方法。

== AlexNet 方法概览

AlexNet 是一个包含卷积层、池化层和全连接层的深层 CNN。

#pause

主要组成：

- 5 个卷积层
- 3 个全连接层
- ReLU 激活函数
- Max Pooling
- Dropout
- 数据增强
- GPU 并行训练

== AlexNet 网络结构

#table(
  columns: (auto, 1.2fr, 1.8fr),
  stroke: 0.6pt + line,
  inset: (x: 7pt, y: 5pt),
  table.header([*层级*], [*类型*], [*作用*]),
  [1],
  [卷积 + ReLU + 池化],
  [低级边缘和纹理特征],
  [2],
  [卷积 + ReLU + 池化],
  [更复杂的局部模式],
  [3-5],
  [卷积 + ReLU],
  [中高层视觉特征],
  [6-8],
  [全连接层],
  [完成分类],
)

== AlexNet 关键技术

- *ReLU*：计算简单，缓解梯度消失，训练更快。
- *数据增强*：随机裁剪、水平翻转、RGB 强度扰动。
- *Dropout*：减少全连接层过拟合。
- *GPU 训练*：让大规模 CNN 训练成为现实。

#pause

#key[
  AlexNet 的突破来自模型、数据、正则化和硬件的组合，而不是单一技巧。
]

== AlexNet 实验与贡献

AlexNet 在 ILSVRC 2012 图像分类任务中取得显著优势。

#pause

主要贡献：

+ 证明深层 CNN 在大规模图像分类上非常有效。
+ 推动 ReLU、Dropout、数据增强等技术普及。
+ 展示 GPU 对训练大型神经网络的重要性。
+ 开启现代深度学习视觉模型的发展阶段。

== AlexNet 局限

- 网络还不够深，表达能力有限。
- 全连接层参数很多，模型较大。
- 整体结构仍依赖人工设计。
- 后续模型在深度、效率和结构设计上继续改进。

= ResNet

== 为什么需要 ResNet

AlexNet 之后，研究者发现增加网络深度通常能提升表达能力。

但网络变深后，训练并不总是变好。

#pause

#key[
  更深的普通网络在训练集上反而可能表现更差。这不是过拟合，而是优化困难导致的退化问题。
]

== ResNet 要解决的问题

#key[
  当神经网络非常深时，如何让它仍然容易训练，并且真正从深度中受益？
]

#pause

普通深层网络可能出现：

- 训练误差变高
- 优化更困难
- 梯度传播不顺畅
- 深度增加但性能下降

== 残差学习

普通网络希望直接学习：

$ H(x) $

#pause

ResNet 不直接学习 $H(x)$，而是学习残差：

$ F(x) = H(x) - x $

#pause

因此输出写成：

$ H(x) = F(x) + x $

== 残差块

```text
输入 x
  |
  |-------- shortcut --------|
  |                          |
卷积 -> BN -> ReLU -> 卷积 -> BN
  |                          |
  |-------- 相加 <-----------|
             |
            ReLU
             |
           输出
```

#pause

#key[
  shortcut connection 让信息和梯度可以更直接地跨层传播。
]

== 为什么残差连接有效

- 信息可以直接跨层传播。
- 梯度可以更容易反向传播。
- 网络不需要每一层都重新学习完整映射。
- 如果新增层没有帮助，可以更容易接近恒等映射。

#pause

#key[
  ResNet 改变的不是“层数更多”这个表面现象，而是深层网络的学习目标。
]

== ResNet 常见版本

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.6pt + line,
  inset: (x: 7pt, y: 5pt),
  table.header([*模型*], [*深度*], [*特点*]),
  [ResNet-18],
  [18 层],
  [较轻量，常用于基础任务],
  [ResNet-34],
  [34 层],
  [使用基础残差块],
  [ResNet-50],
  [50 层],
  [使用 bottleneck 残差块],
  [ResNet-101],
  [101 层],
  [更深，表达能力更强],
  [ResNet-152],
  [152 层],
  [论文中的重要深层模型],
)

== ResNet 实验与贡献

论文中的核心实验结论：

- 普通网络加深后会出现退化问题。
- 残差网络加深后仍然可以继续提升性能。
- 152 层 ResNet 可以有效训练。
- 残差结构也能迁移到检测、定位等任务。

#pause

主要贡献：提出残差学习和 shortcut connection，让非常深的 CNN 变得可训练。

== ResNet 局限

- 网络仍然主要依赖卷积结构。
- 很深的模型计算成本较高。
- 残差连接解决优化问题，但不是所有任务都只靠加深网络就能提升。
- 后续模型在注意力机制、结构搜索和 Transformer 架构上继续发展。

= 对比

== 核心差异

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.6pt + line,
  inset: (x: 7pt, y: 5pt),
  table.header([*对比项*], [*AlexNet*], [*ResNet*]),
  [主要目标],
  [证明深层 CNN 有效],
  [解决深层网络退化问题],
  [关键创新],
  [ReLU、Dropout、GPU、数据增强],
  [残差学习、shortcut connection],
  [网络深度],
  [8 层左右],
  [50、101、152 层甚至更深],
  [历史作用],
  [开启深度学习视觉时代],
  [让超深网络成为主流],
)

== 发展关系

+ AlexNet 证明深度学习路线是可行的。
+ 后续模型不断增加网络深度和结构复杂度。
+ 深度增加带来优化困难。
+ ResNet 用残差连接解决深层网络训练问题。

#pause

#key[
  AlexNet 是起点，ResNet 是深度 CNN 走向成熟的重要一步。
]

== 方法思想对比

#key[
  *AlexNet：* 用更大的数据、更强的计算和更深的 CNN 学习视觉特征。
]

#pause

#key[
  *ResNet：* 不让深层网络直接学习完整映射，而是学习相对于输入的残差。
]

== 总结

AlexNet 和 ResNet 分别代表了两个阶段：

- AlexNet 说明深度 CNN 是有效的。
- ResNet 说明 CNN 可以继续加深，并且仍然可以训练。

#pause

#key[
  AlexNet 让深度学习进入计算机视觉主流，ResNet 让深度网络真正变得很深。
]

= 讨论

== 最值得记住的点

AlexNet 的重点不是某个单独模块，而是系统性地把数据、计算和网络结构结合起来。

#pause

ResNet 的重点不是简单增加层数，而是改变网络学习目标，让深层模型更容易优化。

== 可以进一步思考的问题

+ 如果没有 ImageNet，AlexNet 是否还能产生同样影响？
+ 残差连接为什么能在很多不同模型中复用？
+ 网络深度、参数量和计算量之间应该如何平衡？
+ 在 Transformer 时代，ResNet 的思想是否仍然重要？
