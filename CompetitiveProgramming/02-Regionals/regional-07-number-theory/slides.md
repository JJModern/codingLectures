---
marp: true
theme: default
paginate: true
header: "Competitive Programming · Regional Level · Lecture 7"
footer: "codingLectures"
---

<!-- _class: lead -->
# Number Theory for Regionals
### Extended Euclid, CRT, φ, inclusion–exclusion, Möbius

---

## Learning goals

- Solve linear Diophantine equations and enumerate solutions in a range
- Combine congruences with the **general** CRT (non-coprime moduli)
- Use Euler's φ for gcd-counting problems
- Count with inclusion–exclusion over prime factors
- Apply the Möbius function to "count coprime pairs"

---

## What regional NT problems look like

- A story about gears, calendars, cycles, lights → **congruences**
- "How many pairs / numbers with gcd ..." → **φ / Möbius**
- "Divisible by at least one of ..." → **inclusion–exclusion**
- Values up to 10¹² or 10¹⁸ → overflow is the main enemy
- Typical constraint hints: n ≤ 10¹² ⇒ O(√n) trial division is fine

---

## Extended Euclid

```cpp
ll extgcd(ll a, ll b, ll& x, ll& y) {   // a*x + b*y = gcd(a, b)
    if (b == 0) { x = 1; y = 0; return a; }
    ll x1, y1, g = extgcd(b, a % b, x1, y1);
    x = y1;
    y = x1 - (a / b) * y1;
    return g;
}
```

- |x| ≤ b, |y| ≤ a: no overflow in the recursion itself
- Gives modular inverse of a mod m when gcd(a, m) = 1 — **m need not be prime**

---

## Linear Diophantine equations

`a·x + b·y = c` has integer solutions ⇔ `g = gcd(a,b)` divides `c`

```
 particular:  x0 = x' · c/g,  y0 = y' · c/g     (a x' + b y' = g)
 general:     x = x0 + k · b/g
              y = y0 − k · a/g        for all integers k
```

- Counting solutions with `x ∈ [x_lo, x_hi]`, `y ∈ [y_lo, y_hi]`: turn each into a range of k, intersect
- Careful: `x' · c/g` can overflow → `__int128`
- *Codeforces 7C Line*: find any integer point on `Ax + By + C = 0`

---

## Congruences from stories

> Gear A returns to start every 12 steps and is at position 5; gear B every 18, at 11. When are both at 0?

```
 x ≡ r1 (mod m1)
 x ≡ r2 (mod m2)
```

- Solutions exist ⇔ `r1 ≡ r2 (mod gcd(m1, m2))`
- If they exist: unique modulo `lcm(m1, m2)`
- Many congruences: merge two at a time

---

## General CRT: merge step

```
 x = r1 + m1·t,   need  m1·t ≡ r2 − r1  (mod m2)
 g = gcd(m1, m2);  g ∤ (r2 − r1)  →  no solution
 t ≡ (r2 − r1)/g · inv(m1/g)  (mod m2/g)
 x ≡ r1 + m1·t  (mod lcm)
```

- `inv(m1/g) mod m2/g` = the `p` from `extgcd(m1, m2)` (since `m1·p ≡ g`)
- All products through `__int128`

---

## General CRT: code

```cpp
bool crtMerge(ll& r1, ll& m1, ll r2, ll m2) {
    ll p, q, g = extgcd(m1, m2, p, q);
    if ((r2 - r1) % g != 0) return false;
    ll lcm = m1 / g * m2, mod2 = m2 / g;
    i128 t = (i128)((r2 - r1) / g) * p % mod2;
    if (t < 0) t += mod2;
    i128 x = ((i128)r1 + (i128)m1 * t) % lcm;
    if (x < 0) x += lcm;
    r1 = (ll)x; m1 = lcm;
    return true;
}
```

- Start from `(r, m) = (0, 1)` and merge every congruence

---

## Euler's totient φ

- φ(n) = #{1 ≤ k ≤ n : gcd(k, n) = 1} = n · Π (1 − 1/p)

```cpp
ll phi(ll n) {
    ll res = n;
    for (ll p = 2; p * p <= n; p++)
        if (n % p == 0) {
            while (n % p == 0) n /= p;
            res -= res / p;
        }
    if (n > 1) res -= res / n;
    return res;
}
```

- All φ(1..N): sieve in O(N log log N)

---

## φ in gcd-counting problems

- #{1 ≤ i ≤ n : gcd(i, n) = d} = φ(n/d)  (for d | n)
- Hence **Σ_{i=1}^{n} gcd(i, n) = Σ_{d | n} d · φ(n/d)**
- n ≤ 10¹²: enumerate divisors in O(√n), compute φ of each

*Codeforces 1295D Same GCDs*: count x ∈ [0, m) with gcd(a, m) = gcd(a + x, m)

- Answer = φ(m / gcd(a, m)) — one line once you see it

---

## Inclusion–exclusion

