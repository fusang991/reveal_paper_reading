---
marp: true
theme: default
paginate: true
size: 16:9
math: mathjax
---

<!--
_class: lead
-->

# Marp 基础 Demo

用 Markdown 写一套更像普通幻灯片的报告

---

# 适合什么场景

Marp 适合这种工作流：

- 用 Markdown 快速写 slide
- 导出 PDF 或 PPTX
- 保持文件简单，方便 Git 管理
- 不想写太多 HTML / CSS / Typst 语法

---

# 一页只讲一个重点

论文汇报里，每一页最好只承担一个任务：

1. 提出问题
2. 解释方法
3. 展示结果
4. 给出结论

---

# 对比表

| 工具 | 优点 | 缺点 |
| --- | --- | --- |
| reveal.js | 网页交互强 | 默认像网页大字 |
| Marp | Markdown 简单，导出方便 | 复杂排版需要 CSS |
| Typst | PDF 排版好 | 学习成本更高 |
| LaTeX | 学术生态成熟 | 写起来比较重 |

---

# 公式

ResNet 的残差学习可以写成：

$$
H(x) = F(x) + x
$$

其中：

- $x$ 是输入
- $F(x)$ 是残差分支
- $H(x)$ 是最终映射

---

# 代码

```python
from pathlib import Path

slides = Path("slides/demo_marp.md").read_text(encoding="utf-8")
pages = slides.split("---")

print(f"共 {len(pages)} 页")
```

---

# 简单布局

## AlexNet

- 证明深层 CNN 在 ImageNet 上有效
- 使用 ReLU、Dropout、数据增强和 GPU 训练
- 开启现代视觉深度学习阶段

## ResNet

- 解决深层网络退化问题
- 使用残差连接
- 让超深 CNN 变得可训练

---

# 结论

如果你的目标是：

- 保持 Markdown 简单
- 快速做论文汇报
- 导出 PDF / PPTX
- 不想投入太多排版学习成本

Marp 是比裸 reveal.js 更值得先试的方案。

---

<!--
_class: lead
-->

# Thank You

下一步可以把 `alex_resnet.md` 改成 Marp 版本。
