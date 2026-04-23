<!-- .slide: data-background-gradient="linear-gradient(135deg, #0f172a 0%, #134e4a 55%, #eab308 140%)" data-color="#ffffff" -->

# Markdown To Slides

### 一个更完整的 reveal.js 演示样板

把阅读笔记整理成可讲、可投屏、可同步的演示稿。

<div style="margin-top: 28px; display: inline-block; padding: 10px 18px; border: 1px solid rgba(255,255,255,.25); border-radius: 999px; background: rgba(255,255,255,.08); font-size: .72em; letter-spacing: .08em; text-transform: uppercase;">
Paper Reading Workflow Demo
</div>

Note:
开场时只讲三件事：为什么分层、怎么写 slide、怎么同步。

---

<!-- .slide: data-background-gradient="linear-gradient(160deg, #f8fafc 0%, #ecfeff 52%, #dbeafe 100%)" -->

## 这套结构解决什么问题

- 原始阅读笔记通常太长，不适合直接投屏 <!-- .element: class="fragment" -->
- 演示稿需要更强的节奏感和页面结构 <!-- .element: class="fragment" -->
- Git 负责记录演化过程，避免“越改越乱” <!-- .element: class="fragment" -->

<div class="fragment" style="margin-top: 26px; padding: 20px 24px; border-radius: 20px; background: rgba(255,255,255,.7); box-shadow: 0 16px 35px rgba(15,23,42,.08);">
  <strong>一句话：</strong> <code>notes/</code> 存知识，<code>slides/</code> 存表达。
</div>

---

<!-- .slide: data-background-gradient="linear-gradient(135deg, #ffffff 0%, #f0fdf4 48%, #eff6ff 100%)" -->

## 项目结构

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 22px; margin-top: 24px; text-align: left;">
  <div style="padding: 20px 22px; border-radius: 22px; background: rgba(255,255,255,.78); box-shadow: 0 14px 36px rgba(15,23,42,.08);">
    <h3 style="margin-top: 0;">内容层</h3>
    <p><code>notes/</code>：原始阅读笔记</p>
    <p><code>slides/</code>：汇报用 Markdown</p>
    <p><code>docs/</code>：工作流与说明</p>
  </div>
  <div style="padding: 20px 22px; border-radius: 22px; background: rgba(255,255,255,.78); box-shadow: 0 14px 36px rgba(15,23,42,.08);">
    <h3 style="margin-top: 0;">展示层</h3>
    <p><code>src/index.html</code>：入口页</p>
    <p><code>src/main.js</code>：reveal.js 初始化</p>
    <p><code>src/theme.css</code>：视觉样式</p>
  </div>
</div>

---

<!-- .slide: data-background-gradient="linear-gradient(135deg, #0b3b36 0%, #164e63 100%)" data-color="#ffffff" -->

## 最基本的分页语法

```md
# 第一页

---

## 第二页

--

### 第二页的垂直子页

Note:
这里只给演讲者看
```

---

## 垂直页示例

这一页往下翻，还有同一主题下的补充内容。

--

<!-- .slide: data-background-gradient="linear-gradient(135deg, #ecfeff 0%, #cffafe 100%)" -->

## 垂直子页 A

适合放：

- 定义补充
- 实验细节
- 备选解释

--

<!-- .slide: data-background-gradient="linear-gradient(135deg, #fefce8 0%, #fde68a 100%)" -->

## 垂直子页 B

同一个主题可以先讲主结论，再往下补充证据。

---

<!-- .slide: data-background-gradient="linear-gradient(135deg, #fff7ed 0%, #ffedd5 100%)" -->

## 碎片动画 Fragment

- 先抛出问题 <!-- .element: class="fragment" data-fragment-index="1" -->
- 再展示方法 <!-- .element: class="fragment" data-fragment-index="2" -->
- 最后给出结论 <!-- .element: class="fragment" data-fragment-index="3" -->

