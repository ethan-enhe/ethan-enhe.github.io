---
layout:     post
title:      Probability and Computing 第二章笔记
date:       2023-07-26
author:     ethan-zhou
header-img: img/mark-basarab-1OtUkD_8svc-unsplash.jpg
catalog: true
tags:
    - 随机算法
---

## Linearity of Expectations

(不要求独立)

$$\mathbb{E}[\sum X_i]=\sum \mathbb{E}[X_i]$$


## 琴生不等式

$f(x)$为凸函数,则$\mathbb{E}[f(x)]>f(\mathbb{E}[x])$,利用泰勒展开证明即可.

## binomial random variable
$$\Pr(X=j)=\binom n j p^j (1-p)^{n-j}$$

### 性质
- $\mathbb{E}[X]=np$

### 应用

考虑一个函数 S.每次调用它,S 都会递归调用 X 次自己.其中 X 是二项式概率分布的变量.求 S 的期望调用次数.按照调用的代数分析,发现只与上一代调用的次数期望相关.分析可得调用次数的期望为公比为 np 的等比数列和.

## 条件期望

### 定义

$$\mathbb{E}[Y|Z]=f(z)=\mathbb{E}[Y|Z=z]$$

### 定理

$$\mathbb{E}[Y]=\mathbb{E}[\mathbb{E}[Y|X]]$$

## The Geometric Distribution

$$\Pr(X=n)=(1-p)^{n-1}p$$

类似玩一个游戏, 输 n-1 把之后, 赢一把的概率

$$\mathbb{E}[X]=\sum \Pr(X\ge i)=\frac{1}p$$

## Coupon Collector's Problem

每个球是n种颜色均匀随机.期望拿多少个球才能集齐n种颜色.

令 $X_i$ 为恰好有 i 种球时拿的球数.则答案为 $\sum X_i$

而 $X_i$ 满足 Geometric distribution, $p=1-\frac{i-1}n,\mathbb{E}[X_i]=\frac{n}{n-i+1}$

从而答案为 $n \ln n +\Theta(n)$

## 快排复杂度(略)
