# Lecture 10 — Mock National Championship & Post-Mortem

> National Championship Prep · Prerequisites: Nationals Lectures 1–9 (and the Year Curriculum and Regional track) · Estimated time: 5 h contest + 1.5 h debrief, and a 1 h post-mortem presentation in the following session

## 1. Overview

This session is a full simulation of a national championship (ICPC North America Championship, a national olympiad final, or a Codeforces Div 1 round stretched to five hours). The problem set below is **original** and was written for this course. Every problem is solvable with techniques from this track and its prerequisites, but the statements never name the technique, and — as in real contests — the problems are **not** ordered by difficulty.

The second half of the lecture is about the **post-mortem**. Teams that improve between regionals and nationals are rarely the ones that learn the most new algorithms; they are the ones that systematically find out *why* they lost points and change one habit at a time. Section 4 gives a template you should fill in after this mock and every future one.

How to use these notes:

* **Before the contest**: students see only the problem statements handout (Section 3's "Statement" paragraphs, expanded with full I/O format by the instructor).
* **During the debrief**: go through Section 3 in the order of the expected difficulty curve (A, E, F, C, K, B, H, J, D, G, I, L).
* **Afterwards**: upsolve every problem. The solutions are held by the coach and released only after the contest has been run; they are not part of these notes.

## 2. Contest rules

* Teams of three, one computer, five hours, a printed team reference document (≤ 25 pages, made in Lecture 1).
* ICPC scoring: number solved, then penalty time = Σ over solved problems of (minutes until AC + 20 × rejected submissions on that problem).
* Scoreboard freezes for the last hour.
* Language: C++17 with `-O2`. Default 8 MB stack — deep recursion on 3·10⁵-vertex graphs will crash; plan for it.
* All input is integral unless stated; output real numbers with absolute or relative error ≤ 10⁻⁶.

## 3. The problem set

Ratings are estimates on the Codeforces scale.

| | Problem | Rating |
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

> **Solutions are not published here.** The coach holds the solutions and releases them only after the contest has been run.

Only the statements are given below; solution sketches, traps and reference code are not published.

### A — Lanterns (≈1300)

**Statement.** A street is the segment [0, L] (1 ≤ L ≤ 10⁹). There are n ≤ 2·10⁵ lanterns; lantern i at integer position pᵢ with radius rᵢ lights the closed segment [pᵢ − rᵢ, pᵢ + rᵢ]. Output the minimum number of lanterns to switch on so that every point of [0, L] is lit, or −1.

### B — Recurring Revenue (≈2100)

**Statement.** Given k ≤ 20, coefficients c₁..c_k, constants d, e, and a₀..a_{k−1}. For i ≥ k, aᵢ = Σⱼ cⱼ aᵢ₋ⱼ + d·i + e (mod 10⁹+7). Answer q ≤ 2000 queries: a_n for n ≤ 10¹⁸.

### C — Toll Bridges (≈2000)

**Statement.** A connected undirected graph with n, m ≤ 3·10⁵ (multi-edges allowed, no self-loops). q ≤ 3·10⁵ queries (u, v): how many edges are there whose removal (alone) disconnects u from v?

### D — Distance Band (≈2300)

**Statement.** An unweighted tree with n ≤ 2·10⁵ vertices and integers 1 ≤ L ≤ R ≤ n. Count unordered pairs {u, v}, u ≠ v, with L ≤ dist(u, v) ≤ R.

### E — Echo (≈1900)

**Statement.** A lowercase string s, n ≤ 2·10⁵, and an integer 1 ≤ k ≤ n. Output the maximum length of a substring that occurs at least k times in s (occurrences may overlap); output 0 if none.

### F — Corridor (≈1900)

**Statement.** n ≤ 2·10⁵ integer points, |coordinates| ≤ 10⁹. Find the minimum width of an infinite straight strip (region between two parallel lines) containing all points.

### G — Overtime Assignment (≈2300)

**Statement.** n ≤ 100 workers and m ≤ 100 tasks. Worker i can do task j at cost cᵢⱼ ≥ 0 (or not at all). Every task must be done by exactly one worker. A worker who does t tasks additionally pays oᵢ · t(t − 1)/2 (the k-th task costs oᵢ · (k − 1) extra). Minimize the total, or report impossible.

### H — Twin Stations (≈2200)

**Statement.** n ≤ 1000 stations, 2 ≤ n. Station i must be built at position aᵢ or bᵢ on a line (integers, |·| ≤ 10⁹). Maximize the minimum distance between two built stations.

### I — Xor Treasure Map (≈2300)

**Statement.** A connected undirected graph, n, m, q ≤ 2·10⁵, weights 0 ≤ w < 2⁶⁰ (self-loops and multi-edges allowed). The value of a walk is the xor of the weights of the edges it traverses, counted with multiplicity. For each query (u, v) output the maximum value of a walk from u to v.

### J — Dice Tower (≈2200)

**Statement.** n dice; die i has fᵢ faces with values vᵢ₁..vᵢ_{fᵢ} ∈ [0, 10⁵] (values may repeat). Σ fᵢ ≤ 2·10⁵ and S = Σᵢ maxⱼ vᵢⱼ ≤ 2·10⁵. For every t in [0, S], output the number of ways (one face per die) to get total t, mod 998244353.

### K — Lighthouse (≈2000)

**Statement.** A lighthouse at the origin; n ≤ 2·10⁵ ships at integer points (not the origin, |coordinates| ≤ 10⁹) with values 1 ≤ wᵢ ≤ 10⁹. The beam is a closed sector with apex at the origin, infinite radius, and angle α degrees (integer, 1 ≤ α ≤ 359). Output the maximum total value of ships inside one beam position. It is guaranteed that the answer does not change if α changes by 10⁻⁶ degrees.

### L — Warehouse Districts (≈2400)

**Statement.** n ≤ 10⁵ positive integers aᵢ ≤ 10⁴ and k ≤ min(n, 100). Split the array into exactly k non-empty contiguous districts minimizing Σ (district sum)².

## 4. The post-mortem

### 4.1 Immediately after the contest (30 minutes, before the solutions are shown)

Write the **raw timeline** while memory is fresh: for each event, the time, the person, and what happened ("1:07 Bob reads K, labels it medium", "1:31 C WA on test 14", "2:10 keyboard idle 9 minutes"). Export the submission log from the judge. Do not analyse yet.

### 4.2 Per-problem table

Fill in one row per problem, including problems you never opened.

| Problem | Status (AC time / attempts) | First read (who, when) | Idea found (when) | Coding time | Wrong runs and cause | Root cause category | Note |
|---|---|---|---|---|---|---|---|
| A | | | | | | | |
| B | | | | | | | |
| … | | | | | | | |
| L | | | | | | | |

**Root-cause categories** (choose one primary per lost problem or wasted interval):

1. **Reading** — misread constraint/output format; missed a guarantee.
2. **Idea** — did not find the algorithm; or found a wrong one and did not prove it.
3. **Knowledge** — knew the idea but not the technique (e.g., had never coded the data structure the idea needed).
4. **Implementation** — bug in code that was conceptually right.
5. **Edge case / limits** — overflow, n = 1, recursion depth, precision.
6. **Strategy** — wrong problem order, two people on one problem, sunk-cost on a hard problem, idle keyboard.

### 4.3 Team-level questions

* Which problems did we never read carefully, and how hard were they really?
* When was the keyboard idle, and why?
* For each WA: would a stress test or a careful re-read of the statement have caught it? How long would that have taken?
* **Counterfactual score:** using only ideas the team *had* during the contest, what was the best achievable result with perfect execution? The gap between this and the real score is the strategy/implementation gap; the gap to the full set is the knowledge/idea gap. They need different training.
* What did the scoreboard tell us at 1:00 and 2:30 that we ignored?

### 4.4 Action items

At most **three**, each concrete and checkable at the next mock. Good: "Re-read every unsolved statement at the 2:00 mark", "Add an iterative DFS template to the notebook and test it on a 10⁶ path", "Whoever gets the second WA on a problem writes a brute force before resubmitting". Bad: "Be more careful", "Practise more geometry".

### 4.5 Individual reflection (each member, 10 minutes)

* One problem I should have solved and why I did not.
* One technique to drill this week (with 3 concrete practice problems).
* One habit to keep.

### 4.6 Notebook diff

List every piece of code you wished you had: missing templates (e.g., anything someone had to write from scratch during the contest), wrong ones, and ones that were too hard to find. Update and re-print the notebook within the week.

## 5. Common mistakes in mock contests

* **Reading in letter order.** In this set E, F, C and K are among the five easiest; teams that read linearly often find them after B and D have eaten an hour.
* **No division of the set.** Split the problems among the three members for the first read, then report one-line summaries.
* **Coding before the complexity check.** A solution that "works" on the samples can still TLE; estimate the worst-case operation count, not just the big-O, before typing.
* **Silent duplication.** Two people solving the same problem in their heads for 40 minutes.
* **No brute force after repeated WA.** The second wrong answer on a problem should trigger a stress test (Year week 35).
* **Treating the mock as a test, not a measurement.** The score matters far less than the post-mortem; teams that skip Section 4 do not improve.

## 6. Practice problems

Full sets for the next simulations (pick ones no team member has seen):

* ICPC North America Championship problem sets — available on Kattis (search the problem source "ICPC North America Championship") — https://open.kattis.com/
* ICPC Northern Eurasia (NERC) finals on Codeforces, e.g. 2023–2024 NERC — https://codeforces.com/contest/1912
* NWERC, SWERC, CERC sets in the Codeforces Gym — https://codeforces.com/gyms

## 7. Further reading

* Lecture 1 of this track (training system, team roles, notebook) — re-read it before writing your post-mortem.
* Year week 35 (contest strategy, stress testing) and Regional 01 (contest anatomy, triage).
* ICPC World Finals problem analyses and NAC editorials published by the judges each year — compare your post-mortem categories with what the judges expected to be hard.
* Next: World Finals track, Lecture 1 — WF format, problem archetypes, and five-hour strategy.
