---
layout:     post
title:      Improved Decoding of Expander Codes 学习笔记
date:       2024-07-20
author:     ethan-zhou
header-img: img/home-bg-m42.jpg
catalog: true
tags:
    - 编码理论
---
原论文：

Xue Chen, Kuan Cheng, Xin Li, and Minghui Ouyang. 2023. Improved Decoding of Expander Codes. IEEE Trans. Inf. Theor. 69, 6 (June 2023), 3574–3589. <https://doi.org/10.1109/TIT.2023.3239163>

## The size-expansion tradeoff

**Thm.** Any $(\alpha N,(1-\varepsilon D)$ expander is also roughly a $(k \alpha N,(1-k \varepsilon D))$ expander.


> Note:
>
> 只要一个点集的 expansion rate $> \frac{1}{2}$ 就说明依然存在 unique neighbors
>
> 通过这里的 tradeoff 可以把多余的 $\varepsilon$ 转化较大的 $\|S\|$
>
> 取 $k=\frac{1}{2 \varepsilon}$ 依然可以满足要求，从而证明本文的主要结果：expander code dis $\ge \frac{\alpha D}{2\varepsilon}$

**Proof Sketch.** 
- $T\subset L$, $N(T)$ 很小 $\rightarrow$  $S\sim {T\choose \alpha N}$, $E[N(S)]$ 也很小

通过两种不同的放缩，得到：

- $\|N(T)\|\ge (1-k \varepsilon )D\times k \alpha N-O(\varepsilon D\times k^2)$
- $\|N(T)\|\ge (1-\frac{2k \varepsilon-1}{3-\frac{2}{k}} )D\times k \alpha N-O(\cdots)$

第二个 bound 对 $k>\frac{1}{2\varepsilon}$ 时候更紧。

### 第二个界的证明想法及其完整结果

假设右侧有 $\beta_i  \times  \alpha N$ 个点与 $S$ 中恰好 i 个点相连，则有约束（约束的答案是 expansion 的下界）：

$$
\begin{aligned}
\min& \sum \beta_i\cr
\text{s.t.}& \sum i\cdot  \beta_i=k\cr
&\sum (1-(1-\frac{1}{k})^j)\cdot \beta _j\ge 1-\varepsilon \cr
&\beta _j\ge 0.
\end{aligned}
$$

其中第二条来自于 $N(T)$ 中每个点与 $S$ 相连的概率，这个分析唯一不紧的地方来自这里（实际上这里的概率是 $\frac{(\|S\|-\|T\|)!/(\|S\|-\|T\|-j)!}{\|S\|!/(\|S\|-j)!}=1-\left( \frac{\|S\|-\|T\|}{\|S\|} \right)^j+O(\frac{j}{S})$）


（对这个 O 里面的东西我不太确定，试着放缩了几次没有得到一样的结果，但是 k 大一点的时候应该不会很大）

写出这个 LP(1) 的对偶形式 LP(2)：

$$
    \begin{aligned}
\max\ &x_{1}\cdot k+(1-\varepsilon )\cdot x_{2}\cr
\text{s.t. }&j\cdot x_{1}+(1-(1-\frac{1}{k})^j)\cdot x_{2}\le 1\cr
    &x_{1},x_{2}\ge 0.
\end{aligned}
$$

**Lem** LP(1) 的最优解中，仅仅有两个相邻的 $\beta _i,\beta _{i+1}$ 非零.

**Proof Sketch.** 若 $\beta_j\neq 0$，根据线性规划的相关定理，一定有对偶形式中的对应约束取等，即： $j\cdot x_{1}+(1-(1-\frac{1}{k})^j)\cdot x_{2}= 1$. 然而因为 $(1-(1-\frac{1}{k})^j)$ 严格上凸，所以如果存在两个非相邻的 $\beta_l,\beta _r$ 都大于零，则可以推断在他们之间的 $\forall j\in [l,r],j\cdot x_1+(1-(1-\frac{1}{k})^j)>1$，都无法满足 LP(2) 中的限制。

直观上讲，右边的点与左边 $S$ 相连的边数越平均，越接近这个bound。

接下来，我们考虑最优解中哪两个 $\beta_i,\beta_{i+1}$ 非零，就可以解出相应的 $x_{1},x_{2}$，使得对应约束等号取等。然后就可以得到对偶形式答案的一个下界。

- 假如取 $i=2$，可以得到 $x_{1}=\frac{2-\frac{1}{k}-k}{3-\frac{2}{k}},x_{2}=\frac{k^2}{3-\frac{2}{k}}$, 带入 $x_{1}\cdot k+(1-\varepsilon )\cdot x_{2}$ 就得到第二个 bound
- 假如取 $i=1$ 就可以得到上一个结果。


文章里还提到，当 $1-\varepsilon \in [\frac{k}{j+1}(1-(1-\frac{1}{k})^{j+1}),\frac{k}{j}(1-(1-\frac{1}{k})^j)]$ 的时候，LP(2) 会在 $\beta_j,\beta _{j+1}\neq 0$ 处极值。


对于一般的 $j$:

$$
\begin{aligned}
    x_{2}&=\frac{1}{1-(1+\frac{j}{k})(1-\frac{1}{k})^j},\cr
    x_{1}&=-x_{2}\cdot \frac{(1-\frac{1}{k})^j}{k}=\frac{-\frac{1}{k}\cdot (1-\frac{1}{k})^j}{1-(1+\frac{j}{k})(1-\frac{1}{k})^j}.
\end{aligned}
$$

对应 expansion 下界：

$$
\begin{aligned}
   \|N(T)\|&\ge  \alpha N\cdot (x_{1}\cdot k+(1-\varepsilon )\cdot x_{2})\cr
&\ge  \alpha N\cdot (1-\varepsilon -(1-\frac{1}{k})^j)x_{2}\cr
   &\ge \alpha N\cdot \frac{1-\varepsilon -(1-\frac{1}{k})^j}{1-(1+\frac{j}{k})(1-\frac{1}{k})^j}.
\end{aligned}
$$

### Expander Code Dis Upperbound
**Thm.** 对于任何一个 $\varepsilon,\eta$ 都能找到一个 $\alpha,D$ ($\alpha$ 可能比较小，$D$ 可能要比较大)，使得一个 $(\alpha N,(1-\varepsilon -\eta ))$ expander code dis $\le \frac{\alpha N}{2 \varepsilon}$

**Idea:** 通过 Ramanujan Graph 的 vertex-edge graph 构造出来一个左侧 D,右侧 2 regular 的二分图，其中左侧 $\frac{\alpha }{2\varepsilon }N$ 个点。其余的点数用随机二分图补齐。

因为 expander mixing lemma 可以得到原图 edge expansion 的下界，对应到这个图上就是 vertex expansion.

这样，这个子图中的 bits 全取 1 就构成一个 codeword，这样的图在右侧不是 regular 的，后面提到一个 open question 是能不能构造一个左右都 regular 的图。

> Note: 为什么 Ram-Graph 的点数不能更小一点？
> 
> expander mixing lemma: $E(S,S)\approx \frac{D}{2\|V(H)\|}\cdot \|S\|^2\le \varepsilon \|S\|D$，其中 $S$ 是 $\alpha N$，从而 $V(H)$ 必须大于 $\frac{\alpha}{2\varepsilon}N$。


## Finding a superset of flipped bits

![](https://pic.imgdb.cn/item/668765b0d9c307b7e9368d43.png)

**Lem.** 若对 $F$ (被翻转的 bits) 的任意子集 $S$，都有 $U(S)\ge (1-2\Delta)D\|S\|$，则上述算法找到的 $L\supseteq F$。

**Proof Sketch.** 若否，在$F-L$ 中可以找到一个贡献超过 $(1-2 \Delta)D$ 个 unique neighbors 的点 $v$，其贡献的 UN 中至少有一个点没有被加入 $R$ 中，从而该点与 $L$ 也不相连，也是 $F$ 的 UN，因此这个 parity check 一定不满足，与其不在 $R$ 中矛盾。

**性质:**
- 上述过程按照任意顺序加点得到的 $L$ 总是一致的
- 若满足上面引理的条件，则总存在一种加点顺序，把 $F$ 中的点恰好全加到 $L$。

有时候，还可以通过某些条件证明最终 $\|L\|\le k \alpha N$，后面很多地方用到了类似的 argument：

**Proof Sketch.** 
假设已知 $F$ 的 expansion 为 $(1-\gamma )D$

若否，我们考虑算法过程进行到一半，已经加入 $k \alpha N$ 的情形。我们总能假定先加入了所有 $F$ 中的点，从而有：

$$
    (1-k \varepsilon ) k D \alpha N-O(\ldots ) \le \|N(L)\| \le (1-\gamma )D\|F\|+2 \Delta D (k \alpha N -\|F\|)
.$$

其中不等式第一部分来自 size-expansion tradeoff, 第二部分来自将 $F$ 加入 $L$ 后，每个新加的节点最多贡献 $2\Delta D$ 个新点到 $R$ 中。

化简得到：

$$
    \|F\|\ge k \alpha N \frac{1-k \varepsilon -2 \Delta }{1-\gamma -2 \Delta} +O(\ldots )
.$$

如果此时通过某些条件可以得到 $F$ 的实际大小比这小，则可以推出矛盾。


## Guessing expansion

![](https://pic.imgdb.cn/item/6688aa12d9c307b7e948eae3.png)

这一算法对于 $\forall \varepsilon = \frac{1}{4}-\beta$ 的 expansion,都可以纠正 $(1-\varepsilon)\alpha N$ 个错。假定我们知道 $F$ 的 expansion $(1-\gamma )D\|F\|$，我们会有如下高效的做法：

- 若 $\gamma > \frac{2}{3}\varepsilon$ 则直接用上一个 section 算法找出 $F$ 的超集，并且这一集合大小小于 $\alpha  n$ (用之前提到的 argument)，直接用 Viderman 的 erasure 的算法可以求解。
- 若 $\gamma \le  \frac{2}{3}\varepsilon$ 则找到 $S=\{v\mid v\in L, \|N(V)\cap C\|\ge (1-3 \gamma)\}$，可以证明翻转 $S$ 中 bits 时，$F$ 会减小 $\beta$ 的比例。

    **Proof Sketch.** 先用类似之前的 argument 说明 $\|F_i\cup L_{0}\|\le \frac{(1+3 \eta )\|F_i\|}{(1-\varepsilon )}$。随后可以求出 $\|F_i\|$ 和 $\|L_{0}-F_i\|$ 之间的比例，再根据 $F_i$ 的 UN 数给出 $\|F_i-L_{0}\|$ 的一个上界。

然而我们不知道，所以只能每次猜测一个 $\gamma$，把 $(0,1)$ 分为 $1/\eta=(100/\beta)$ 段 (而非是 $n\times m$ 个分数)，然后要猜对 $l=\log_{1-\beta}1/3$ 次，所以额外复杂度 $\eta^{-l}$，对 $\beta$ 是指数级的，只是这里当作 $\beta$ 是常数，所以算是 $O(1)$。

## Improved decoding for $\varepsilon \le \frac{1}{8}$

这部分对于较小的 $\varepsilon$ 给出了解码半径 $\frac{\sqrt{2}-1 }{2\varepsilon}\alpha N>\frac{3}{16}\alpha N$ 的算法。

![](https://pic.imgdb.cn/item/668a1a23d9c307b7e9a51b3d.png)

下面是这部分一个比较有意思的结论。

**Clm.** 假设已知 $\|F\|=x \alpha N, \|N(F)\|= \|F\|(1-\gamma)D$，则 $\forall F'\subset F,\|F'\|\ge \alpha N$ 都有 $\|N(F')\|\ge \|F'\|D(1-\sqrt{\varepsilon \gamma x})$

**Proof Sketch.** 假设 $\|N(F')\|\ge \|F'\|D(1-\beta )$，则根据 tradeoff 可以得到 $\|F'\|$ 大小的下界，随后再因为 $F'$ 中的 collision 比 $F$ 中的总数要少，可以得到 $\beta$ 的上界。

根据前面 `Find` 的性质，这一 $\Delta$ 的选取意味着 `Find` 总能包含所有出错的bits.

后面就是又用相似的 argument 证明了 `Find` 找到的集合大小一定小于 $\frac{1-2 \varepsilon }{2\varepsilon}\alpha N$。
