# Paper Reading Slides

这个项目用于把论文阅读笔记整理成 Marp 幻灯片。

当前主工作流已经迁移到 Marp：用 Markdown 写内容，用 Marp 预览和导出 HTML / PDF / PPTX。

## 目录

- `notes/`：原始论文阅读笔记，按自己的理解自由记录。
- `slides/`：Marp 幻灯片源文件和导出结果。
- `docs/`：项目工作流说明。
- `assets/`：图片、结构图、实验截图等素材。
- `archive/`：旧方案归档，包括 reveal.js、Typst 和早期 Markdown 草稿。

## 快速开始

安装依赖：

```bash
npm install
```

启动 Marp 预览服务器：

```bash
npm run dev
```

然后在浏览器里打开终端显示的本地地址，选择 `slides/` 下的 Markdown 文件预览。

## 常用命令

```bash
npm run dev
```

启动 Marp 本地预览。

```bash
npm run build
```

把 `slides/*.md` 导出为 HTML。

```bash
npm run pdf
```

把 `slides/*.md` 导出为 PDF。

```bash
npm run pptx
```

把 `slides/*.md` 导出为 PPTX。

## Marp 文件格式

每个 Marp 幻灯片文件以 front matter 开头：

```md
---
marp: true
theme: default
paginate: true
size: 16:9
math: mathjax
---
```

用 `---` 分隔页面：

```md
# 第一页

---

# 第二页
```

封面页或结束页可以使用 Marp 的局部页面指令：

```md
<!--
_class: lead
-->

# 标题页
```

这段内容不会显示在页面上，但 Marp 会读取它，让当前页使用 `lead` 样式。

## 当前示例

- `slides/demo_marp.md`：Marp 基础 demo。
- `slides/alex_resnet_marp.md`：AlexNet 与 ResNet 阅读报告。

对应的 `.html` 文件是导出结果，可以直接用浏览器打开。

## 推荐工作流

1. 在 `notes/` 里写完整阅读笔记。
2. 在 `slides/` 里新建 Marp 文件。
3. 每页只保留一个重点。
4. 用 `npm run dev` 预览。
5. 用 `npm run build` 或 `npm run pdf` 导出。

## 旧方案归档

旧的 reveal.js 入口和 demo 已移动到：

```text
archive/revealjs/
```

旧的 Typst / Touying 文件已移动到：

```text
archive/typst/
```

早期长版 Markdown 草稿已移动到：

```text
archive/markdown-drafts/
```
