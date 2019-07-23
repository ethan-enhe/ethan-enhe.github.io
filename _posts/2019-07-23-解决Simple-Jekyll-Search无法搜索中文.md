---
layout:     post
title:      解决Simple-Jekyll-Search无法搜索中文
subtitle:   html中input元素在输入中文拼音时出现的问题
date:       2019-07-23
author:     ethan-zhou
header-img: img/post-bg-re-vs-ng2.jpg
catalog: true
tags:
    - 前端
    - javascript
---

通过jekyll搭建的博客，如果想要实现博文的搜索功能大多都只能借助一个叫Simple-Jekyll-Search的搜索插件。于是我也照着网上的教程，给我的博客加上了这个功能（页面左上角"blog-e"旁边）。

一切按照教程弄好，是可以搜索了，当一旦我在搜索框中输入中文，就无法搜索到任何相关的内容。而且我还发现，不仅是我的博客，甚至发布这篇教程的网站上都无法搜索中文。

首先是错误的复现，我发现一旦我采用微软拼音输入法在chorme和ie里面登上网站并输入中文搜索时，就会搜不到任何结果。进一步，我将搜索的文字复制到剪贴板中，再粘到输入框里，搜索就成功了！此外在手机上搜索中文也能得到正确的结果。

经过反复的错误排查，我认为这有可能是拼音输入法在输入时，比如说要打“世界你好”这个词，但在敲下`<Space>`确认输入之前，`shijienihao`这些拼音已经被该插件实时获取并当成了正常的输入流。于是它搜索的关键词变成了`shijienihao世界你好`，当然就搜不到了。

经过进一步查询，得知这是在js实时获取输入框内容时常常遇到的一类问题。[参考这篇文章](https://blog.csdn.net/qq_37160920/article/details/80022062)

于是我便修改了该插件的js源码，实现了对中文输入的支持。首先查看了搜索框的Event Listeners，锁定了该插件用于实时获取输入框的内容的是这段代码：
```javascript
function registerInput () {
options.searchInput.addEventListener('keyup', function (e) {
  if (isWhitelistedKey(e.which)) {
	emptyResultsContainer()
	search(e.target.value)
  }
})
}
```
于是我改成了这样，这个问题就解决了！

```javascript
function registerInput () {
options.searchInput.addEventListener('input', function (e) {
setTimeout(function(e){
  if ((!is_input_chinese) && isWhitelistedKey(e.which)) {
  emptyResultsContainer()
  search(e.target.value)
  }
},0,e)
})
options.searchInput.addEventListener('compositionstart', function () {
 is_input_chinese=true;
})
options.searchInput.addEventListener('compositionend', function () {
 is_input_chinese=false;
})
}
```

当然我在最开头的地方也定义了`is_input_chinese`这个布尔数啦！
