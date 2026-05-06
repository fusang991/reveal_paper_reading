#set document(
  title: "AlexNet 与 ResNet 阅读笔记和报告",
  author: "paper_reading",
)

#set page(
  paper: "a4",
  margin: (x: 2.1cm, y: 1.8cm),
  numbering: "1",
)

#set text(
  font: ("Noto Serif CJK SC", "Microsoft YaHei", "SimSun"),
  size: 10.5pt,
  lang: "zh",
)

#set par(
  justify: true,
  leading: 0.72em,
)

#set heading(numbering: "1.1")

#let blue = rgb("#1f5fbf")
#let light-blue = rgb("#eef5ff")
#let gray-line = rgb("#d8dee9")
#let soft-gray = rgb("#f7f8fa")

#let callout(title, body) = block(
  fill: light-blue,
  stroke: (left: 3pt + blue),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *#title*

  #body
]

#let small-note(body) = block(
  fill: soft-gray,
  stroke: 0.5pt + gray-line,
  inset: 9pt,
  radius: 4pt,
  width: 100%,
)[#body]

#align(center)[
  #v(3cm)
  #text(size: 26pt, weight: "bold", fill: blue)[AlexNet 与 ResNet]

  #v(8pt)
  #text(size: 16pt)[从深度 CNN 的突破到超深网络的训练]

  #v(1.2cm)
  #text(size: 11pt, fill: rgb("#526070"))[阅读笔记与报告稿]

  #v(2cm)
  #table(
    columns: (auto, 1fr),
    stroke: 0.5pt + gray-line,
    inset: (x: 10pt, y: 7pt),
    [AlexNet],
    [ImageNet Classification with Deep Convolutional Neural Networks],
    [ResNet],
    [Deep Residual Learning for Image Recognition],
  )
]

#pagebreak()

= 阅读目标

这两篇论文都解决图像分类问题，但代表了深度卷积神经网络发展的两个关键阶段。

- AlexNet 证明了大规模数据、GPU 训练和深层 CNN 可以显著提升图像分类效果。
- ResNet 解决了网络继续加深后的训练退化问题，让上百层甚至上千层网络变得可训练。

#callout([核心线索], [
  AlexNet 回答“深度 CNN 能不能在大规模视觉任务中胜出”，ResNet 回答“网络继续变深以后如何还能训练好”。
])

== 论文信息

#table(
  columns: (auto, 1fr, 1.5fr, auto),
  stroke: 0.5pt + gray-line,
  inset: (x: 7pt, y: 6pt),
  table.header([*模型*], [*论文*], [*作者*], [*发表*]),
  [AlexNet],
  [ImageNet Classification with Deep Convolutional Neural Networks],
  [Alex Krizhevsky, Ilya Sutskever, Geoffrey Hinton],
  [NeurIPS 2012],
  [ResNet],
  [Deep Residual Learning for Image Recognition],
  [Kaiming He, Xiangyu Zhang, Shaoqing Ren, Jian Sun],
  [CVPR 2016],
)

= AlexNet 阅读笔记

== 研究背景

AlexNet 面向 ImageNet 大规模图像分类任务。当时传统方法仍大量依赖人工设计特征，而 AlexNet 使用端到端训练的卷积神经网络，在 ILSVRC 2012 中取得明显领先。

这篇论文的重要性不只是提出了一个网络结构，更重要的是展示了深度学习在大规模视觉任务上的潜力。

== 核心问题

#callout([AlexNet 想回答的问题], [
  在大规模标注数据集上，深层卷积神经网络是否能显著超过传统视觉方法？
])

为了回答这个问题，作者需要解决三个实际困难：

- 模型参数多，容易过拟合。
- 训练计算量大，需要 GPU 加速。
- 深层网络训练不稳定，需要合适的激活函数和正则化方法。

== 方法概览

AlexNet 是一个包含卷积层、池化层和全连接层的深层 CNN。

主要组成包括：

- 5 个卷积层
- 3 个全连接层
- ReLU 激活函数
- Max Pooling
- Dropout
- 数据增强
- GPU 并行训练

== 网络结构

#table(
  columns: (auto, 1.5fr, 2fr),
  stroke: 0.5pt + gray-line,
  inset: (x: 7pt, y: 6pt),
  table.header([*层级*], [*类型*], [*作用*]),
  [1],
  [卷积 + ReLU + 池化],
  [提取低级边缘和纹理特征],
  [2],
  [卷积 + ReLU + 池化],
  [提取更复杂的局部模式],
  [3],
  [卷积 + ReLU],
  [加深特征表达],
  [4],
  [卷积 + ReLU],
  [组合中层语义特征],
  [5],
  [卷积 + ReLU + 池化],
  [输出高级视觉特征],
  [6-8],
  [全连接层],
  [完成分类],
)

== 关键技术点

=== ReLU 激活函数

AlexNet 使用 ReLU 替代传统的 sigmoid 或 tanh。

