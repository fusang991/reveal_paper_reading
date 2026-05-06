# reveal.js 最小使用说明

## 当前项目怎么工作

`src/index.html` 是入口页。

页面中的这一段会读取外部 Markdown：

```html
<section data-markdown="../slides/demo.md"></section>
```

`src/main.js` 负责初始化 reveal.js 和插件。

## 常用语法

### 水平分页

```md
---
```

### 垂直分页

```md
--
```

### 讲者备注

```md
Note:
这里只写给演讲者看的备注
```

### 代码块

~~~md
```python
print("hello")
```
~~~

## 常用操作

- 左右方向键：切换水平页
- 上下方向键：切换垂直页
- `Esc`：进入总览
- `S`：打开讲者视图
- `F`：全屏

## 官方文档

- https://revealjs.com/markdown/
- https://revealjs.com/pdf-export/
- https://revealjs.com/plugins/
