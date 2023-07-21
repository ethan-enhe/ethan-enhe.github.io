---
layout:     post
title:      Probability and Computing 第一章笔记
subtitle:   能不能出题?
date:       2023-07-21
author:     ethan-zhou
header-img: img/post-bg-YesOrNo.jpg
catalog: true
tags:
    - 随机算法
---

最近看 Probability and Computing, 在此记录一些重要结论和有趣算法.

## Polynomial Identities

多项式次数为d,则x在\[0,100d\]随机取值,仅有$\frac{1}{100}$概率错误(根据代数基本定理,f-g最多有d个根).

## 一些基本定义和引理:

- 概率定义
- 容斥原理
- 事件的独立性
- 条件概率 $\Pr(E\|F)=\frac{\Pr(E\cap F)}{\Pr(F)}$

## Veryfying Matrix Multiplication

给定三个方阵 A,B,C 快速验证 $A\times B=C$?
**随机算法** 随机一个向量 $r\in \{0,1\}^n$,对比 $A\times B\times r =C\times r$

**定理** 若 $AB\neq C$,则错误概率$<\frac 12$

> 注: 证明用到 principle of deferred decision

## Law of Total Probability

$E_1,E_2,E_3...$ mutually disjoint in $\Omega$, $\cup E_i=\Omega$, then

$$
\Pr(B)=\sum \Pr(B\cap E_i)=\sum \Pr(B|E_i)\Pr(E_i)
$$

## Bayes' Law

$E_1,E_2,E_3...$ mutually disjoint in $\Omega$, $\cup E_i=\Omega$, then

$$
\Pr(E_j| B)=\frac{\Pr(E_j\cap B)}{\Pr(B)}=\frac{\Pr(E_j\cap B)}{\sum \Pr(B|E_i)\Pr(E_i)}
$$

## Union Bound

## Naive Bayesian Classifier

在假设样本各个feature独立分布的情况下,可以简化求 feature 相同的概率的求法.将复杂度从 feature length 的指数级降到 feature 的多项式.

## Randomized min-cut

n-1 次随机选择一条边,合并其两端的点.有 $\frac{2}{n(n-1)}$ 的概率输出一个最小割.

**proof** 设某个最小割大小为k,则过程中,任意时刻,每个点的度数都大于等于k,可以得到边数下界,并且这一步没有删掉任何一个割边的概率是:

$$
P\ge \frac{nk/2-k}{nk/2}
$$

全部乘起来得到 $\frac{2}{n(n-1)}$

将算法进行 $n(n-1)\ln(n)$ 轮则失败概率小于 $\frac 1 {n^2}$
