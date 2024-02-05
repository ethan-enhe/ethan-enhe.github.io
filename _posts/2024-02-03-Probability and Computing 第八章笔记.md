---
layout:     post
title:      Probability and Computing 第八章笔记
subtitle:   泊松过程——最独立的一集
date:       2024-02-03
author:     ethan-zhou
header-img: img/mark-basarab-1OtUkD_8svc-unsplash.jpg
catalog: true
tags:
    - 随机算法
---

这一章节前面不少内容偏概念，和概统课讲的一样，下面主要记录泊松过程和连续马尔可夫过程分布的一些性质，泊松分布给我的直观感受就是，什么统计量之间都是独立的。

## Balls and bins with feedback

> 两个 bin，分别有 x，y 个球的时候，再来一个球，以 $\frac {x^p}{x^p+y^p}$ 的概率进入第一个 bin，剩下概率进入第二个 bin。初始 $x=y=1$

- $p=1$ 时，n 轮之后 x 均匀分布
- $p>1$ 时，with  probability 1 there exist a number c such that one of the two bins get no more than c balls.

考虑两个 bin 分别接球，每个球和下一个球到来的时间间隔分别满足参数为 $x^p$ 与 $y^p$ 的指数分布。这种设定完全等价于原来的设定，因为两个指数分布变量 a，b 最小值取 a 的概率就是他们的参数之比。

然后记 $F_1,F_2$ 表示两个 bin 接收到无限个球花费的时间，其期望是收敛的，因为两者相等的概率为 0，从而得证。

## 泊松过程

### 定义
- $N(0)=0$
- 时间上的平移不变性 $N(t+s)-N(s)$ 和 $N(t)$ 同分布
- $\lim _{t\rightarrow 0}\Pr(N(t)=1)/t=\lambda$
- $\lim _{t\rightarrow 0}\Pr(N(t)=2)/t=0$

### 基本性质

- $N(t)\sim Poisson(\lambda t)$
- $X_i=\text{第i个事件与第i-1个事件的间隔时间}\sim exponential(\lambda)$，独立同分布

### 合并与分裂
- 两个参数为 $\lambda_1,\lambda_2$ 的独立的泊松过程合并（$N(t)=N_1(t)+N_2(t)$）起来，形成参数为 $\lambda_1+\lambda_2$ 的泊松过程
- 一个泊松过程中的每个事件，以 $p$ 的概率设为 type1, $1-p$ 设为 type2，则 type1，2 的事件形成两个独立的，参数为 $\lambda p,\lambda (1-p)$ 的泊松过程。

### 条件分布

- $N(t)=1$ 的条件下，$X_1$ 满足均匀分布
- $N(t)=n$ 的条件下， n 个事件的到达时间与 n 个均匀随机变量排序之后同分布。

## 连续时间的马尔可夫过程

**定义** 对 $\forall s,t\ge 0,X(s+t)$ 只与 $X(t)$ 相关，而与 $t$ 之前时刻的状态独立。

**表示方法**
- 转移概率矩阵 $P_{i,j}$ 表示从 i 状态转移到的下一个状态是 j 的概率
- 参数向量 $(\theta_1, \theta_2\ldots)$，表示从 i 状态转移到下一个状态前，等待的事件符合 $exponential(\theta_i)$ 分布。

### 平稳分布

$$\lim_{t\rightarrow \infty} P_{j,i}(t)=\pi_i$$

对 $P_{j,i}(t)$ 求导为 0,可得结论：

$$\pi_i \theta_i=\sum_k \pi_k \theta_kp_{k,i} $$

当所有参数 $\theta_i$ 都相等时，上述式子与离散时间的马尔可夫过程相同。

## 例子 Markovian Queues

懒得写了

PASTA 原则: If a Markov process with Poisson arrivals has a stationary distribution and the fraction of time the system is in state $k$ is $\pi_k$, then $\pi_k$ is also the proportion of arrivals that find the system in state k when they arrive.
