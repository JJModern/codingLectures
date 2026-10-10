# Lecture 10 — Mock Regional

> Regional Level · Prerequisites: Lectures 1–9 of this track · Estimated time: 5 hours contest + 1.5 hours debrief

## 1. Overview

This lecture is a full mock regional: eleven original problems (A–K) modelled on the shape of a real ICPC regional set, followed by a structured debrief. Every lecture of the track appears at least once, in disguise. The coach prints Section 3 (statements) for the contest; the solutions and reference code are held by the coach and are not published in these notes.

The statements below are summaries; before running the mock, the coach should expand each into a full statement with input/output format and samples (the coach's reference solutions make generating sample data straightforward). Time limits: 2 seconds for every problem.

## 2. Running the mock

- **Rules**: 5 hours, teams of three, one computer, printed notebook, standard ICPC scoring (solved problems, then penalty with 20 minutes per rejected submission on solved problems), scoreboard frozen for the final hour.
- **Judge**: any local judge (DOMjudge, a Codeforces Gym mashup with your own tests, or the coach checking outputs by script).
- **Order**: problems are alphabetical, not sorted by difficulty, exactly as at NWERC or NAC.
- **Logging**: each team keeps the problem board from Lecture 1. The board is the main input to the debrief, so it must record when each problem was read, labelled, started, and accepted.

## 3. Problem statements (summaries)

**A — Odometer Without Fours.** A faulty odometer never displays a number containing the digit 4: after 3 it shows 5, after 39 it shows 50. It started at 0. Given the displayed value `D` (no digit 4, `0 ≤ D ≤ 10¹⁸`), output the true distance driven.

**B — Arrow Grid.** An `R × C` grid (`R, C ≤ 1000`) has an arrow `U`, `D`, `L`, or `R` in each cell. A robot starts at a given cell and every second moves one cell in the direction of the arrow it is standing on; if that move would leave the grid, it stays where it is forever. Output its cell after `K ≤ 10¹⁸` seconds.

**C — Toll Vouchers.** A road network has `n ≤ 10⁵` cities and `m ≤ 2·10⁵` one-way roads with tolls up to 10⁹. You have `k ≤ 10` vouchers; each makes one road free. Find the minimum total toll from city 1 to city `n`, or report that `n` is unreachable.

**D — Lab Bookings.** One laboratory, `n ≤ 2·10⁵` experiments. Experiment `i` takes `p_i` hours and must be finished by hour `d_i` (`p_i, d_i ≤ 10⁹`). Experiments run one at a time without interruption starting at hour 0. Maximise the number of experiments completed on time.

**E — Double Coverage.** Given `n ≤ 2·10⁵` half-open intervals `[l_i, r_i)` with `−10⁹ ≤ l_i < r_i ≤ 10⁹` and an integer `K`, output the total length of the set of points covered by at least `K` intervals.

**F — Gears.** There are `n ≤ 1000` gears; gear `i` has `m_i ≤ 10⁹` teeth, and its marked tooth is currently at position `r_i` (`0 ≤ r_i < m_i`). Every second each gear advances by one tooth (position `r_i` becomes `r_i + 1 mod m_i`). Output the first second `t ≥ 0` at which every marked tooth is at position 0, or `never`. The lcm of all `m_i` is guaranteed to be at most 10¹⁸.

**G — Palindrome Banner.** Given a lowercase string `s` (`|s| ≤ 10⁶`), append as few letters as possible to its end so that it becomes a palindrome. Output the resulting palindrome.

**H — Rest Stops.** A hiking trail has checkpoints `1 … n` (`n ≤ 10⁶`); resting at checkpoint `i` costs `c_i ≥ 0`. You start at checkpoint 0 and finish at `n + 1`, both free. Between any two consecutive rests (counting start and finish) you may pass at most `k − 1` checkpoints, i.e. their indices differ by at most `k`. Minimise the total cost.

**I — Coprime Committees.** A club has `n ≤ 2·10⁵` members with ratings `a_i ≤ 10⁶`. A committee is a non-empty subset of members; it is *balanced* if the gcd of its ratings is 1. Count balanced committees modulo 10⁹ + 7.

**J — Fence Lattice.** `n ≤ 10⁵` trees stand at distinct integer points with coordinates of absolute value at most 10⁶. A fence is built along the convex hull of the trees. How many lattice points lie strictly inside the fence?

**K — Forbidden Jingle.** Count the strings of length `n ≤ 10¹⁸` over the first `σ ≤ 26` lowercase letters that do not contain the string `p` (`1 ≤ |p| ≤ 30`) as a contiguous substring, modulo 10⁹ + 7.

## 4. Intended difficulty

| Problem | Difficulty |
|---|---|
| A | Easy |
| E | Easy |
| B | Easy-medium |
| C | Medium |
| D | Medium |
| F | Medium |
| G | Medium |
| H | Medium |
| J | Medium |
| I | Medium-hard |
| K | Hard |

> **Solutions are not published here.** The coach holds the solutions and releases them only after the contest has been run.

Solution sketches and reference implementations are not included in these notes.

## 5. The debrief

Hold the debrief the same day if possible, before anyone looks up solutions. Allow about 90 minutes.

### 5.1 Timeline table

Each team fills in one row per problem from its problem board:

| Problem | Read at | Label | Started | Accepted at | Rejected tries | Time lost on | Root cause |
|---|---|---|---|---|---|---|---|
| A | | | | | | | |
| B | | | | | | | |
| … | | | | | | | |

Root causes, one per incident: **misread** statement, **wrong idea**, **implementation bug**, **overflow**, **TLE**, **output format**, **idle machine** (someone thinking at the keyboard), **coordination** (two people on one problem, lost hand-off).

### 5.2 Questions

1. Compare your solve order with the intended difficulty table. Which problem did you solve latest relative to its difficulty, and why?
2. How many minutes was the machine idle or used for thinking? (Estimate from the board.)
3. Which rejections would the 60-second checklist from Lecture 1 have prevented?
4. Which unsolved problem was closest? Was the missing piece an idea or an implementation?
5. Which notebook snippet was missing or wrong? Which one saved time?
6. One concrete change in team process for the next contest.

### 5.3 Upsolving

- Within one week, every member solves every problem the team did not solve, alone.
- For every rejected submission, write the test that would have caught it and add it to a personal "trap list".
- Add any missing notebook code (anything you wished you had during the contest), compiled and tested.

### 5.4 Interpreting the score

| Solved | Interpretation |
|---|---|
| 3 (A, E, B) | Fundamentals in place; focus on the medium band |
| 5–6 | Solid regional team; work on speed and penalty |
| 8–9 | Medal contention at most regionals |
| 10–11 | Ready for the National Championship track |

## 6. Common mistakes (seen in previous runs of this kind of mock)

Problem-specific traps are discussed by the coach in the debrief. The generic ones:

- **Overflow**: answers, lengths and sums above 2·10⁹ need `long long`; intermediate products above 10¹⁸ need `__int128`.
- **Special outputs**: the "never", "unreachable" and "stays forever" cases in the statements are part of the problem; test them before submitting.
- **"At most" vs "exactly"**: reread every quantifier in the statement.
- **Modular subtraction**: forgetting `+ MOD` after subtracting.
- **Degenerate input**: n at its minimum, all values equal, everything on one line.
- **Team level**: nobody reading the last problems until the final hour, or three people stuck on one problem while a medium sat unread.

## 7. Practice problems: more mocks

Use real regional sets for further mock contests (most are available as Codeforces Gym contests or on Kattis; search for the contest name and year):

- NWERC (Northwestern Europe) — e.g. NWERC 2022 and 2023.
- SWERC (Southwestern Europe).
- CERC (Central Europe).
- ICPC North America Championship and the NA regional contests (NAC, NCNA, SER, ...).
- NCPC (Nordic), a good "first full mock" because of its gentle easy problems.
- ICPC Asia regionals (Jakarta, Seoul, Taichung, ...), often available on Codeforces Gym.


## 8. Further reading

- Lecture 1 of this track (triage, the problem board, the 60-second checklist).
- ICPC regional results and problem archives: https://icpc.global (follow the links to each regional's site).
- DOMjudge (https://www.domjudge.org) for running a local judge with your own test data.
- National Championship Prep track, Lecture 1 (training systems, virtual contests, upsolving), which picks up from this debrief.
