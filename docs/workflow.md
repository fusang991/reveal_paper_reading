# Marp 工作流

## 1. 写阅读笔记

先在 `notes/` 下新建 Markdown 文件，记录论文的完整阅读过程。

例子：

```text
notes/2026-04-resnet.md
```

这一层不需要考虑排版，只需要把问题、方法、实验、结论和自己的理解写清楚。

## 2. 提炼幻灯片

需要汇报时，在 `slides/` 下新建 Marp 文件。

例子：

```text
slides/2026-04-resnet_marp.md
```

文件开头使用 Marp front matter：

```md
---
marp: true
theme: default
paginate: true
size: 16:9
math: mathjax
---
```

每一页用 `---` 分隔。

## 3. 控制每页内容

建议一页只讲一个重点：

- 背景页：说明问题为什么重要。
- 方法页：只放核心机制。
- 实验页：只放最关键的结果。
- 对比页：用表格压缩信息。
- 总结页：给出一句明确结论。

封面页和结束页可以使用：

```md
<!--
_class: lead
-->
```

这会让当前页使用 Marp 的 `lead` 样式。

## 4. 本地预览

在项目根目录运行：

```bash
npm run dev
```

Marp 会启动本地预览服务器。打开终端显示的地址后，选择 `slides/` 下的 Markdown 文件查看效果。

## 5. 导出结果

导出 HTML：

```bash
npm run build
```

导出 PDF：

```bash
npm run pdf
```

导出 PPTX：

```bash
npm run pptx
```

如果只想导出某一个文件，也可以直接运行：

```bash
npx marp slides/alex_resnet_marp.md -o slides/alex_resnet_marp.html
```

## 6. Git 同步

完成一个阶段后执行：

```bash
git add .
git commit -m "add marp slides"
```

建议提交源文件 `.md`。导出的 `.html`、`.pdf`、`.pptx` 是否提交，可以按实际分享需求决定。

## 7. 旧内容归档

旧的 reveal.js、Typst 和早期 Markdown 草稿已经移动到 `archive/`：

- `archive/revealjs/`
- `archive/typst/`
- `archive/markdown-drafts/`