<div style="margin-top: 28px; font-size: .9em; opacity: .8;">
每按一次方向键，只出现一部分内容。
</div>

Note:
这一页适合演示 reveal 的节奏控制，不要一次全展开。

---

<!-- .slide: data-background-gradient="linear-gradient(135deg, #eff6ff 0%, #e0f2fe 100%)" -->

## 代码高亮与行强调

```python [1-2|4-6|8-10]
from pathlib import Path

notes = Path("notes/paper.md").read_text(encoding="utf-8")

slides = [
    "# 论文题目",
    "## 核心问题",
    "## 方法概览",
]

print("\n---\n".join(slides))
```

<div style="margin-top: 18px; font-size: .8em;">
适合展示伪代码、脚本和实验命令。
</div>

---

<!-- .slide: data-background-gradient="linear-gradient(135deg, #fdf4ff 0%, #fae8ff 100%)" -->

## 表格、强调与引用

| 模块 | 用途 | 你平时怎么用 |
| --- | --- | --- |
| `notes/` | 记录原始想法 | 自由写 |
| `slides/` | 准备汇报内容 | 精炼写 |
| `docs/` | 留下规则和说明 | 稳定写 |

> 好的 slide 不是“内容少”，而是“每页只承担一个认知动作”。

你也可以混用 **加粗**、*斜体*、`行内代码` 和 [链接](https://revealjs.com/markdown/)。

---

<!-- .slide: data-background-gradient="linear-gradient(135deg, #ecfccb 0%, #d9f99d 100%)" -->

## 原生 HTML 混排

<div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; margin-top: 18px;">
  <div style="padding: 18px; border-radius: 20px; background: rgba(255,255,255,.74); box-shadow: 0 12px 28px rgba(15,23,42,.08);">
    <div style="font-size: .8em; letter-spacing: .06em; text-transform: uppercase; opacity: .7;">Step 1</div>
    <h3>Read</h3>
    <p>先把论文看懂，别急着做 slide。</p>
  </div>
  <div style="padding: 18px; border-radius: 20px; background: rgba(255,255,255,.74); box-shadow: 0 12px 28px rgba(15,23,42,.08);">
    <div style="font-size: .8em; letter-spacing: .06em; text-transform: uppercase; opacity: .7;">Step 2</div>
    <h3>Extract</h3>
    <p>提炼问题、方法、实验、结论。</p>
  </div>
  <div style="padding: 18px; border-radius: 20px; background: rgba(255,255,255,.74); box-shadow: 0 12px 28px rgba(15,23,42,.08);">
    <div style="font-size: .8em; letter-spacing: .06em; text-transform: uppercase; opacity: .7;">Step 3</div>
    <h3>Present</h3>
    <p>按讲述顺序组织，而不是按论文目录照抄。</p>
  </div>
</div>

---

<!-- .slide: data-background-gradient="linear-gradient(135deg, #111827 0%, #1e3a8a 100%)" data-color="#ffffff" -->

## 一个简单的讲述模板

1. 这篇论文想解决什么问题？
2. 它的方法和已有方法相比新在哪里？
3. 实验是否真的支撑结论？
4. 哪些点值得复现，哪些点值得质疑？

<div style="margin-top: 26px; padding: 18px 22px; border-left: 4px solid rgba(255,255,255,.55); background: rgba(255,255,255,.08); text-align: left;">
后面你每读一篇 paper，都可以直接复制这个 deck 改内容。
</div>

---

<!-- .slide: data-background-gradient="linear-gradient(135deg, #f8fafc 0%, #ecfeff 100%)" -->

## 下一步建议

- 在 `notes/` 新建一篇真实论文笔记
- 复制这个 `demo.md` 改成你的第一份汇报稿
- 先删掉花样页，只保留你真正会讲的内容
- 汇报前再考虑 PDF 导出和主题微调

<div style="margin-top: 26px; font-size: .82em; opacity: .78;">
这个 demo 的目标不是“炫技”，而是给你一份以后能持续复用的模板。
</div>
