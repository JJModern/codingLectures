# Lecture 36 — Final Review, Year Retrospective & Mock Contest

> Year Curriculum · Prerequisites: Weeks 1–35 · Estimated time: 1 hour review + 5-hour mock contest + 1-hour debrief

## 1. Overview

This final session has three parts:

1. **Retrospective**: a compact map of everything covered this year, organized by what kind of problem each tool solves, and a guide for recognizing techniques from constraints and keywords.
2. **Mock contest**: a 5-hour, 12-problem ICPC-style contest built from CSES problems spanning the whole year, so it can be graded automatically.
3. **Debrief and next steps**: a structured debrief of your contest, the year's most common mistakes, a self-assessment, and a plan for the summer and the Regional track. The solutions are held by the coach and are not part of these notes.

## 2. The year in one map

### 2.1 Foundations (Weeks 1–9)

* **Judges and I/O** (Week 1), **C++ and STL** (Week 2): fast I/O, `vector`, `sort`, `map`, `set`, `lower_bound`.
* **Complexity and complete search** (Week 3): estimate operations before coding; brute force is both a solution for small inputs and a reference for stress testing.
* **Sorting and greedy** (Week 4): sort by the right key, prove choices with exchange arguments.
* **Binary search** (Week 5), especially **on the answer**: if "can we achieve x?" is monotone in x, search for the boundary.
* **Two pointers** (Week 6): windows whose endpoints only move forward.
* **Prefix sums, 2D prefix sums, difference arrays** (Week 7).
* **Recursion and backtracking** (Week 8): subsets, permutations, pruning.
* **Bit manipulation** (Week 9): masks as sets, enumerating subsets and submasks.

### 2.2 Math, linear structures and DP basics (Weeks 10–15)

* **Number theory** (Weeks 10–11): gcd, sieve, factorization, modular arithmetic, fast exponentiation, modular inverses, nCr mod p.
* **Stacks, queues, deques** (Week 12): monotonic stack for nearest smaller/greater, monotonic deque for sliding-window extremes.
* **Heaps, ordered sets and maps** (Week 13): `priority_queue`, `multiset`, policy-based order statistics.
* **Dynamic programming** (Weeks 14–15): states, transitions, memoization vs tabulation; knapsack, LIS, LCS, edit distance, grid DP.

### 2.3 Graphs (Weeks 16–22)

* BFS/DFS, components, bipartiteness, grids (Week 16).
* Dijkstra, Bellman-Ford, Floyd-Warshall, 0-1 BFS (Week 17).
* DSU and minimum spanning trees (Week 19).
* Trees: diameter, subtree sizes, tree DP, rerooting (Week 20).
* DAGs, topological sort, DP on DAGs, strongly connected components (Week 21).
* LCA by binary lifting, Euler tour, tree flattening (Week 22).

### 2.4 Range queries and advanced DP (Weeks 23–27)

* Segment trees (Week 23), Fenwick trees and sparse tables (Week 24), lazy propagation (Week 25).
* Bitmask DP (Week 26); interval and digit DP (Week 27).

### 2.5 Advanced topics (Weeks 28–35)

* Strings: hashing, prefix function, Z-function (Week 28); tries, Aho-Corasick, suffix arrays (Week 29).
* Combinatorics, inclusion-exclusion, probability, expected value (Week 30).
* Computational geometry: cross products, segments, polygons, convex hull (Week 31).
* Network flow: Edmonds-Karp, Dinic, min cut, bipartite matching (Week 32).
* Game theory: Nim, Sprague-Grundy (Week 33).
* Square-root decomposition and Mo's algorithm (Week 34).
* Contest strategy, debugging, stress testing (Week 35).

## 3. Recognizing the technique

### 3.1 Constraints

The input size is the strongest hint (see Week 35 for the full table): n ≤ 20 suggests exponential subset algorithms; n ≤ 500, cubic; n ≤ 5000, quadratic; n ≤ 2·10⁵, O(n log n) or O(n√n); values up to 10¹⁸, logarithmic or square-root math.

### 3.2 Keywords

| Statement says | Usually means |
|----------------|---------------|
| "minimize the maximum" / "maximize the minimum" | binary search on the answer + greedy check |
| "longest/shortest subarray such that" | two pointers, or prefix sums + map |
| "count ways modulo 10⁹+7" | DP or combinatorics (factorials, inclusion-exclusion) |
| "n ≤ 20", "visit every city" | bitmask DP |
| "range queries with updates" | Fenwick / segment tree; lazy for range updates |
| "offline queries about distinct values" | Mo's algorithm or sort-by-right-end + BIT |
| "next greater", "largest rectangle" | monotonic stack |
| "minimum moves on a grid" | BFS (multi-source, 0-1 BFS, state = position + extra info) |
| "roads with lengths, shortest" | Dijkstra (Bellman-Ford if negative) |
| "connect everything cheaply" | MST |
| "prerequisites", "order of tasks" | topological sort; SCC if cycles |
| "path between two nodes of a tree" | LCA, root-path prefix values |
| "each person gets at most one item" | bipartite matching / flow |
| "minimum number of roads to block" | min cut |
| "players alternate", "optimal play" | game DP, Nim, Grundy numbers |
| "expected number of" | linearity of expectation, expected-value DP |
| "occurrences of many words" | Aho-Corasick (or hashing per length) |
| "number of distinct substrings" | suffix array + LCP |
| "points, polygon, convex" | cross products, shoelace, convex hull |

Keywords are hints, not proofs: always confirm that the structure the technique needs (monotonicity, optimal substructure, independence) is actually present.

### 3.3 The method

From Week 18, the loop we have practiced all year:

