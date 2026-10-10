---
marp: true
theme: default
paginate: true
header: "Competitive Programming · Year Curriculum · Week 18"
footer: "codingLectures"
---

<!-- _class: lead -->
# Mid-Year Review
### A problem-solving method, a topic map, and a mock contest

---

## Learning goals

- Connect the 17 topics so far into **one toolbox**
- Use a repeatable **method** for an unseen problem
- Turn constraints into a **target complexity** in seconds
- Recognise **signals** that point to a technique
- Sit a 3-hour **mock contest** and learn from the debrief
- Build an **upsolving** habit for the second half of the year

---

## Where we are

| Weeks | Block | Core tools |
|-------|-------|-----------|
| 1–3 | Foundations | judges, STL, complexity, brute force |
| 4–7 | Array techniques | sorting, greedy, binary search, two pointers, prefix sums |
| 8–11 | Search & math | backtracking, bitmasks, number theory, modular arithmetic |
| 12–13 | Data structures | stacks/queues, monotonic structures, heaps, sets/maps |
| 14–15 | Dynamic programming | 1D DP, knapsack, LIS, LCS, grid DP |
| 16–17 | Graphs | BFS/DFS, components, bipartite, shortest paths |

Second half: DSU/MST, trees, DAGs, segment trees, advanced DP, strings, geometry, flows…

---

## The method (1/2): understand

1. **Read everything** — statement, input format, constraints, notes
2. **Restate** the task in one sentence, in math, without the story
3. **Work the samples by hand** — do you get the same output?
4. **Make your own small cases**, especially edge cases: n = 1, all equal, all negative, disconnected graph
5. **Read the constraints** → target complexity (next slide)

> Most wrong answers come from solving a slightly different problem.

---

## Constraints → target complexity

~10⁸ simple operations per second.

| n up to | Target | Typical techniques |
|---------|--------|--------------------|
| 10–12 | O(n!) | permutations, backtracking |
| 20–25 | O(2ⁿ · n) | bitmask enumeration, meet-in-the-middle |
| 100–500 | O(n³) | Floyd-Warshall, interval DP |
| 5000 | O(n²) | 2D DP, all pairs |
| 2·10⁵ – 10⁶ | O(n log n) / O(n) | sorting, binary search, heaps, BFS, prefix sums |
| 10⁹ – 10¹⁸ | O(log n) / O(√n) | math, binary search on answer, fast power |

---

## The method (2/2): solve

6. **Brute force first** (in your head or on paper) — what is slow about it?
7. **Look for structure**: monotonicity? sortedness? overlapping subproblems? graph?
8. **Match signals** to techniques (next slides)
9. **Prove or at least test** the idea on your small cases *before* coding
10. **Code cleanly**, then test samples + your edge cases, then submit

If stuck > 15 min: reread the statement, try tiny cases exhaustively, change the viewpoint (sort? reverse? complement?).

---

## Signals → techniques (1/2)

| You see… | Think… |
|----------|--------|
| "minimum maximum", "smallest T such that…" | binary search on the answer (W5) |
| sorted array, pairs with sum / difference | two pointers (W6) |
| many range-sum queries, no updates | prefix sums (W7) |
| many range additions, then read | difference array (W7) |
| "next greater", "largest rectangle" | monotonic stack (W12) |
| sliding window max/min | monotonic deque (W12) |
| repeatedly take the best item | priority queue (W13) |

---

## Signals → techniques (2/2)

| You see… | Think… |
|----------|--------|
| "count ways", "min cost", choices with overlap | DP (W14–15) |
| subset under a budget | knapsack (W15) |
| two strings / sequences | prefix × prefix DP (W15) |
| n ≤ 20, "choose a subset" | bitmasks (W9) |
| "mod 10⁹+7", "nCr" | modular arithmetic (W11) |
| grid, maze, "minimum moves" | BFS (W16) |
| weighted, "cheapest route" | Dijkstra (W17) |
| "can be split into two groups" | bipartite (W16) |

---

## Debugging checklist (before you resubmit)

- **WA**: overflow? `int` vs `long long`; off-by-one; uninitialised / not-reset arrays between tests; reading input wrong; special cases n = 1
- **TLE**: complexity really OK? `endl` / no fast I/O; copying vectors by value; `map` where array works; infinite loop
- **RE**: out-of-bounds index; recursion depth; division by zero; empty container `.top()`/`.front()`
- **MLE**: 2D array too large; storing all states when rolling suffices

Week 35 adds stress testing: brute force + random generator + comparison.

---

## Mock contest: rules

- **3 hours**, individual, 8 problems, roughly increasing difficulty
- Any language reference allowed; no searching for solutions
- Penalty: ICPC-style (solved count, then time + 20 min per wrong try)
- Keep a log: when you read each problem, when you submitted, why it failed
- After the contest: **debrief** (today) and **upsolve** (this week)

---

## Mock contest: problem set

| # | Problem |
|---|---------|
| A | CF 1352C K-th Not Divisible by n |
| B | CSES 1640 Sum of Two Values |
| C | CSES 1620 Factory Machines |
| D | CSES 1662 Subarray Divisibility |
| E | CSES 1746 Array Description |
| F | AtCoder ABC 151 D Maze Master |
| G | CF 1272E Nearest Opposite Parity |
| H | CF 1201C Maximum Median |

Roughly increasing difficulty — read all eight in the first 20 minutes.

---

## Debrief

> **Solutions are not published here.** The coach holds the solutions and releases them only after the contest has been run.

- Go through your log: when you opened each problem, when you had the idea, why each submission failed
- Classify every lost minute: understanding, idea, coding, debugging
- Which problem did you solve latest relative to its position in the set? Why?
- Which rejection would the debugging checklist have prevented?

---

## After the contest: upsolving

- Solve **every** problem you didn't solve, within a week
- For each failed attempt, write one line: *what was the bug / missing idea?*
- Keep a personal **mistake log** — the same 5 bugs cause 80% of your WAs
- Re-solve a problem from scratch 3 days later without looking
- Rate yourself per topic: green / yellow / red → plan the next 2 weeks

---

## Practice: review set

- Weeks 4–7: CSES 1090 Ferris Wheel, CSES 1085 Array Division, CSES 1641 Sum of Three Values, CSES 1661 Subarray Sums II
- Weeks 9–13: CSES 1623 Apple Division, CSES 1095 Exponentiation, CSES 1645 Nearest Smaller Values, CSES 1164 Room Allocation
- Weeks 14–17: CSES 1634 Minimizing Coins, CSES 1145 Increasing Subsequence, CSES 1194 Monsters, CSES 1195 Flight Discount
- Virtual contest: any recent Codeforces Div. 3 round

---

## Summary

- One method: understand → constraints → brute force → structure → signals → verify → code
- Constraints tell you the complexity; the complexity narrows the technique
- Most bugs are boring: overflow, bounds, resets, misread statements
- Mock contest = measurement; **upsolving** = learning
- Next week: Disjoint Set Union & Minimum Spanning Trees
