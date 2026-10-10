# Competitive Programming Lectures

A complete, sequenced course in competitive programming: a full academic year of weekly lectures, followed by three advanced tracks for regional, national-championship, and World Finals preparation.

Every lecture folder contains:

- **`slides.md`** — a [Marp](https://marp.app) slide deck (present it with the Marp VS Code extension, or export with `npx @marp-team/marp-cli slides.md --pdf`).
- **`notes.md`** — full lecture notes with explanations, worked examples, C++17 reference code, common mistakes, and practice problems.

See [AUTHORING.md](AUTHORING.md) for the format conventions.

## Progression

| Track | Lectures | Target level |
|---|---|---|
| [Year Curriculum](01-Year-Curriculum) | 36 | Beginner → Codeforces ~1700 / USACO Gold |
| [Regionals](02-Regionals) | 10 | ICPC regional contest |
| [Nationals](03-Nationals) | 10 | ICPC NAC / national championship |
| [World Finals](04-World-Finals) | 10 | ICPC World Finals |

## Suggested weekly rhythm

1. **Lecture (60–90 min)** — present `slides.md`.
2. **Lab (60 min)** — solve the first practice problems from `notes.md` together.
3. **Weekly contest (2–3 h)** — virtual contest on Codeforces/AtCoder/Kattis.
4. **Upsolve** — every unsolved problem from the contest, before next week.

## Year Curriculum — Foundations to Advanced (36 weeks)

One lecture per week across a two-semester academic year. Semester 1 (weeks 1–18) builds fluency: C++/STL, complete search, greedy, binary search, number theory, core data structures, introductory DP and graphs. Semester 2 (weeks 19–36) covers the standard advanced toolkit: DSU/MST, trees and LCA, segment/Fenwick trees, advanced DP, strings, combinatorics, geometry, flows, game theory, and sqrt techniques, ending with contest strategy and a final mock contest.

| # | Lecture | Slides | Notes |
|---|---|---|---|
| | **Semester 1 — Foundations** | | |
| 1 | Intro to Competitive Programming: judges, verdicts, I/O, first problems | [slides](01-Year-Curriculum/week-01-intro-and-judges/slides.md) | [notes](01-Year-Curriculum/week-01-intro-and-judges/notes.md) |
| 2 | C++ for CP: STL containers, algorithms, fast I/O, templates | [slides](01-Year-Curriculum/week-02-cpp-and-stl/slides.md) | [notes](01-Year-Curriculum/week-02-cpp-and-stl/notes.md) |
| 3 | Complexity analysis & complete search / brute force | [slides](01-Year-Curriculum/week-03-complexity-complete-search/slides.md) | [notes](01-Year-Curriculum/week-03-complexity-complete-search/notes.md) |
| 4 | Sorting, custom comparators & greedy basics | [slides](01-Year-Curriculum/week-04-sorting-and-greedy/slides.md) | [notes](01-Year-Curriculum/week-04-sorting-and-greedy/notes.md) |
| 5 | Binary search & binary search on the answer | [slides](01-Year-Curriculum/week-05-binary-search/slides.md) | [notes](01-Year-Curriculum/week-05-binary-search/notes.md) |
| 6 | Two pointers & sliding window | [slides](01-Year-Curriculum/week-06-two-pointers/slides.md) | [notes](01-Year-Curriculum/week-06-two-pointers/notes.md) |
| 7 | Prefix sums, 2D prefix sums & difference arrays | [slides](01-Year-Curriculum/week-07-prefix-sums/slides.md) | [notes](01-Year-Curriculum/week-07-prefix-sums/notes.md) |
| 8 | Recursion & backtracking (subsets, permutations, N-Queens, pruning) | [slides](01-Year-Curriculum/week-08-recursion-backtracking/slides.md) | [notes](01-Year-Curriculum/week-08-recursion-backtracking/notes.md) |
| 9 | Bit manipulation & bitmask enumeration | [slides](01-Year-Curriculum/week-09-bit-manipulation/slides.md) | [notes](01-Year-Curriculum/week-09-bit-manipulation/notes.md) |
| 10 | Number theory I: divisibility, gcd/lcm, primes, sieve, factorization | [slides](01-Year-Curriculum/week-10-number-theory-1/slides.md) | [notes](01-Year-Curriculum/week-10-number-theory-1/notes.md) |
| 11 | Number theory II: modular arithmetic, fast power, inverses, nCr mod p | [slides](01-Year-Curriculum/week-11-number-theory-2/slides.md) | [notes](01-Year-Curriculum/week-11-number-theory-2/notes.md) |
| 12 | Stacks, queues, deques, monotonic stack & monotonic queue | [slides](01-Year-Curriculum/week-12-stacks-queues/slides.md) | [notes](01-Year-Curriculum/week-12-stacks-queues/notes.md) |
| 13 | Priority queues, ordered sets/maps, policy-based DS | [slides](01-Year-Curriculum/week-13-heaps-sets-maps/slides.md) | [notes](01-Year-Curriculum/week-13-heaps-sets-maps/notes.md) |
| 14 | Dynamic Programming I: memoization, tabulation, 1D DP | [slides](01-Year-Curriculum/week-14-dp-1/slides.md) | [notes](01-Year-Curriculum/week-14-dp-1/notes.md) |
| 15 | Dynamic Programming II: knapsack, LIS, LCS, edit distance, grid DP | [slides](01-Year-Curriculum/week-15-dp-2/slides.md) | [notes](01-Year-Curriculum/week-15-dp-2/notes.md) |
| 16 | Graphs I: representations, BFS, DFS, components, grids, bipartite check | [slides](01-Year-Curriculum/week-16-graphs-1/slides.md) | [notes](01-Year-Curriculum/week-16-graphs-1/notes.md) |
| 17 | Graphs II: Dijkstra, Bellman-Ford, Floyd-Warshall, 0-1 BFS | [slides](01-Year-Curriculum/week-17-shortest-paths/slides.md) | [notes](01-Year-Curriculum/week-17-shortest-paths/notes.md) |
| 18 | Mid-year review, problem-solving method & mock contest | [slides](01-Year-Curriculum/week-18-midyear-review/slides.md) | [notes](01-Year-Curriculum/week-18-midyear-review/notes.md) |
| | **Semester 2 — Advanced Toolkit** | | |
| 19 | Disjoint Set Union & Minimum Spanning Trees (Kruskal, Prim) | [slides](01-Year-Curriculum/week-19-dsu-mst/slides.md) | [notes](01-Year-Curriculum/week-19-dsu-mst/notes.md) |
| 20 | Trees: traversals, diameter, subtree sizes, tree DP, rerooting intro | [slides](01-Year-Curriculum/week-20-trees/slides.md) | [notes](01-Year-Curriculum/week-20-trees/notes.md) |
| 21 | DAGs, topological sort, DP on DAGs, SCC (Kosaraju/Tarjan) | [slides](01-Year-Curriculum/week-21-dag-toposort-scc/slides.md) | [notes](01-Year-Curriculum/week-21-dag-toposort-scc/notes.md) |
| 22 | LCA, binary lifting, Euler tour & tree flattening | [slides](01-Year-Curriculum/week-22-lca-binary-lifting/slides.md) | [notes](01-Year-Curriculum/week-22-lca-binary-lifting/notes.md) |
| 23 | Segment trees: point update, range query, walking the tree | [slides](01-Year-Curriculum/week-23-segment-trees/slides.md) | [notes](01-Year-Curriculum/week-23-segment-trees/notes.md) |
| 24 | Fenwick trees & sparse tables (RMQ) | [slides](01-Year-Curriculum/week-24-fenwick-sparse-table/slides.md) | [notes](01-Year-Curriculum/week-24-fenwick-sparse-table/notes.md) |
| 25 | Lazy propagation & range-update/range-query | [slides](01-Year-Curriculum/week-25-lazy-propagation/slides.md) | [notes](01-Year-Curriculum/week-25-lazy-propagation/notes.md) |
| 26 | Bitmask DP (TSP, assignment, subsets) | [slides](01-Year-Curriculum/week-26-bitmask-dp/slides.md) | [notes](01-Year-Curriculum/week-26-bitmask-dp/notes.md) |
| 27 | Interval DP & digit DP | [slides](01-Year-Curriculum/week-27-interval-digit-dp/slides.md) | [notes](01-Year-Curriculum/week-27-interval-digit-dp/notes.md) |
| 28 | Strings I: polynomial hashing, prefix function (KMP), Z-function | [slides](01-Year-Curriculum/week-28-strings-1/slides.md) | [notes](01-Year-Curriculum/week-28-strings-1/notes.md) |
| 29 | Strings II: tries, Aho-Corasick, suffix array introduction | [slides](01-Year-Curriculum/week-29-strings-2/slides.md) | [notes](01-Year-Curriculum/week-29-strings-2/notes.md) |
| 30 | Combinatorics, inclusion-exclusion, probability & expected value | [slides](01-Year-Curriculum/week-30-combinatorics-probability/slides.md) | [notes](01-Year-Curriculum/week-30-combinatorics-probability/notes.md) |
| 31 | Computational geometry I: vectors, cross product, orientation, segments, polygon area, convex hull | [slides](01-Year-Curriculum/week-31-geometry-1/slides.md) | [notes](01-Year-Curriculum/week-31-geometry-1/notes.md) |
| 32 | Network flow I: max-flow (Edmonds-Karp, Dinic), min cut, bipartite matching | [slides](01-Year-Curriculum/week-32-network-flow-1/slides.md) | [notes](01-Year-Curriculum/week-32-network-flow-1/notes.md) |
| 33 | Game theory: win/lose states, Nim, Sprague-Grundy | [slides](01-Year-Curriculum/week-33-game-theory/slides.md) | [notes](01-Year-Curriculum/week-33-game-theory/notes.md) |
| 34 | Square-root decomposition & Mo's algorithm | [slides](01-Year-Curriculum/week-34-sqrt-decomposition-mo/slides.md) | [notes](01-Year-Curriculum/week-34-sqrt-decomposition-mo/notes.md) |
| 35 | Contest strategy, debugging, stress testing & team play | [slides](01-Year-Curriculum/week-35-contest-strategy/slides.md) | [notes](01-Year-Curriculum/week-35-contest-strategy/notes.md) |
| 36 | Final review, year retrospective & mock contest | [slides](01-Year-Curriculum/week-36-final-review/slides.md) | [notes](01-Year-Curriculum/week-36-final-review/notes.md) |

## Regional Level (10 lectures)

For teams preparing for ICPC regional contests. Assumes the Year Curriculum. Focuses on medium-hard patterns, modeling, implementation under pressure, and three-people-one-computer strategy, closing with a full mock regional.

| # | Lecture | Slides | Notes |
|---|---|---|---|
| 1 | Anatomy of a regional: problem set shape, triage, 3-person/1-computer workflow | [slides](02-Regionals/regional-01-contest-anatomy/slides.md) | [notes](02-Regionals/regional-01-contest-anatomy/notes.md) |
| 2 | Implementation-heavy & simulation problems; parsing; clean code under pressure | [slides](02-Regionals/regional-02-implementation/slides.md) | [notes](02-Regionals/regional-02-implementation/notes.md) |
| 3 | Advanced greedy: exchange arguments, scheduling, regret/heap greedy | [slides](02-Regionals/regional-03-advanced-greedy/slides.md) | [notes](02-Regionals/regional-03-advanced-greedy/notes.md) |
| 4 | Graph modeling: state-space search, multi-source BFS, 0-1 BFS, Dijkstra on states | [slides](02-Regionals/regional-04-graph-modeling/slides.md) | [notes](02-Regionals/regional-04-graph-modeling/notes.md) |
| 5 | Regional DP patterns: prefix-sum/monotonic-queue optimizations, DP on subsequences, reconstruction | [slides](02-Regionals/regional-05-dp-patterns/slides.md) | [notes](02-Regionals/regional-05-dp-patterns/notes.md) |
| 6 | Coordinate compression, sweep line, segment-tree patterns in practice | [slides](02-Regionals/regional-06-range-queries-sweep/slides.md) | [notes](02-Regionals/regional-06-range-queries-sweep/notes.md) |
| 7 | Number theory for regionals: ext. Euclid, CRT, Euler phi, inclusion-exclusion, Möbius intro | [slides](02-Regionals/regional-07-number-theory/slides.md) | [notes](02-Regionals/regional-07-number-theory/notes.md) |
| 8 | Geometry for regionals: convex hull, point-in-polygon, line intersection, precision | [slides](02-Regionals/regional-08-geometry/slides.md) | [notes](02-Regionals/regional-08-geometry/notes.md) |
| 9 | Strings for regionals: hashing tricks, Manacher, palindromes, string DP | [slides](02-Regionals/regional-09-strings/slides.md) | [notes](02-Regionals/regional-09-strings/notes.md) |
| 10 | Mock regional: full problem set walkthrough & debrief | [slides](02-Regionals/regional-10-mock-regional/slides.md) | [notes](02-Regionals/regional-10-mock-regional/notes.md) |

## National Championship Preparation (10 lectures)

For teams that advance past regionals (e.g., ICPC North America Championship and national finals). Advanced data structures, DP optimizations, tree decompositions, min-cost flow, suffix structures, FFT/linear algebra, harder geometry and graph theory, ending with a mock national championship.

| # | Lecture | Slides | Notes |
|---|---|---|---|
| 1 | Training at the championship level: virtual contests, upsolving, team roles, notebook | [slides](03-Nationals/nationals-01-training-system/slides.md) | [notes](03-Nationals/nationals-01-training-system/notes.md) |
| 2 | Persistent segment trees, merge-sort trees, treaps / implicit treaps | [slides](03-Nationals/nationals-02-advanced-ds/slides.md) | [notes](03-Nationals/nationals-02-advanced-ds/notes.md) |
| 3 | DP optimizations: convex hull trick, Li Chao tree, divide & conquer DP, Knuth | [slides](03-Nationals/nationals-03-dp-optimizations/slides.md) | [notes](03-Nationals/nationals-03-dp-optimizations/notes.md) |
| 4 | Heavy-light decomposition, centroid decomposition, small-to-large merging | [slides](03-Nationals/nationals-04-tree-decompositions/slides.md) | [notes](03-Nationals/nationals-04-tree-decompositions/notes.md) |
| 5 | Flows II: min-cost max-flow, Hopcroft-Karp, min-cut modeling, flows with lower bounds | [slides](03-Nationals/nationals-05-flows-2/slides.md) | [notes](03-Nationals/nationals-05-flows-2/notes.md) |
| 6 | Suffix array + LCP, suffix automaton, applications | [slides](03-Nationals/nationals-06-advanced-strings/slides.md) | [notes](03-Nationals/nationals-06-advanced-strings/notes.md) |
| 7 | Matrix exponentiation, linear recurrences, FFT/NTT, Gaussian elimination (incl. XOR basis) | [slides](03-Nationals/nationals-07-advanced-math/slides.md) | [notes](03-Nationals/nationals-07-advanced-math/notes.md) |
| 8 | Geometry II: rotating calipers, half-plane intersection, closest pair, angular sweep | [slides](03-Nationals/nationals-08-geometry-2/slides.md) | [notes](03-Nationals/nationals-08-geometry-2/notes.md) |
| 9 | Bridges & articulation points, biconnected components, 2-SAT, Euler paths/circuits | [slides](03-Nationals/nationals-09-advanced-graphs/slides.md) | [notes](03-Nationals/nationals-09-advanced-graphs/notes.md) |
| 10 | Mock national championship & post-mortem | [slides](03-Nationals/nationals-10-mock-nationals/slides.md) | [notes](03-Nationals/nationals-10-mock-nationals/notes.md) |

## World Finals Level (10 lectures)

For ICPC World Finals contenders. Polynomial algebra, LP and general matching, link-cut trees, offline divide & conquer, 3D/robust geometry, advanced combinatorics, WF-level strings and DP, ending with building the team reference document and a full WF simulation.

| # | Lecture | Slides | Notes |
|---|---|---|---|
| 1 | World Finals: format, problem-set archetypes, 5-hour strategy, past WF analysis | [slides](04-World-Finals/worldfinals-01-wf-mindset/slides.md) | [notes](04-World-Finals/worldfinals-01-wf-mindset/notes.md) |
| 2 | Polynomial techniques: NTT applications, inverse/log/exp, Berlekamp-Massey, Lagrange interpolation | [slides](04-World-Finals/worldfinals-02-polynomials/slides.md) | [notes](04-World-Finals/worldfinals-02-polynomials/notes.md) |
| 3 | Hungarian algorithm, general matching (blossom), LP duality & simplex, flows with demands | [slides](04-World-Finals/worldfinals-03-matching-lp/slides.md) | [notes](04-World-Finals/worldfinals-03-matching-lp/notes.md) |
| 4 | Link-cut trees, DSU on tree, virtual (auxiliary) trees, rerooting DP | [slides](04-World-Finals/worldfinals-04-advanced-trees/slides.md) | [notes](04-World-Finals/worldfinals-04-advanced-trees/notes.md) |
| 5 | CDQ divide & conquer, parallel binary search, offline dynamic connectivity, Mo with updates | [slides](04-World-Finals/worldfinals-05-offline-techniques/slides.md) | [notes](04-World-Finals/worldfinals-05-offline-techniques/notes.md) |
| 6 | 3D geometry & 3D hull, Delaunay/Voronoi, Minkowski sums, robustness & exact arithmetic | [slides](04-World-Finals/worldfinals-06-advanced-geometry/slides.md) | [notes](04-World-Finals/worldfinals-06-advanced-geometry/notes.md) |
| 7 | Burnside/Pólya, Möbius inversion, generating functions, min-25/Dirichlet techniques | [slides](04-World-Finals/worldfinals-07-advanced-combinatorics/slides.md) | [notes](04-World-Finals/worldfinals-07-advanced-combinatorics/notes.md) |
| 8 | Palindromic tree (eertree), suffix tree, Lyndon factorization, string periodicity | [slides](04-World-Finals/worldfinals-08-advanced-strings/slides.md) | [notes](04-World-Finals/worldfinals-08-advanced-strings/notes.md) |
| 9 | SOS DP, broken-profile DP, Aliens trick (WQS binary search), slope trick | [slides](04-World-Finals/worldfinals-09-hard-dp/slides.md) | [notes](04-World-Finals/worldfinals-09-hard-dp/notes.md) |
| 10 | Team reference document (TRD) construction & full World Finals simulation | [slides](04-World-Finals/worldfinals-10-notebook-simulation/slides.md) | [notes](04-World-Finals/worldfinals-10-notebook-simulation/notes.md) |
