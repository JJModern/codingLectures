# Week 18 — Mid-Year Review: Problem-Solving Method and Mock Contest

> Year Curriculum · Prerequisites: Weeks 1–17 · Estimated time: 1 hour review + 3-hour mock contest + 1 hour debrief

## 1. Overview

Seventeen weeks in, you own a substantial toolbox: complexity analysis and brute force, sorting and greedy, binary search, two pointers, prefix sums, backtracking, bitmasks, number theory, stacks and queues, heaps and ordered sets, dynamic programming, BFS/DFS and shortest paths. The difficulty in contests is rarely "I have never seen this algorithm" — it is "I did not realise this problem was *that* algorithm", or "I knew the idea but my code had a bug".

This week has three parts:

1. **A problem-solving method** you can run on any unseen problem, including a table that converts constraints into a target complexity and a table of *signals* that point to techniques.
2. **A 3-hour mock contest** of eight real problems spanning the first half of the year.
3. **A debrief** with solution ideas and reference code, plus an upsolving plan.

If you are reading these notes before sitting the mock contest, stop after Section 4 and do the contest first. The debrief is far more valuable once you have struggled with the problems.

## 2. The topic map

| Weeks | Block | What you should be able to write from memory |
|-------|-------|---------------------------------------------|
| 1–3 | Foundations | fast I/O, reading input formats, estimating operation counts, complete search over subsets/permutations |
| 4 | Sorting & greedy | custom comparators, exchange arguments |
| 5 | Binary search | `lower_bound`/`upper_bound`, binary search on a monotone predicate |
| 6 | Two pointers | pair sums in sorted arrays, longest window with a property |
| 7 | Prefix sums | 1D/2D prefix sums, difference arrays |
| 8 | Backtracking | subsets, permutations, N-Queens with pruning |
| 9 | Bits | masks as subsets, `__builtin_popcount`, iterating over submasks |
| 10–11 | Number theory | sieve, factorisation, gcd, fast power, modular inverse, nCr mod p |
| 12 | Stacks & queues | monotonic stack (next smaller element), monotonic deque (window minimum) |
| 13 | Heaps, sets, maps | `priority_queue`, `set`/`multiset` with `lower_bound`, `map` counting |
| 14–15 | DP | state/transition/base/order/answer; knapsack, LIS, LCS, edit distance, grid DP |
| 16 | Graphs I | adjacency lists, BFS, DFS, components, flood fill, bipartite check |
| 17 | Graphs II | Dijkstra, Bellman-Ford, Floyd-Warshall, 0-1 BFS, state graphs |

