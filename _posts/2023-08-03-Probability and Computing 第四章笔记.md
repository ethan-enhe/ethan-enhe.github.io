---
layout:     post
title:      Probability and Computing 第四章笔记
date:       2023-08-03
author:     ethan-zhou
header-img: img/mark-basarab-1OtUkD_8svc-unsplash.jpg
catalog: true
tags:
    - 随机算法
---


## Moment Generating Functions

$$M_X(t)=\mathbb{E}[e^{tX}]$$

### 性质

- $M_X^{(n)}(0)=\mathbb{E}[X^n]$
- X,Y 独立,则 $M_{X+Y}(t)=M_X(t)M_Y(t)$

## Chernoff Bounds

根据上述生成函数和马尔可夫不等式

可以得到:

- $\Pr(X\ge a)\le \min_{t>0}\frac{\mathbb{E}[e^tX]}{e^{ta}}$
- $\Pr(X\le a)\le \min_{t<0}\frac{\mathbb{E}[e^tX]}{e^{ta}}$

(有点类似指数高度的感觉,用指数函数的快速变化来得到更紧的界)

### 应用

- Sum of Poisson Trails 的三个 bound
- n 个以 $\frac 12$ 概率为 $\pm 1$ 变量之和的 bound: $\Pr(X\ge a) \le e^{-a^2/2n}$
- 根据上述结论, A 为 0/1 矩阵,b 为随机的 $\pm 1$ 向量,则 $A\times b$ 的结果向量中,某一项 $\ge \sqrt{4m\ln n}$ 的概率 $\le \frac 2{n^2}$ 根据union bound 存在一项 $\ge \sqrt{4m\ln n}$ 的概率 $\le \frac 2n$

## Hoeffding Bound

$X_i$ 满足 $\Pr(a\le X_i \le b)=1$,并且 $\mathbb{E}[X_i]=\mu$

则 $\Pr(\|\frac 1n \sum X_i-\mu\| \ge\epsilon)\le 2e^{-2n\epsilon^2/(b-a)^2}$

### 推论

$X_i$ 满足 $\Pr(a_i\le X_i \le b_i)=1$,并且 $\mathbb{E}[X_i]=\mu_i$

则 $\Pr(\|\sum X_i-\sum \mu\| \ge\epsilon)\le 2e^{-2n\epsilon^2/\sum(b_i-a_i)^2}$

似乎和 hoeffding bound 证明差不多,原证明精细一点即可