```text
f(x) = max(0, x)
```

它的优势是计算简单，并且可以缓解梯度消失问题，使训练速度更快。

=== 数据增强

为了减少过拟合，AlexNet 使用了数据增强：

- 从原图中随机裁剪图像块
- 水平翻转图像
- 改变 RGB 通道强度

这些操作让模型看到更多变化后的样本，提高泛化能力。

=== Dropout

AlexNet 在全连接层使用 Dropout。Dropout 的思想是：训练时随机丢弃一部分神经元，避免模型过度依赖某些特征。

=== GPU 训练

由于当时单个 GPU 显存有限，AlexNet 使用两个 GPU 并行训练。这说明深度学习的突破不仅来自算法，也依赖硬件计算能力。

== 实验结果与贡献

AlexNet 在 ILSVRC 2012 图像分类任务中取得显著优势，top-5 错误率明显低于第二名方法。

这个结果说明：

- 深层 CNN 可以自动学习有效视觉特征。
- 大规模数据和 GPU 训练对深度学习非常关键。
- 端到端学习开始成为计算机视觉的主流方向。

AlexNet 的主要贡献可以总结为：

+ 证明深层 CNN 在大规模图像分类上非常有效。
+ 推动 ReLU、Dropout、数据增强等技术在视觉任务中普及。
+ 展示 GPU 对训练大型神经网络的重要性。
+ 开启了现代深度学习视觉模型的发展阶段。

== 局限

- 网络还不够深，表达能力有限。
- 全连接层参数很多，模型较大。
- 依赖人工设计的整体结构。
- 后续模型如 VGG、GoogLeNet、ResNet 在深度和效率上进一步改进。

#pagebreak()

= ResNet 阅读笔记

== 研究背景

AlexNet 之后，研究者发现增加网络深度通常能提升表达能力。但网络变深后，训练并不总是变好。

一个重要现象是：更深的网络在训练集上反而可能表现更差。这不是过拟合，而是优化困难导致的退化问题。

== 核心问题

#callout([ResNet 想回答的问题], [
  当神经网络非常深时，如何让它仍然容易训练，并且真正从深度中受益？
])

这里的关键不是简单防止过拟合，而是解决深层网络的优化难题。

== 退化问题

理论上，如果一个深层网络多出来的层什么都不做，它至少应该不比浅层网络差。

但实际训练中，普通深层网络可能出现：

- 训练误差变高
- 优化更困难
- 梯度传播不顺畅
- 深度增加但性能下降

这就是 ResNet 论文关注的退化问题。

== 残差学习

普通网络希望直接学习一个映射：

$ H(x) $

ResNet 不直接学习 $H(x)$，而是学习残差：

$ F(x) = H(x) - x $

所以输出可以写成：

$ H(x) = F(x) + x $

这里的 $x$ 通过 shortcut connection 直接传到后面，与残差分支相加。

== 残差块

一个基础残差块可以表示为：

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

这个结构让网络更容易学习接近恒等映射的函数。

== 为什么残差连接有效

残差连接的作用可以从几个角度理解：

- 信息可以直接跨层传播。
- 梯度可以更容易反向传播。
- 网络不需要每一层都重新学习完整映射。
- 如果新增层没有帮助，可以更容易接近恒等映射。

因此，ResNet 可以训练非常深的网络。

== 网络结构

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt + gray-line,
  inset: (x: 7pt, y: 6pt),
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

ResNet-50 及以上通常使用 bottleneck block，通过 `1x1` 卷积降低和恢复通道数，从而减少计算量。

== 实验结果与贡献

ResNet 在 ImageNet、COCO 等视觉任务上取得了强结果。

论文中的核心实验结论包括：

- 普通网络加深后会出现退化问题。
- 残差网络加深后仍然可以继续提升性能。
- 152 层 ResNet 可以有效训练，并在 ImageNet 竞赛中取得领先结果。
- 残差结构也能迁移到检测、定位等任务。

ResNet 的主要贡献可以总结为：

+ 明确提出深层网络中的退化问题。
+ 提出残差学习和 shortcut connection。
+ 让非常深的 CNN 变得可训练。
+ 成为后续视觉模型和其他深度模型的重要基础结构。

== 局限

- 网络仍然主要依赖卷积结构。
- 很深的模型计算成本较高。
- 残差连接解决了优化问题，但不是所有任务都只靠加深网络就能提升。
- 后续模型在注意力机制、结构搜索和 Transformer 架构上继续发展。

#pagebreak()

= AlexNet 与 ResNet 对比

== 核心差异

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.5pt + gray-line,
  inset: (x: 7pt, y: 6pt),
  table.header([*对比项*], [*AlexNet*], [*ResNet*]),
  [主要目标],
  [证明深层 CNN 在大规模分类上有效],
  [解决深层网络的训练退化问题],
  [关键创新],
  [ReLU、Dropout、GPU 训练、大规模 CNN],
  [残差学习、shortcut connection],
  [网络深度],
  [8 层左右],
  [可达到 50、101、152 层甚至更深],
  [主要影响],
  [开启深度学习视觉时代],
  [让超深网络成为主流],
  [关注重点],
  [如何训练一个大 CNN],
  [如何训练非常深的 CNN],
)

