---
marp: true
theme: default
paginate: true
header: "Competitive Programming · National Championship Prep · Lecture 10"
footer: "codingLectures"
---

<!-- _class: lead -->
# Mock National Championship
### 12 problems · 5 hours · 1 computer per team · then a real post-mortem

---

## Learning goals

- Run a full national-championship simulation under real conditions
- Apply Lectures 1–9 **without being told which technique to use**
- Practise triage on a set where the easy problems are **not** in order
- Produce a structured **post-mortem** that turns mistakes into action items
- Leave with an updated team notebook and a personal training plan

---

## Format and rules

- Teams of 3, **one computer**, 5 hours, printed team notebook (≤ 25 pages)
- ICPC scoring: problems solved, then penalty = Σ (solve minute + 20 × rejected runs)
- Scoreboard freeze in the last hour
- C++17, `-O2`; stack limit = default 8 MB (beware deep recursion!)
- Statements are on the handout; the problem slides in this deck restate the tasks only

<!-- Instructor: hand out statements only. Solutions are presented by the coach after the contest; they are not in this deck. -->

---

## Session plan

| Time | Activity |
|---|---|
| 0:00 – 0:10 | Setup, notebook check, template typed |
| 0:10 – 5:10 | Contest |
| 5:10 – 5:40 | Break; teams fill in the **raw timeline** |
| 5:40 – 7:00 | Debrief: problem-by-problem solutions |
| Next session | Team post-mortem presented (10 min/team), upsolving targets set |

---

## The problem set

| | Problem | Est. rating |
|---|---|---|
| A | Lanterns | 1300 |
| B | Recurring Revenue | 2100 |
| C | Toll Bridges | 2000 |
| D | Distance Band | 2300 |
| E | Echo | 1900 |
| F | Corridor | 1900 |
| G | Overtime Assignment | 2300 |
| H | Twin Stations | 2200 |
| I | Xor Treasure Map | 2300 |
| J | Dice Tower | 2200 |
| K | Lighthouse | 2000 |
| L | Warehouse Districts | 2400 |

---

## Solutions

> **Solutions are not published here.** The coach holds the solutions and releases them only after the contest has been run.

- The next slides restate each task in the expected difficulty order — no ideas, no traps
- Use them in the debrief to walk through your timeline problem by problem

---

## A — Lanterns (1300)

**Task.** Street [0, L]; lantern i lights [pᵢ − rᵢ, pᵢ + rᵢ]. Minimum number of lanterns covering all of [0, L], or −1. n ≤ 2·10⁵.

---

## E — Echo (1900)

**Task.** String s (n ≤ 2·10⁵) and k. Longest substring occurring ≥ k times (overlaps allowed).

---

## F — Corridor (1900)

**Task.** n ≤ 2·10⁵ integer points. Minimum width of an infinite straight strip containing them all.

---

## C — Toll Bridges (2000)

**Task.** Connected multigraph, n, m, q ≤ 3·10⁵. Query (u, v): how many edges, if removed alone, disconnect u from v?

---

## K — Lighthouse (2000)

**Task.** n ≤ 2·10⁵ ships with values at integer points ≠ origin. A beam is a closed sector of angle α (integer degrees) with apex at the origin. Max total value inside one beam position.

---

## B — Recurring Revenue (2100)

**Task.** aᵢ = Σⱼ₌₁..ₖ cⱼ aᵢ₋ⱼ + d·i + e (mod 10⁹+7), k ≤ 20. q ≤ 2000 queries for a_n, n ≤ 10¹⁸.

---

## H — Twin Stations (2200)

**Task.** n ≤ 1000 stations; station i goes at position aᵢ or bᵢ. Maximize the minimum distance between any two stations.

---

## J — Dice Tower (2200)

**Task.** n dice; die i has faces with values in [0, 10⁵]. Total faces ≤ 2·10⁵ and
S = Σ (max face) ≤ 2·10⁵. For each total t ∈ [0, S], count outcomes mod 998244353.

---

## D — Distance Band (2300)

**Task.** Tree, n ≤ 2·10⁵. Count unordered pairs with L ≤ dist(u, v) ≤ R.

---

## G — Overtime Assignment (2300)

**Task.** n, m ≤ 100. Worker i can do task j for cᵢⱼ (or not at all). Each task done once. A worker doing t tasks pays extra oᵢ·t(t−1)/2. Minimize total cost.

---

## I — Xor Treasure Map (2300)

**Task.** Connected graph, weights < 2⁶⁰, n, m, q ≤ 2·10⁵. Query (u, v): max xor over all walks u → v (edges reusable).

---

## L — Warehouse Districts (2400)

**Task.** Positive aᵢ ≤ 10⁴, n ≤ 10⁵. Split into exactly k ≤ 100 contiguous parts minimizing Σ (part sum)².

---

## Expected difficulty curve

```
solves
  ^
  | A
  | E F C K
  | B H J
  | D G I
  | L
  +-------------------------> rating 1300 ... 2400
```

Gold-medal pace: 9–10 problems. Advance-to-finals pace: 7–8. Solid: 5–6.
The set is **not** sorted: E, F, C, K are as easy as they look — did you find them in the first hour?

---

## Post-mortem: process

1. **Raw timeline** (immediately): every read, submit, verdict, who was on the keyboard
2. **Per-problem table**: status, first-read time, idea time, AC time, wrong runs, root cause
3. **Root-cause categories**: reading · idea · implementation · edge case · strategy/time
4. **Counterfactual**: "with perfect play on what we *knew*, what was our score?"
5. **Three action items** max, each concrete and testable
6. **Notebook diff**: what code was missing or wrong?

---

## Post-mortem template (per problem)

| Field | Example |
|---|---|
| Problem / status | H — AC at 3:41, 2 WA |
| First read by / at | Alice, 0:12 |
| Idea found at | 2:50 |
| Why so late? | Stuck on a wrong first idea; nobody re-read after 1:00 |
| WA causes | overflow in an intermediate product; missed an edge case in the statement |
| Fix / action | add a self-tested template to the notebook; re-read rule at 1:30 |

---

## Metrics worth tracking across mocks

- Time to first AC; time to 3 ACs
- Idle-keyboard minutes
- Wrong submissions per AC (target < 0.5)
- Problems where the idea was known but not coded in time
- "Read but never attempted" problems that turned out easy
- Upsolve completion within one week (target: every problem ≤ 2400)

---

## Common contest-level mistakes

- Reading in letter order and missing easy E/F/K
- Two people silently working on the same problem
- Coding before writing down the idea and the complexity
- No stress test after the second WA
- Leaving the computer idle while someone thinks
- Freeze-hour panic: submitting unverified "fixes"

---

## Practice after the mock

- Upsolve every mock problem once the coach releases the solutions
- Real sets to simulate next: ICPC North America Championship sets (Kattis), NERC finals (Codeforces Gym / contest 1912), NWERC / SWERC on Codeforces Gym

---

## Summary

- A mock is only as valuable as its **post-mortem**
- Map each miss to a category; fix the category, not the instance
- Update the notebook the same week
- Next: World Finals track — mindset, polynomials, matching & LP, advanced trees
