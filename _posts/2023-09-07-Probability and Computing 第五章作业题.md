---
layout:     post
title:      Probability and Computing 第五章作业题
date:       2023-09-07
author:     ethan-zhou
header-img: img/mark-basarab-1OtUkD_8svc-unsplash.jpg
catalog: true
tags:
    - 随机算法
---

## 题目

![](https://pic.imgdb.cn/item/64f92740661c6c8e542dfa0f.jpg)
![](https://pic.imgdb.cn/item/64f927d5661c6c8e542e21dd.jpg)

## 模拟代码（第二问）


```cpp
bool f[MXN];
#define ls(x) ((x) << 1)
#define rs(x) (((x) << 1) | 1)
#define bro(x) ((x) ^ 1)
#define fa(x) ((x) >> 1)

queue<ll> q;
ll n, cnt;
ll chk(ll r) {
  ll cnt = (ll)f[r] + f[ls(r)] + f[rs(r)];
  if (cnt == 2) {
    if (!f[r])
      return r;
    if (!f[ls(r)])
      return ls(r);
    return rs(r);
  }
  return 0;
}
void upd(ll x) {
  if (x == 0 || f[x])
    return;
  f[x] = 1;
  ++cnt;
  if (x > 1)
    upd(chk(fa(x)));
  if (ls(x) < (1 << n))
    upd(chk(x));
}

ll arr[MXN];
int main() {
  // ios::sync_with_stdio(0);
  // cin.tie(0);
  for (n = 1; n <= 10; n++) {
    cout << n << endl;
    for (ll i = 1; i < (1 << n); i++)
      arr[i] = i;
    for (ll i = 1; i <= 10; i++) {
      shuffle(arr + 1, arr + 1 + n, mr);
      memset(f, 0, sizeof(f));
      cnt = 0;
      ll round = 0;
      while (1) {
        // ll rnd = ri(1, (1 << n) - 1);
        ++round;
        ll rnd = arr[round];
        upd(rnd);
        if (cnt + 1 == (1 << n)) {
          cout << "lastp: " << rnd << " " << (rnd * 2 >= (1 << n) ? "Y" : "N");
          break;
        }
      }
      cout << round << " r"
           << " " << ld(round) / (1<<n) << nl;
    }
  }
  return 0;
}
```

**重要观察：**最后一轮选中的节点大概率是叶子节点，不难发现，对于任意两个兄弟叶子节点，至少要显式的选中他们中至少一个，才有可能最终都被染黑。


## 第一问

根据上述观察，以及 Coupon Collector’s Problem 的结论，显然需要 $\Omega(N\log N)$ 轮才能实现。

## 第二问

考虑一个 $1\sim N$ 的随机排列，这个问题即证明存在一对叶子兄弟，他们在排列中出现的位置都在最后 $2\sqrt{N}$ 的概率 $P>Const$。

对于特定的一对叶子兄弟，他们都在最后 $2\sqrt{N}$ 出现的概率大概是：

$$P^\prime\approx (\frac 2{\sqrt N})^2=\frac 4{N}$$

对于特定的两对叶子兄弟，他们都在最后 $2\sqrt{N}$ 出现的概率大概是：

$$P^{\prime\prime}\approx\frac {16}{N^2}$$

取容斥原理的的前两层做放缩得到：

$$P>\frac N4\times P^\prime-\frac {N^2}{32}\times P^{\prime\prime}=\frac 12$$

## 第三问

模拟结果发现，在这个过程中，$N$ 层二叉树需要且仅需要填 $2^N$ 次操作就能全部涂黑，下归纳证明：

若结论对 $1\sim N-1$ 层二叉树都成立，则对 N 层二叉树，考虑其根和左右子树的填满顺序：

- 左右儿子先分别填满，根自动变黑，操作次数 $2^N$
- 左儿子和根先涂黑，右子树的根自动变黑，随后右子树填满，操作次数 $2^N$
- 对称情况同理

得证。