== 发展关系

+ AlexNet 证明深度学习路线是可行的。
+ 后续模型不断增加网络深度和结构复杂度。
+ 深度增加带来优化困难。
+ ResNet 用残差连接解决深层网络训练问题。

因此，AlexNet 是起点，ResNet 是深度 CNN 走向成熟的重要一步。

== 方法思想对比

#small-note[
  *AlexNet 的核心思想：* 用更大的数据、更强的计算和更深的 CNN 学习视觉特征。
]

#small-note[
  *ResNet 的核心思想：* 不让深层网络直接学习完整映射，而是学习相对于输入的残差。
]

这两个思想都很简单，但都改变了计算机视觉的发展方向。

#pagebreak()

= 报告稿

== 报告标题

AlexNet 与 ResNet：从深度 CNN 的突破到超深网络的训练

== 报告结构

+ 背景：为什么要研究深层 CNN
+ AlexNet：深度学习视觉突破
+ ResNet：深层网络训练问题
+ 对比：两篇论文的关系
+ 总结：对后续模型的影响

== 第 1 页：背景

计算机视觉早期大量依赖人工特征，例如 SIFT、HOG 等方法。

ImageNet 的出现提供了大规模标注数据，GPU 的发展提供了训练大型模型的计算能力。

在这个背景下，AlexNet 证明了深层 CNN 可以在大规模图像分类中取得远超传统方法的效果。

== 第 2 页：AlexNet 解决了什么问题

AlexNet 解决的问题是：如何在大规模图像分类任务上训练一个有效的深层卷积神经网络？

它的关键不是单个技巧，而是多个因素组合起来：

- 更深的 CNN
- ReLU
- Dropout
- 数据增强
- GPU 加速

== 第 3 页：AlexNet 的意义

AlexNet 的意义在于，它让研究者相信：

- 特征可以从数据中自动学习。
- 深度网络适合大规模视觉任务。
- 硬件、数据和模型结构必须一起发展。

AlexNet 之后，深度学习成为计算机视觉的主流方向。

== 第 4 页：为什么需要 ResNet

随着网络不断加深，研究者发现普通深层网络会出现退化问题。

退化问题的表现是：

- 网络更深，但训练误差更高。
- 模型不是过拟合，而是优化失败。
- 简单堆叠层数不能稳定提升效果。

这说明，想要继续加深网络，需要新的结构设计。

== 第 5 页：ResNet 的核心思想

ResNet 提出残差学习：

$ H(x) = F(x) + x $

其中：

- $x$ 是输入。
- $F(x)$ 是残差分支学习到的变化。
- $x$ 通过 shortcut connection 直接传到后面。

这样网络不必每层都重新学习完整映射，而是学习输入和输出之间的差异。

== 第 6 页：ResNet 为什么重要

ResNet 的重要性在于：

- 它让非常深的网络可以稳定训练。
- 它缓解了梯度传播和优化困难。
- 它成为大量视觉模型的基础结构。
- 它的残差思想后来也影响了很多非视觉模型。

== 第 7 页：两篇论文的对比

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.5pt + gray-line,
  inset: (x: 7pt, y: 6pt),
  table.header([*问题*], [*AlexNet*], [*ResNet*]),
  [面对的主要困难],
  [大规模 CNN 如何训练],
  [超深网络如何训练],
  [解决方式],
  [ReLU、Dropout、GPU、数据增强],
  [残差连接],
  [历史作用],
  [打开深度学习视觉时代],
  [推动超深网络成为可能],
)

== 第 8 页：总结

AlexNet 和 ResNet 分别代表了两个阶段：

- AlexNet 说明深度 CNN 是有效的。
- ResNet 说明 CNN 可以继续加深，并且仍然可以训练。

#callout([一句话结论], [
  AlexNet 让深度学习进入计算机视觉主流，ResNet 让深度网络真正变得很深。
])

= 个人理解

== 最值得记住的点

AlexNet 的重点不是某个单独模块，而是系统性地把数据、计算和网络结构结合起来。

ResNet 的重点不是简单增加层数，而是改变网络学习目标，让深层模型更容易优化。

== 可以进一步思考的问题

+ 如果没有 ImageNet，AlexNet 是否还能产生同样影响？
+ 残差连接为什么能在很多不同模型中复用？
+ 网络深度、参数量和计算量之间应该如何平衡？
+ 在 Transformer 时代，ResNet 的思想是否仍然重要？

== 最终结论

AlexNet 证明了深度卷积神经网络的威力，ResNet 解决了深层网络难以训练的问题。两者共同推动了现代计算机视觉的发展。