Be honest with yourself: mark each row green (I can code it cold), yellow (I need to look things up), or red (I don't really understand it). The second half of the year builds directly on these — trees (Week 20) need DFS; segment trees (Week 23) need recursion and prefix-sum thinking; bitmask DP (Week 26) needs both Weeks 9 and 15.

## 3. A problem-solving method

### 3.1 Understand the problem

1. **Read the entire statement**, including input/output format, constraints and notes. Constraints are part of the problem, not decoration.
2. **Restate it** in one precise sentence without the story. "Given an array, count pairs (l, r) with sum of a[l..r] divisible by n." If you cannot, you have not understood it yet.
3. **Work through the samples by hand.** If your understanding gives a different output, find out why *now*, not after three wrong submissions.
4. **Invent small cases**, including edge cases: n = 1, all elements equal, all negative, the maximum values, an empty answer, a disconnected graph, a start cell that is blocked.

### 3.2 From constraints to complexity

A C++ program performs roughly 10⁸ simple operations per second (more for tight array loops, fewer for `map` or heavy recursion). Combine that with the time limit to get a budget:

| Largest n | Feasible complexity | Typical techniques |
|-----------|--------------------|--------------------|
| ≤ 10–12 | O(n!) | permutations, backtracking |
| ≤ 20–25 | O(2ⁿ·n) | bitmask enumeration; meet in the middle up to ~40 |
| ≤ 500 | O(n³) | Floyd-Warshall, interval DP |
| ≤ 5000 | O(n²) | 2D DP, all pairs |
| ≤ 2·10⁵ – 10⁶ | O(n log n) or O(n) | sorting, binary search, heaps, BFS, prefix sums, two pointers |
| ≤ 10¹⁸ | O(log n) or O(√n) | math, binary search on the answer, fast exponentiation |

Reading this table backwards is just as useful: if n ≤ 20, the setter is practically telling you to enumerate subsets. If H, W ≤ 20 in a grid problem, running a BFS from every cell is intended.

### 3.3 Find a solution

5. **Start with brute force.** Describe the most naive correct algorithm and its complexity. Even if it is too slow, it clarifies the problem, and you can later use it to test your fast solution.
6. **Ask what makes brute force slow** and look for structure: Is some predicate monotone (binary search)? Does order not matter (sort first)? Do subproblems repeat (DP)? Are there objects and relations between them (graph)? Can we count the complement instead? Can we reverse time or reverse the edges?
7. **Match signals** to techniques (Section 3.4).
8. **Convince yourself it is correct** — a proof sketch for greedy, a clear state definition for DP — and run it on your small cases on paper.
9. **Code it cleanly.** Name variables meaningfully, avoid clever one-liners under pressure, and use `long long` by default when values can exceed 2·10⁹.
10. **Test** on the samples and your own cases before submitting.

If you are stuck for 15 minutes: reread the statement (really), solve tiny instances completely by hand looking for a pattern, or switch to another problem and come back.

### 3.4 Signals

| Statement says… | Consider… |
|-----------------|-----------|
| "minimise the maximum", "smallest T such that…" | binary search on the answer |
| sorted data, pairs/triples with a target sum | two pointers |
| many range-sum queries on a static array | prefix sums |
| many range increments, read at the end | difference array |
| "nearest smaller/greater element", histogram areas | monotonic stack |
| min/max of every window of length k | monotonic deque |
| repeatedly take the cheapest/largest item | priority queue |
| "count the number of ways", "minimum cost", overlapping choices | DP |
| subset under a weight/cost limit | knapsack |
| two strings, align or compare | prefix × prefix DP |
| n ≤ 20, choose a subset | bitmasks |
| answer modulo 10⁹+7, binomial coefficients | modular arithmetic, precomputed factorials |
| maze, grid, "minimum number of moves" | BFS |
| roads with lengths, "cheapest route" | Dijkstra |
| split into two groups with constraints between pairs | bipartite check |

Signals are hints, not rules. Their main use is to generate candidate ideas quickly; you still have to check that the idea fits the constraints.

## 4. The mock contest

**Format.** 3 hours, individual, ICPC scoring (number solved, then total time with a 20-minute penalty per rejected submission on problems eventually solved). Use the CSES, Codeforces and AtCoder judges directly, or set up a Codeforces Gym / vjudge contest with these problems. Paper and your own notes are allowed; searching for solutions is not.

**Keep a log.** For each problem write when you opened it, when you had an idea, when you submitted, and the reason for every rejection. You will use this log in the debrief.

| # | Problem | Link |
|---|---------|------|
| A | Codeforces 1352C — K-th Not Divisible by n | https://codeforces.com/problemset/problem/1352/C |
| B | CSES 1640 — Sum of Two Values | https://cses.fi/problemset/task/1640 |
| C | CSES 1620 — Factory Machines | https://cses.fi/problemset/task/1620 |
| D | CSES 1662 — Subarray Divisibility | https://cses.fi/problemset/task/1662 |
| E | CSES 1746 — Array Description | https://cses.fi/problemset/task/1746 |
| F | AtCoder ABC 151 D — Maze Master | https://atcoder.jp/contests/abc151/tasks/abc151_d |
| G | Codeforces 1272E — Nearest Opposite Parity | https://codeforces.com/problemset/problem/1272/E |
| H | Codeforces 1201C — Maximum Median | https://codeforces.com/problemset/problem/1201/C |

The order is roughly by difficulty, but as in a real contest, read all problems in the first 20 minutes and solve in the order *you* find easiest.

---

*Stop here until you have sat the contest.*

---

## 5. Debrief: ideas

### A — K-th Not Divisible by n (math)

Among 1..x there are exactly x − ⌊x/n⌋ numbers not divisible by n. Every block of n consecutive integers contains n − 1 good ones, so the k-th good number is k plus the number of multiples of n we skipped, which is ⌊(k−1)/(n−1)⌋. Answer: `k + (k - 1) / (n - 1)`. Check n = 3, k = 7: the sequence is 1, 2, 4, 5, 7, 8, 10 and the formula gives 7 + 3 = 10. A safe alternative if you don't trust your formula: binary search the smallest x with x − ⌊x/n⌋ ≥ k. Values reach 2·10⁹, so use `long long`.

### B — Sum of Two Values (sorting / two pointers / map)

Find two distinct positions with a[i] + a[j] = x. Either sort (value, original index) pairs and walk two pointers inward, or scan once with a hash map from value to index, checking whether x − a[i] has been seen. O(n log n). Pitfall: printing sorted positions instead of original ones.

### C — Factory Machines (binary search on the answer)

"In time T, machine i makes ⌊T/kᵢ⌋ products; find the smallest T making at least t." The predicate "T is enough" is monotone, so binary search T in [0, min(k)·t]. The upper bound fits in `long long` (10⁹·10⁹ = 10¹⁸), but the sum Σ⌊T/kᵢ⌋ can exceed 2⁶³: stop summing as soon as it reaches t. O(n log(10¹⁸)).

### D — Subarray Divisibility (prefix sums + counting)

a[l..r] has sum P[r] − P[l−1], which is divisible by n iff P[r] ≡ P[l−1] (mod n). So count pairs of prefix sums (including the empty prefix P[0] = 0) with equal remainders: keep `cnt[remainder]`, and when a new prefix arrives add `cnt[its remainder]` to the answer. Values can be negative and C++'s `%` keeps the sign of the dividend, so normalise with `((p % n) + n) % n`. O(n).

### E — Array Description (DP)

`dp[i][v]` = number of valid fillings of positions 0..i with x[i] = v. Transition from v−1, v, v+1 at position i−1, restricted to v = x[i] when x[i] is known. With n ≤ 10⁵ and m ≤ 100 there are 10⁷ states. Padding the value range with zeros at 0 and m+1 removes bounds checks; rolling the i dimension keeps memory O(m).

### F — Maze Master (BFS, small constraints)

The maximum, over all pairs of open cells, of the shortest-path distance. With at most 400 cells, run a BFS from every open cell and take the maximum distance seen: 400 × O(400·4) operations. The lesson: when constraints are tiny, the intended solution is usually a straightforward repetition of a basic algorithm.

### G — Nearest Opposite Parity (multi-source BFS on the reversed graph)

From position i you may jump to i − a[i] or i + a[i]. For each i, find the fewest jumps to any position whose value has the opposite parity of a[i]. Running a BFS from each i costs O(n²). Instead, **reverse the edges** and BFS **from all targets simultaneously**: in the reversed graph, the distance from the set of odd-valued positions to i equals, in the original graph, the distance from i to the nearest odd-valued position. Two multi-source BFS runs (odd sources, even sources) answer everything in O(n). "Reverse the graph, start from the goals" is one of the most reusable tricks in graph problems.

### H — Maximum Median (sorting + binary search on the answer)

n is odd and you may add 1 to elements k times; maximise the median. After sorting, only the elements from index n/2 onward matter: to make the median at least M, every element in the upper half must be at least M, costing Σ max(0, M − a[i]) over i ≥ n/2. This cost is monotone in M, so binary search the largest M with cost ≤ k. Upper bound a[n/2] + k. Use `long long`.

## 6. Upsolving and planning

After the contest:

1. **Upsolve every problem within a week.** If you read the debrief idea, close it and write the code yourself.
2. **Analyse your log.** Where did time go — understanding, finding the idea, coding, debugging? Each needs a different fix: more reading practice, more problems per topic, more template code, or a debugging checklist.
3. **Keep a mistake log** of every WA and its cause. After a month you will see that a handful of bug types account for most of your losses.
4. **Re-solve from scratch** after three days. Being able to reproduce a solution cold is the test of whether you learned it.
5. **Plan the next weeks** from your green/yellow/red map. Spend extra practice on red topics that the second half depends on: recursion/DFS (for trees), DP (for every later DP week), binary search (everywhere).

## 7. Reference implementations

All compile with `g++ -std=c++17 -O2 -Wall` and pass the official samples.

### 7.1 A — K-th Not Divisible by n

```cpp
#include <bits/stdc++.h>
using namespace std;
int main() {
    int t;
    cin >> t;
    while (t--) {
        long long n, k;
        cin >> n >> k;
        cout << k + (k - 1) / (n - 1) << "\n";
    }
}
```

### 7.2 C — Factory Machines

```cpp
#include <bits/stdc++.h>
using namespace std;
using ll = long long;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    ll n, t;
    cin >> n >> t;
    vector<ll> k(n);
    for (auto &x : k) cin >> x;
    auto enough = [&](ll T) {              // can we make t products in time T?
        ll made = 0;
        for (ll x : k) {
            made += T / x;
            if (made >= t) return true;    // stop early: avoids overflow
        }
        return false;
    };
    ll lo = 0, hi = *min_element(k.begin(), k.end()) * t;   // hi is always enough
    while (hi - lo > 1) {                  // invariant: !enough(lo), enough(hi)
        ll mid = lo + (hi - lo) / 2;
        if (enough(mid)) hi = mid; else lo = mid;
    }
    cout << hi << "\n";
}
```

### 7.3 D — Subarray Divisibility

```cpp
#include <bits/stdc++.h>
using namespace std;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int n;
    cin >> n;
    vector<long long> cnt(n, 0);
    cnt[0] = 1;                            // empty prefix
    long long pre = 0, ans = 0;
    for (int i = 0; i < n; i++) {
        long long a;
        cin >> a;
        pre = ((pre + a) % n + n) % n;     // keep the remainder in [0, n)
        ans += cnt[pre];                   // earlier prefixes with equal remainder
        cnt[pre]++;
    }
    cout << ans << "\n";
}
```

### 7.4 E — Array Description

```cpp
#include <bits/stdc++.h>
using namespace std;
const int MOD = 1'000'000'007;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int n, m;
    cin >> n >> m;
    vector<int> x(n);
    for (auto &v : x) cin >> v;
    vector<long long> dp(m + 2, 0), nd(m + 2, 0);   // indices 0 and m+1 stay 0
    for (int v = 1; v <= m; v++)
        if (x[0] == 0 || x[0] == v) dp[v] = 1;
    for (int i = 1; i < n; i++) {
        fill(nd.begin(), nd.end(), 0);
        for (int v = 1; v <= m; v++)
            if (x[i] == 0 || x[i] == v)
                nd[v] = (dp[v - 1] + dp[v] + dp[v + 1]) % MOD;
        swap(dp, nd);
    }
    long long ans = 0;
    for (int v = 1; v <= m; v++) ans = (ans + dp[v]) % MOD;
    cout << ans << "\n";
}
```

### 7.5 G — Nearest Opposite Parity

```cpp
#include <bits/stdc++.h>
using namespace std;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int n;
    cin >> n;
    vector<int> a(n);
    for (auto &x : a) cin >> x;
    vector<vector<int>> radj(n);           // radj[j] = positions that can jump to j
    for (int i = 0; i < n; i++) {
        if (i - a[i] >= 0) radj[i - a[i]].push_back(i);
        if (i + a[i] < n) radj[i + a[i]].push_back(i);
    }
    vector<int> ans(n, -1);
    for (int par = 0; par < 2; par++) {    // sources: all positions with a[j] % 2 == par
        vector<int> dist(n, -1);
        queue<int> q;
        for (int j = 0; j < n; j++)
            if (a[j] % 2 == par) { dist[j] = 0; q.push(j); }
        while (!q.empty()) {
            int u = q.front(); q.pop();
            for (int v : radj[u])
                if (dist[v] == -1) { dist[v] = dist[u] + 1; q.push(v); }
        }
        for (int i = 0; i < n; i++)        // answer for opposite-parity starts
            if (a[i] % 2 != par) ans[i] = dist[i];
    }
    for (int i = 0; i < n; i++) cout << ans[i] << " ";
    cout << "\n";
}
```

### 7.6 H — Maximum Median

```cpp
#include <bits/stdc++.h>
using namespace std;
using ll = long long;
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int n;
    ll k;
    cin >> n >> k;
    vector<ll> a(n);
    for (auto &x : a) cin >> x;
    sort(a.begin(), a.end());
    auto cost = [&](ll M) {                 // operations to make the median >= M
        ll c = 0;
        for (int i = n / 2; i < n; i++) {
            if (a[i] >= M) break;           // sorted: the rest are also >= M
            c += M - a[i];
            if (c > k) break;
        }
        return c;
    };
    ll lo = a[n / 2], hi = a[n / 2] + k + 1;   // lo feasible, hi infeasible
    while (hi - lo > 1) {
        ll mid = lo + (hi - lo) / 2;
        if (cost(mid) <= k) lo = mid; else hi = mid;
    }
    cout << lo << "\n";
}
```

Problems B and F are left as exercises; their ideas above are complete.

## 8. Common mistakes (from typical mock contests)

- **Misreading.** "Distinct positions", "1-indexed output", "print any", "modulo 10⁹+7" — reread before submitting.
- **Overflow.** C's upper bound and running sum, H's cost, A's answer near 2·10⁹. If a value can exceed about 2·10⁹, use `long long`.
- **Negative modulo.** D fails on negative inputs without normalisation.
- **Wrong binary search invariant.** Decide what `lo` and `hi` mean (e.g. "`lo` infeasible, `hi` feasible") and keep it; then the loop `while (hi - lo > 1)` cannot go wrong.
- **Quadratic hidden in a loop.** One BFS per start in G; erasing from the front of a `vector` in a loop.
- **Not resetting state** between test cases (A has many tests; your later problems may too).
- **Panic-switching.** Abandoning a nearly correct solution after one WA instead of checking the edge cases systematically.
- **Not reading all problems.** F is easy for anyone who reads the constraints; many contestants never open it.

## 9. Practice problems (review set)

- CSES 1090 — Ferris Wheel — https://cses.fi/problemset/task/1090
- CSES 1085 — Array Division — https://cses.fi/problemset/task/1085
- CSES 1641 — Sum of Three Values — https://cses.fi/problemset/task/1641
- CSES 1661 — Subarray Sums II — https://cses.fi/problemset/task/1661
- CSES 1623 — Apple Division — https://cses.fi/problemset/task/1623
- CSES 1095 — Exponentiation — https://cses.fi/problemset/task/1095
- CSES 1645 — Nearest Smaller Values — https://cses.fi/problemset/task/1645
- CSES 1164 — Room Allocation — https://cses.fi/problemset/task/1164
- CSES 1634 — Minimizing Coins — https://cses.fi/problemset/task/1634
- CSES 1194 — Monsters — https://cses.fi/problemset/task/1194
- CSES 1195 — Flight Discount — https://cses.fi/problemset/task/1195
- A virtual participation in any recent Codeforces Div. 3 round (https://codeforces.com/contests), followed by upsolving.

## 10. Further reading

- Antti Laaksonen, *Competitive Programmer's Handbook*, Chapter 2 (Time complexity) — the estimation table in more detail.
- George Pólya, *How to Solve It* — the original "understand, plan, carry out, look back" method.
- USACO Guide, "Contest Strategy" and "Debugging Checklist": https://usaco.guide/general/
- Looking ahead: Week 35 covers contest strategy, stress testing and team play in depth; Week 36 is the final review.
