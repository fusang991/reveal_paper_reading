# 最基本的工作流

## 1. 记笔记

先在 `notes/` 下新建一个 Markdown 文件，按你的习惯记录论文阅读内容。

例子：

```text
notes/2026-04-attention.md
```

## 2. 提炼演示稿

需要汇报时，在 `slides/` 下新建一个演示 Markdown，把笔记整理成适合投屏展示的内容。

例子：

```text
slides/2026-04-attention-talk.md
```

建议一页只讲一个点，避免长段落。

## 3. 本地预览

在项目根目录运行：

```bash
npm run dev
```

然后打开：

```text
http://localhost:8000/src/
```

如果你想切换要展示的 Markdown，可以修改 `src/index.html` 里的 `data-markdown` 路径。

## 4. 迭代修改

边看页面边改 `slides/*.md`，刷新浏览器查看效果。

## 5. Git 同步

完成一个阶段后执行：

```bash
git add .
git commit -m "add new paper slides"
```

如果你后面接 GitHub，再执行：

```bash
git remote add origin <your-repo-url>
git push -u origin master
```

## 6. 导出 PDF

后面需要导出时，打开：

```text
http://localhost:8000/src/?print-pdf
```

再用浏览器打印为 PDF。`reveal.js` 官方推荐使用 Chrome 或 Chromium。
