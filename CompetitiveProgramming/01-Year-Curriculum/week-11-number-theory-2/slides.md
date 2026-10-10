---
marp: true
theme: default
paginate: true
header: "Competitive Programming · Year Curriculum · Week 11"
footer: "codingLectures"
---

<!-- _class: lead -->
# Number Theory II
### Modular arithmetic, fast power, inverses & nCr mod p

---

## Learning goals

- Why answers are asked **"modulo 10⁹ + 7"**
- Add, subtract, multiply mod m **without overflow or negatives**
- **Binary exponentiation**: aᵇ mod m in O(log b)
- **Modular inverse** via Fermat's little theorem (and when it fails)
- Precompute **factorials and inverse factorials** → nCr in O(1)
- Classic counting: stars and bars, Catalan numbers, grid paths
- Reduce huge exponents with **mod p − 1**

---

## Motivation: CSES 1079 — Binomial Coefficients

n ≤ 10⁵ queries: print C(a, b) mod 10⁹ + 7, with 0 ≤ b ≤ a ≤ 10⁶.

```
3
5 3   → 10
2 1   → 2
10 5  → 252
```

- C(10⁶, 5·10⁵) has ~300,000 digits — we can't compute it exactly
- Pascal's triangle up to 10⁶: 10¹² cells — too big
- Goal: **O(N) precomputation, O(1) per query**

---

## Why a modulus?

- True answers are astronomically large (counting problems)
- Mod keeps numbers in 64-bit range and the answer checkable
- 10⁹ + 7 and 998244353 are **prime**, and < 2³⁰:
  - sum of two values < 2³¹ fits in `int`… barely — use `long long`
  - product of two values < 2⁶⁰ fits in `long long` ✓
  - prime ⇒ every non-zero value has an **inverse**

---

## The rules

(a + b) mod m = ((a mod m) + (b mod m)) mod m
(a − b) mod m = ((a mod m) − (b mod m) **+ m**) mod m
(a · b) mod m = ((a mod m) · (b mod m)) mod m

```cpp
const long long MOD = 1'000'000'007;
x = (x + y) % MOD;
x = ((x - y) % MOD + MOD) % MOD;   // C++ % can be negative!
x = x * y % MOD;                   // x, y < MOD → product < 2^60
```

**Division does not work this way.** (6 / 2) mod 4 = 3, but (6 mod 4)/(2 mod 4) = 1.

---

## Reduce early, reduce often

```cpp
long long ans = 1;
for (int i = 1; i <= n; i++)
    ans = ans * i % MOD;      // n! mod p
```

- Reduce **after every** multiplication
- `ans * i * j % MOD` can overflow: reduce between factors
- C++ `%` keeps the sign of the dividend: `-7 % 5 == -2`
- Modulus up to 10¹⁸? Products overflow `long long` → `__int128`

---

## Binary exponentiation

aᵇ with b = 13 = 1101₂: a¹³ = a⁸ · a⁴ · a¹

```cpp
long long power(long long a, long long b, long long m) {
    long long r = 1 % m;
    a %= m;
    while (b > 0) {
        if (b & 1) r = r * a % m;   // use this bit
        a = a * a % m;              // a, a², a⁴, a⁸, ...
        b >>= 1;
    }
    return r;
}
```

**O(log b)** multiplications. b = 10¹⁸ → 60 steps. (CSES 1095)

---

## Trace: 3¹³ mod 1000

| b (binary) | bit | r | a |
|---|---|---|---|
| 1101 | 1 | 3 | 9 |
| 110 | 0 | 3 | 81 |
| 11 | 1 | 243 | 6561 % 1000 = 561 |
| 1 | 1 | 243·561 % 1000 = 323 | … |

3¹³ = 1,594,323 → **323** ✓

---

## Modular inverse

x is an inverse of a mod m if **a · x ≡ 1 (mod m)**.
Then "divide by a" = "multiply by x".

- Exists ⇔ **gcd(a, m) = 1**
- m prime, a ≢ 0: always exists

Example mod 7: 3 · 5 = 15 ≡ 1 → 3⁻¹ = 5.
So 4 / 3 ≡ 4 · 5 = 20 ≡ 6 (mod 7). Check: 3 · 6 = 18 ≡ 4 ✓

---

## Fermat's little theorem

p prime, a not divisible by p:

**a^(p−1) ≡ 1 (mod p)** ⇒ a · a^(p−2) ≡ 1 ⇒ **a⁻¹ = a^(p−2)**

```cpp
long long inv(long long a) { return power(a, MOD - 2, MOD); }
```

- O(log p) ≈ 30 multiplications
- Requires p **prime**, a ≢ 0
- Non-prime m with gcd(a, m) = 1 → extended Euclid (Regionals track)
- inv(2) mod 10⁹+7 = 500000004

---

## Inverses of 1..n in O(n)

```cpp
inv[1] = 1;
for (int i = 2; i <= n; i++)
    inv[i] = (MOD - (MOD / i) * inv[MOD % i] % MOD) % MOD;
```

Why: write p = q·i + r, so q·i + r ≡ 0 ⇒ i ≡ −r/q
⇒ i⁻¹ ≡ −q · r⁻¹ with r = p mod i < i (already known).

