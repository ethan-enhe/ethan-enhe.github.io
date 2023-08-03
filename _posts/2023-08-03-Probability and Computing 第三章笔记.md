---
layout:     post
title:      Probability and Computing 第三章笔记
date:       2023-08-03
author:     ethan-zhou
header-img: img/mark-basarab-1OtUkD_8svc-unsplash.jpg
catalog: true
tags:
    - 随机算法
---


## Markov's Inequality

若 X 恒大于0,则:

$$\Pr(x\ge a)\le \frac{\mathbb{E}[x]}a$$


## Moments

### 定义 
- kth moment of a random variable X is $\mathbb{E}[x^k]$
- variance $\mathrm{Var}[X]=\mathbb{E}[X^2]-(\mathbb{E}[X])^2$
- covariance $\mathrm{Cov}(X,Y)=\mathrm{E}[(X-\mathrm{E}[X])(Y-\mathrm{E}[Y])]$


### 定理
$$\mathrm{Var}[X+Y]=\mathrm{Var}[X]+\mathrm{Var}[Y]+2\cdot\mathrm{Cov}(X,Y)$$


### 独立变量的结论

X, Y independent.

- 期望乘积
$$\mathbb{E}[XY]=\mathbb{E}[X]\times \mathbb{E}[Y]$$
- $$\mathrm{Cov}(X,Y)=0$$
- $$\mathrm{Var}[X+Y]=\mathrm{Var}[X]+\mathrm{Var}[Y]$$ 
第一次知道这个结论()



- X is a Binomial Random Variable: $\mathrm{Var}[X]=np(1-p)$
- X is a Geometric Random Variable(略) $\mathrm{Var}[X]=\frac{1-p}{p^2}$

## Chebyshev's Inequality

$$\Pr(\| X-\mathbb{E}[X]\|\ge a)\le \frac{\mathrm{Var}[X]}{a^2}$$

**proof.** 设$Y=(X-\mathbb{E}[X])^2$,由马尔可夫不等式可得.

## Median and mean

- Median: $\Pr(X\le m)\ge 1/2 \text{ and } \Pr(X\ge m ) \ge 1/2$

### 定理

$$\|\mathbb{E}-m\|<\sigma$$

对LHS求期望,由琴生不等式可得.

## 随机化的线性中位数算法

随机采样 $n^\frac 34$ 个元素,排序后取排名 $\frac{n^\frac 34}2\pm\sqrt n$ 的元素,取这一值域区间内的所有元素,排序得到中位数.可以得到.

无输出的概率 $<\frac 1{n^{1/4}}$.求出采样元素中小于等于中位数元素个数的方差,并用切比雪夫不等式即证.