1. **Understand**: restate the task in one sentence; identify input, output, and constraints.
2. **Examples**: work through the samples and a few hand-made tiny cases.
3. **Brute force**: write down the obvious slow solution. Keep it: it becomes your stress tester.
4. **Observe**: look for monotonicity, independence, small parameters, invariants, symmetry.
5. **Optimize**: choose the data structure or technique that removes the bottleneck of the brute force.
6. **Verify**: complexity, edge cases, and a stress test before (or right after) submitting.

## 4. The mock contest

### 4.1 Rules

* 5 hours, ICPC scoring: number of problems solved, then penalty (minutes to acceptance plus 20 per rejected attempt, solved problems only).
* Teams of three with one computer, or individually as extra practice.
* Printed notebook and C++ reference allowed; no internet search beyond the judge.
* Problems are **not** sorted by difficulty. Triage first (Week 35).

### 4.2 Problem set

All problems are from the CSES Problem Set, so you can submit them for automatic judging.

| | Problem | Link |
|-|---------|------|
| A | Concert Tickets | https://cses.fi/problemset/task/1091 |
| B | Hamiltonian Flights | https://cses.fi/problemset/task/1690 |
| C | Sum of Two Values | https://cses.fi/problemset/task/1640 |
| D | Company Queries II | https://cses.fi/problemset/task/1688 |
| E | Prime Multiples | https://cses.fi/problemset/task/2185 |
| F | Dice Combinations | https://cses.fi/problemset/task/1633 |
| G | Download Speed | https://cses.fi/problemset/task/1694 |
| H | String Matching | https://cses.fi/problemset/task/1753 |
| I | Road Reparation | https://cses.fi/problemset/task/1675 |
| J | Nim Game I | https://cses.fi/problemset/task/1730 |
| K | Dynamic Range Sum Queries | https://cses.fi/problemset/task/1648 |
| L | Shortest Routes I | https://cses.fi/problemset/task/1671 |

Stop reading here until the contest is over.

## 5. Debrief

> **Solutions are not published here.** The coach holds the solutions and releases them only after the contest has been run.

Neither the solution sketches nor the reference implementations are included in these notes. Right after the contest, each team reconstructs its timeline (when each problem was read, started, submitted and accepted, and the cause of every rejection), compares its solve order with the rest of the room, and writes down the list of problems to upsolve. Then use Sections 6 and 7 to classify your mistakes and plan your practice.

## 6. The year's most common mistakes

1. **Integer overflow**: sums of 10⁵ values of 10⁹, products of two 10⁹ numbers, `1 << 40`.
2. **Multi-test state** not reset; reading interrupted by an early `break`.
3. **Off-by-one** in ranges, loop bounds, and binary search termination.
4. **Deep recursion** on path-shaped trees and graphs (convert to iterative or use an explicit stack).
5. **INF too small** for 64-bit distances; adding to INF and overflowing.
6. **Dijkstra without stale-entry skipping**, or used with negative edges.
7. **Graph construction**: forgetting reverse edges (undirected graphs, residual graphs).
8. **Negative modulo** results in C++.
9. **Unproven greedy** choices; always test against a brute force.
10. **Output format**: capitalization, separators, floating-point precision.

## 7. Self-assessment and next steps

After the contest and the upsolving, rate yourself from 1 to 5 on whether you can write each of the following from memory, correctly, in about 15 minutes: BFS and Dijkstra; DSU and Kruskal; segment tree with lazy propagation; Fenwick tree; LIS in O(n log n); bitmask DP; LCA with binary lifting; KMP or Z-function; Aho-Corasick; Dinic; convex hull; Nim/Grundy computation; Mo's algorithm. Anything rated below 4: re-solve that week's practice list and add the code to your notebook.

**Next stage.** The Regional track (02-Regionals) focuses on ICPC regional difficulty: implementation-heavy problems, advanced greedy (exchange arguments, regret heaps), graph modeling with state spaces, DP optimizations, sweep lines and coordinate compression, number theory II (CRT, Euler's phi, Möbius), geometry and strings at regional level, and a full mock regional. Later tracks (Nationals, World Finals) go to persistent structures, heavy-light and centroid decomposition, min-cost flow, suffix automata, FFT, and beyond.

**Summer plan.** Each week: one or two virtual contests (Codeforces Div. 2, AtCoder ABC/ARC, or an ICPC gym set as a team), upsolve every problem you were close to, 5–10 topic problems from this year's lists, and one new tested template in the notebook. Keep a log of problems and mistakes and skim it before each contest. The largest gains come from volume and honest upsolving, not from learning yet another algorithm.

## 8. Practice problems

The 12 mock-contest problems above, plus these mixed review sets:

* CSES Problem Set (https://cses.fi/problemset) — finish the sections Sorting and Searching, Dynamic Programming, Graph Algorithms, Range Queries, Tree Algorithms
* AtCoder Educational DP Contest (https://atcoder.jp/contests/dp) — 26 DP problems, A–Z
* Codeforces 1520 (Div. 3) (https://codeforces.com/contest/1520) — a full contest for timing practice
* Codeforces 1324 (Div. 3) (https://codeforces.com/contest/1324) — a second timing contest
* Kattis — any recent NWERC or NAC problem set, as a team, under contest conditions

## 9. Further reading

* Antti Laaksonen, *Competitive Programmer's Handbook* (free PDF) — the whole book is a good review of this year
* Steven Halim, Felix Halim, Suhendry Effendy, *Competitive Programming 4*, Books 1 and 2
* cp-algorithms (https://cp-algorithms.com) — reference for every algorithm in this curriculum
* USACO Guide (https://usaco.guide) — topic-organized practice with problem lists by difficulty
* KACTL (https://github.com/kth-competitive-programming/kactl) — a model team notebook to compare yours against
