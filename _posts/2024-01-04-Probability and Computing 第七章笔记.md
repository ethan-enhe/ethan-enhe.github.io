---
layout:     post
title:      Probability and Computing 第七章笔记
date:       2024-01-04
author:     ethan-zhou
header-img: img/mark-basarab-1OtUkD_8svc-unsplash.jpg
catalog: true
tags:
    - 随机算法
---

突然发现，上次发博客还是上次了，因此，我打算打算一下，简单写个笔记记录一下这章内容。

## Notation
- $r^t_{i,j}$: 从i开始走，t时刻恰好第一次到j的概率
- $h_{i,j}$: 从i开始走，第一次到j的期望步数

## Definition
略

## Classification of States
### 连通性
- accessible: $\exist n,\text{ s.t.} P^n_{i,j}>0$
- communicate: i,j 双向联通
- 若整个链是一个 communicating class / 对应的图强连通，则称其 irreducible

### 状态分类（重现性）
- recurrent: 访问过该状态后，一定会再回来
- trainsient: 访问过该状态后，以固定的概率P会再回来
- positive recurrent: $h_{i,i}$ 收敛的状态
- null recurrent: $h_{i,i}$ 发散的状态，只可能在无限状态的链中出现

**Lemma.** 有限状态机至少有一个 recurrent 状态，且所有 recurrent 状态都是 positive recurrent。

### 周期性&遍历性

- periodic: 访问过 i 后，每次返回 i 的时间一定是某个 x(x>2) 的倍数。若所有状态都是 periodic,则称整个链是 periodic。aperiodic 反之。
- ergodic: aperiodic + positive recurrent

**Corallary.** finite, irreducible, aperiodic Markov chain -> ergodic chain

## Stationary Distribution

**Theorem.** finite irreducible ergodic Makov chain P:
- 有唯一的平稳分布
- $\pi_i=\lim_{t\rightarrow\infty} P^t_{j,i}=1/h_{i,i}$ （感性理解，每 $h_{i,i}$ 时刻回到 i 节点一次，所以稳态分布中在 i 的概率为 $1/h_{i,i}$）

不加证明（证明没看完）

**Theorom(Cut-set).** S=a set of states, in stationary distribution, the probability that leaves S=the probability that enters S.（易证，感性理解：电荷守恒）

**Theorom(Time reversible MC).** if $\forall i,j, \pi_i P_{i,j}=\pi_j P_{j,i}$，则 $\pi$ 为平稳分布，此时称这个链是时间可逆的。

证明：$\sum_i \pi_i P_{i,j}=\sum_i \pi_j P_{j,i}=\pi_j$

**Therom.** irreducible aperiodic Markov chain 分为两类：
- ergodic
- not state is positive recurrent.


## RW on undirect graphs

**Lemma.** A RW on G is aperiodic = G is not bipartite

注：在无向图随机游走时，对于任何偶数n,都可以先走n/2步，再原路返回。因此aperiodic等价于有奇环。

**Theorom.** RW on G, 其平稳分布为：

$$\pi_v=\frac{d(v)}{2\|E\|}$$

### Cover Time & Commute Time
- Cover Time: $\max_v(\text{expected time to visit all nodes by a RW starting from v})$

**Lemma(bound on commute time).** if $(u,v)\in E$, commute time $h_{u,v}+h_{v,u}\le 2\|E\|$

这个证明挺妙的：设 D 中的状态为 E 中所有的边对应的两个方向的有向边（总共$2\|E\|$个状态）而其中状态的含义为：在E上游走的第t步采用了这条有向边。

容易验证，D的平稳分布是 $\vec 1/2\|E\|$，从而在访问过 $u\rightarrow v$ 后，再重新走一次这条边的期望时间为(假设 i 为 $u\rightarrow v$ 在D中对应状态) $h_{i,i}=1/\pi_i=2\|E\|$。因为这只是 $v\rightarrow u \rightarrow v$ 的一种方法，期望时间就已经小于 $2\|E\|$ 了，得证。

**Lemma(bound on cover time).** cover time $C_G \le 2\|E\|(\|V\|-1)$

造一个生成树，期望的遍历时间根据前一个引理也被bound住，得证。

**Lemma(bound on cover time, Mattews' theorem).** $C_G \le H(n-1)\max_{u\neq v}(h_{u,v})$, where $H(n)=\sum _{i=1}^n 1/i$.

随机选一个排列 $Z$，游走过程中枚举$Z_{1\sim n}$，如果出现过就跳过，没出现过（也就是$Z_i$ 在前缀中出现时间最晚，因为Z是随机选的，概率为 $1/i$）就加上 hitting time. 使用类似 coupon collector 的分析即可得到期望的游走长度 $\le H(n-1)\max_{u\neq v}(h_{u,v})$。

## Application

### An s-t Connectivity Algorithm

判断st是否联通，直接从 s 开始随机游走 $2n^3$ 步，看是否能到 t. 根据前面 commute time 的 bound 和 markov bound 可以知道错误概率小于 $1/2$。

### Parrondo Paradox

~~没看完，咕咕~~

2024-1-31 更新

内容比较多，懒得写了，一些比较有意思的分析方法：

- absorbing state，分析 game B 的时候，用到了一个 $z_i$，其定义是：当前比对方多赢i，求最终变动到 $i\le -3$ 的概率
- 镜像，有点类似 oi 中统计从矩阵中左下角走到右上角，并且不穿过对角线的方案数。可以把翻转前后的方案一一对应