- |A₁ ∪ … ∪ A_k| = Σ_{∅≠S} (−1)^{|S|+1} |∩_{i∈S} A_i|
- Divisible by at least one of primes p₁..p_k, up to n:

```
 Σ over non-empty subsets S:  (−1)^{|S|+1} · ⌊ n / Π_{i∈S} p_i ⌋
```

- 2^k subsets: fine for k ≤ 20
- Numbers ≤ 10¹⁸ have ≤ 15 distinct prime factors

---

## Overflow-safe products

*CSES 2185 Prime Multiples*: n ≤ 10¹⁸, k ≤ 20

```cpp
ll prod = 1; bool tooBig = false;
for (int i = 0; i < k && !tooBig; i++) if (mask >> i & 1) {
    if (prod > n / p[i]) tooBig = true;    // prod * p[i] > n
    else prod *= p[i];
}
if (!tooBig) total += (popcount(mask) & 1) ? n / prod : -(n / prod);
```

- Never compute `prod * p[i]` and then compare

---

## Counting coprime to n in [1, M]

- Factor n = p₁^a₁ … p_k^a_k (k ≤ 15 for n ≤ 10¹⁸)
- Coprime count = Σ_{S ⊆ primes} (−1)^{|S|} ⌊M / Π_S p⌋
- Useful for "k-th number coprime to n": binary search on M
- Also: count pairs (x, y) in ranges with gcd(x, y) = 1 via Möbius (next)

---

## The Möbius function

```
 μ(1) = 1
 μ(n) = (−1)^k   if n is a product of k distinct primes
 μ(n) = 0        if p² | n for some prime p
```

- Key identity: Σ_{d | n} μ(d) = [n = 1]
- So `[gcd(a, b) = 1] = Σ_{d | gcd(a,b)} μ(d)`
- Swap the sums: count by d instead of by pair

---

## Counting coprime pairs

*CSES 2417*: n numbers ≤ 10⁶; how many pairs have gcd 1?

```
 #pairs = Σ_{i<j} Σ_{d | gcd} μ(d) = Σ_d μ(d) · C(c_d, 2)
 c_d = number of elements divisible by d
```

- c_d for all d: harmonic loop over multiples, O(V log V)
- μ for all d: linear sieve

---

## Linear sieve for μ (and primes)

```cpp
mu[1] = 1;
for (int i = 2; i <= MAXV; i++) {
    if (!composite[i]) { primes.push_back(i); mu[i] = -1; }
    for (int p : primes) {
        if ((ll)i * p > MAXV) break;
        composite[i * p] = true;
        if (i % p == 0) { mu[i * p] = 0; break; }
        mu[i * p] = -mu[i];
    }
}
```

- Same skeleton computes φ, smallest prime factor, number of divisors

---

## Pattern: Σ over gcd values

- "Sum of f(gcd(a_i, a_j)) over pairs" or "count pairs with gcd = g"
- Let `F(d)` = pairs with d | gcd = C(c_d, 2)
- Pairs with gcd **exactly** d: `G(d) = F(d) − Σ_{k ≥ 2} G(k·d)` (from large d down)
- Same O(V log V); no μ needed
- *Codeforces 803F Coprime Subsequences*: same with `2^{c_d} − 1` subsets

---

## Complexity cheat sheet

| Task | Cost |
|---|---|
| extgcd, CRT merge | O(log m) |
| φ(n), factorisation by trial division | O(√n) |
| Divisors of n ≤ 10¹² | ≤ 6720 divisors, O(√n) to list |
| Inclusion–exclusion over k primes | O(2^k · k) |
| μ / φ sieve to V | O(V) |
| Σ over multiples | O(V log V) |

---

## Common pitfalls

- `a * b % m` with a, b ~ 10¹⁸ → use `__int128`
- Negative remainders: `((x % m) + m) % m`
- CRT with non-coprime moduli treated as coprime
- Forgetting the last prime factor `> √n` in factorisation
- Inclusion–exclusion product overflow
- μ sieve marking `mu[i*p]` wrong when `p | i`

---

## Practice problems

- Codeforces 7C — Line
- Kattis `chineseremainder`, `generalchineseremainder`
- Kattis `relatives` (φ)
- Codeforces 687B — Remainders Game
- Codeforces 1295D — Same GCDs
- CSES 2185 — Prime Multiples
- CSES 2417 — Counting Coprime Pairs
- Codeforces 803F — Coprime Subsequences
- CSES 1713 — Counting Divisors; CSES 1082 — Sum of Divisors

---

## Summary

- extgcd → inverses for any coprime modulus, Diophantine equations, CRT
- General CRT: check `g | (r2 − r1)`, merge with `__int128`
- φ counts numbers with a given gcd; Σ gcd(i, n) = Σ d·φ(n/d)
- Inclusion–exclusion over ≤ 20 primes; guard products
- Möbius / "exact gcd" sieves count coprime pairs
- Next: geometry for regionals