Handy when you need many inverses, e.g. harmonic sums mod p.

---

## Binomial coefficients

C(n, k) = n! / (k! (n−k)!) = number of k-subsets of an n-set

Precompute once, O(N):

```cpp
fact[0] = 1;
for (int i = 1; i <= N; i++) fact[i] = fact[i-1] * i % MOD;
invFact[N] = power(fact[N], MOD - 2, MOD);
for (int i = N; i > 0; i--) invFact[i-1] = invFact[i] * i % MOD;

long long nCr(int n, int k) {
    if (k < 0 || k > n) return 0;
    return fact[n] * invFact[k] % MOD * invFact[n-k] % MOD;
}
```

**One** exponentiation, then O(1) per query.

---

## Why `invFact[i-1] = invFact[i] * i`?

1/(i−1)! = i / i!

So from the inverse of N! we walk down to 0! with one multiplication each.
Avoids N separate `power` calls (N log p → N).

Requires **N < p**: for n ≥ p, n! ≡ 0 mod p and the formula breaks
→ Lucas' theorem (out of scope today).

---

## Alternative: Pascal's triangle

C(n, k) = C(n−1, k−1) + C(n−1, k)

```cpp
for (int n = 0; n <= N; n++) {
    C[n][0] = 1;
    for (int k = 1; k <= n; k++)
        C[n][k] = (C[n-1][k-1] + C[n-1][k]) % m;
}
```

- O(N²) time and memory → N ≤ ~5000
- Works for **any** modulus m (no inverses needed!)
- Also fine with no modulus while values < 2⁶³ (N ≤ 66 safe)

---

## Counting toolbox

| Count | Formula | CSES |
|---|---|---|
| k-subsets of n | C(n, k) | 1079 |
| lattice paths in an a×b grid | C(a + b, a) | — |
| n identical balls into k boxes | C(n + k − 1, k − 1) | 1716 |
| arrangements of a multiset | n! / (c₁! c₂! … ) | 1715 |
| balanced bracket sequences, 2n chars | Catalan C(2n, n)/(n + 1) | 2064 |

Division by a factorial = multiplication by `invFact`.

---

## Worked example: Distributing Apples (CSES 1716)

n children, m identical apples. Ways to distribute?

**Stars and bars**: line up m stars and n − 1 bars;
bars split the stars into n (possibly empty) groups.

```
** | | *        n = 3, m = 3  →  (2, 0, 1)
```

Answer = C(m + n − 1, n − 1). For n = 3, m = 2: C(4, 2) = 6 ✓

---

## Exponent towers: CSES 1712

Compute a^(b^c) mod p, all values up to 10⁹.

By Fermat, aᵉ only depends on e **mod (p − 1)** when p ∤ a:

```cpp
long long e = power(b, c, MOD - 1);   // NOT mod MOD!
long long ans = power(a, e, MOD);
```

Edge: if p | a, the answer is 0 unless the true exponent is 0.
3^(7¹) = 2187, 15^(2²) = 50625 ✓

---

## Modular arithmetic struct (optional)

```cpp
struct Mint {
    int v;
    Mint(long long x = 0) { x %= MOD; if (x < 0) x += MOD; v = x; }
    Mint& operator+=(Mint o) { v += o.v; if (v >= MOD) v -= MOD; return *this; }
    Mint& operator*=(Mint o) { v = (long long)v * o.v % MOD; return *this; }
    // -, /, pow, inv ... (see notes)
};
```

- Removes "forgot to `% MOD`" bugs
- Write it once, test it, keep it in your notebook

---

## Complexity summary

| Operation | Time |
|---|---|
| +, −, × mod m | O(1) |
| aᵇ mod m | O(log b) |
| inverse via Fermat | O(log p) |
| inverses of 1..N | O(N) |
| fact / invFact tables | O(N + log p) |
| nCr query | O(1) |
| Pascal table | O(N²) |

---

## Pitfalls

- Negative results from `%` after subtraction → add MOD
- `int` overflow in `a * b` → cast to `long long` **before** multiplying
- Forgetting to reduce the base: `power(a, ...)` with a ≥ MOD or a < 0
- Using Fermat with a **non-prime** modulus, or with a ≡ 0
- Reducing an exponent mod p instead of **p − 1**
- `nCr` with k > n or k < 0 must return 0, not crash
- Tables sized for n but queried with n + m − 1

---

## Practice problems

- CSES 1095 — Exponentiation
- CSES 1712 — Exponentiation II
- CSES 1079 — Binomial Coefficients
- CSES 1716 — Distributing Apples
- CSES 1715 — Creating Strings II
- CSES 2064 — Bracket Sequences I
- AtCoder ABC 145 D — Knight
- AtCoder ABC 156 D — Bouquet
- Codeforces 300C — Beautiful Numbers

---

## Summary

- Reduce after every operation; fix negatives with `+ MOD`
- Binary exponentiation: O(log b), the workhorse of modular math
- Prime modulus ⇒ a⁻¹ = a^(p−2); exponents reduce mod p − 1
- fact + invFact ⇒ nCr in O(1) after O(N) setup
- Stars and bars, multinomials, Catalan: all just factorial ratios
- Next week: **stacks, queues & monotonic structures**
