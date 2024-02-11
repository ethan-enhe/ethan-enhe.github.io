---
layout:     post
title:      Probability and Computing 第八章部分习题
date:       2024-02-11
author:     ethan-zhou
header-img: img/mark-basarab-1OtUkD_8svc-unsplash.jpg
catalog: true
tags:
    - 随机算法
---

### 单变量正态分布

#### Moment Generating Function

$$M_X(t)=e^{t^2\sigma^2/2+\mu t}$$

#### Chernoff bound

$$\Pr(\|\frac{X-\mu}{\sigma}\|\ge a)\le 2e^{-a^2/2}$$

### 中心极限定理

#### 二项分布的极限

n 充分大时，$B(n,p)$ 的概率分布趋近于与其同方差与均值的正态分布。

#### 中心极限定理

$X_1,X_2\cdots X_n$ 独立同分布，则：

$$\lim_{n\rightarrow \infty}\Pr(a\le \frac{\overline X-\mu}{\sigma / \sqrt{n}} \le b)\rightarrow(\text{in distribution})\Phi(b)- \Phi(a)$$ 

使用下面的定理证明

#### Levy's Continuuity Theorem 

动量函数依分布收敛于 $M(t)$，则概率分布也依分布收敛于 $M(t)$ 对应的概率分布函数 $F(t)$（只要 $F$ 连续）

#### Berry-Esseen Theorem（特殊情况下，中心极限定理的一致收敛版本）

其他条件与中心极限定理相同，设 $\rho=E[\|X_i-\mu\|^3]$

$$\|\Pr(\frac{\overline X-\mu}{\sigma / \sqrt{n}} \le a)-\Phi(a)\|\le C\rho/(\sigma^3\sqrt{n})$$

### 多变量正态分布

(概统课上没搞明白)

将一组独立同分布的标准正态分布随机变量，进行线性组合之后，变出 n 个新变量 $(Y_1\cdots Y_n)^T=A(X_1\cdots X_n)^T+\mu$，他们两两之间的协方差满足：

$$Cov(Y_i,Y_j)=\sum_k{a_{k,i}a_{k,j}}$$

#### 概率密度

若 A 满秩，则$Y\le y'\leftrightarrow X\le A^{-1}(y'-\mu)$，从而得到概率密度函数：

$$1/\sqrt{(2\pi)^n|\Sigma|}\cdot e^{-\frac 12(y-\mu)^T\Sigma^{-1}(Y-\mu)},\Sigma=AA^T$$

#### 性质

这部分没太懂，之后再回来看

### 应用（生成一个正态分布的随机变量）

**setting：** 已有一个生成 $[0,1]$ 随机数的生成器，拿他生成一个正态分布的随机变量。
**难搞的点：** 正态分布函数没有解析表达式，无法直接把 $[0,1]$ 映射上去。
**idea：**
- 中心极限定理，逼近
- Box-Muller transform: 假设在二维平面上，P 点 $(x,y)$ 坐标的分布符合独立的正态分布，则其极坐标 $(r,\theta)$ 中角度和半径分布互相独立，并且 $F(r)=1-e^{-r^2/2}$，可以把 $[0,1]$ 映射上去。得到极坐标之后，转成直角坐标即可。
- 如何取代上述算法中的 $\sin,\cos$? 在 $[-1,1]^2$ 中随机撒点，如果不在单位圆里面，就抛弃。

### 最大似然近似（概统学过，略）

### EM 算法
