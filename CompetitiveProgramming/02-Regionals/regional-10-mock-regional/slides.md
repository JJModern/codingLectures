---
marp: true
theme: default
paginate: true
header: "Competitive Programming · Regional Level · Lecture 10"
footer: "codingLectures"
---

<!-- _class: lead -->
# Mock Regional
### 11 problems, 5 hours, 1 computer — then the debrief

---

## Learning goals

- Run a full regional simulation under real rules
- Practise triage, the problem board, and keyboard scheduling
- Recognise every technique from Lectures 2–9 in disguise
- Debrief systematically: what cost time, what cost penalty, what to train next

---

## Rules for the mock

- 5 hours, teams of 3, **one computer**, printed notebook allowed
- Standard scoring: solved, then penalty (20 min per rejected try)
- Scoreboard frozen for the last hour
- No internet except the judge; clarifications via the coach
- Problems in alphabetical order — **not** sorted by difficulty

---

## The set at a glance (no spoilers)

| | Title | | Title |
|---|---|---|---|
| A | Odometer Without Fours | G | Palindrome Banner |
| B | Arrow Grid | H | Rest Stops |
| C | Toll Vouchers | I | Coprime Committees |
| D | Lab Bookings | J | Fence Lattice |
| E | Double Coverage | K | Forbidden Jingle |
| F | Gears | | |

- Statements are summarised in the notes; hand them out printed

---

## Recommended first 20 minutes

- Split: A–D, E–H, I–K (+ template typing)
- Label E / M / H with one-line ideas
- First keyboard: whichever **E** is found first
- Expectation: 2 easy, 1 easy-medium, 5 medium, 2 medium-hard, 1 hard

<!-- Do not show the following slides until the contest is over. -->

---

<!-- _class: lead -->
# Debrief
### Solutions and what each problem was testing

---

## Intended difficulty and topics

| | Difficulty | Topic (lecture) |
|---|---|---|
| A | Easy | base conversion (2) |
| E | Easy | 1D sweep (6) |
| B | Easy-medium | simulation + cycle detection (2) |
| C | Medium | Dijkstra on layered states (4) |
| D | Medium | Moore–Hodgson greedy (3) |
| F | Medium | general CRT (7) |
| G | Medium | prefix function / palindromic suffix (9) |
| J | Medium | convex hull + Pick (8) |
| H | Medium | DP + monotonic deque (5) |
| I | Medium-hard | exact-gcd sieve (7) |
| K | Hard | KMP automaton + matrix power (9) |

---

## A — Odometer Without Fours

- Display skips every number containing digit 4; given the display, find the true distance
- Displayed numbers = **base 9** written with digits {0,1,2,3,5,…,9}
- Map digits 5–9 → 4–8, read in base 9

```cpp
for (char ch : d) { int x = ch - '0'; if (x > 4) x--; v = v * 9 + x; }
```

- Trap: answers reach ≈ 1.35·10¹⁸ (19-digit display) → `long long`, never `int`

---

## E — Double Coverage

- n half-open intervals, find total length covered by **≥ K** of them
- Events `(l, +1)`, `(r, −1)`; sort; add `x_next − x` while count ≥ K
- Order at equal x is irrelevant here (zero-length gaps) — know *why*
- Trap: "at least K" vs "exactly K"; coordinates in [−10⁹, 10⁹] ⇒ length up to 2·10⁹ → `long long`

---

## B — Arrow Grid

- Robot follows the arrow in its cell; leaving the grid = stop forever
- K ≤ 10¹⁸ steps ⇒ cycle detection on **cells** (the direction is a function of the cell)
- `first[cell]`; on repeat jump with `(K − t) mod len`
- Trap: the "stopped" state must be handled before cycle logic

---

## C — Toll Vouchers

- ≤ 10 vouchers, each makes one road free; cheapest route 1 → n
- State `(city, vouchers used)`: (k+1)·n ≈ 1.1·10⁶ states, Dijkstra
- Answer: **min over all layers** (using fewer vouchers is allowed)
- Trap: `int` distances (tolls up to 10⁹ × path length)

---

## D — Lab Bookings

- Experiments with durations and deadlines; maximise the number completed
- Sort by deadline, push durations into a max-heap, drop the longest when late (Moore–Hodgson)
- Trap: dropping the *current* experiment instead of the longest
- Proof sketch expected in the debrief (Lecture 3)

---

## F — Gears

- Gear i: m_i teeth, mark at tooth r_i, advances 1 tooth/s; first t with all marks at 0
- `t ≡ −r_i (mod m_i)` for all i — moduli **not** coprime
- General CRT merge with `__int128`; inconsistent ⇒ `never`
- Trap: `t = 0` if all marks are already at 0; normalise `−r_i mod m_i`

---

## G — Palindrome Banner

- Append the fewest letters to the end of s to make a palindrome
- Keep the **longest palindromic suffix**; append reverse of the rest
- Longest palindromic suffix of s = prefix function of `rev(s) + '#' + s`, last value
- n ≤ 10⁶: O(n). Trap: forgetting the separator

---

## H — Rest Stops

- Rest at checkpoints with costs; gaps between rests ≤ k; start/end free
- `dp[i] = c_i + min(dp[i−k..i−1])`, sliding-window minimum
- O(n) with a monotonic deque (a segment tree also passes, but is more code)
- Trap: the finish n+1 is a "free rest" that must also respect the gap

---

## J — Fence Lattice

- Fence = convex hull of trees; count lattice points **strictly inside**
- Hull (monotone chain), then Pick: `I = (2A − B + 2) / 2`, `B = Σ gcd`
- Collinear hull points do not change B (gcd counts them anyway)
- Trap: all trees collinear ⇒ answer 0 (no area); `long long` area

---

## I — Coprime Committees

- Count non-empty subsets with gcd 1, values ≤ 10⁶
- `F(d) = 2^{c_d} − 1`; exact: `G(d) = F(d) − Σ_{k≥2} G(kd)`, d from V down
- O(V log V) harmonic loops
- Trap: modular subtraction negativity; precompute powers of 2

---

## K — Forbidden Jingle

- Strings of length n ≤ 10¹⁸ over σ letters avoiding p (|p| ≤ 30)
- KMP automaton (Lecture 9) → transition matrix `T` (m × m)
- Answer = Σ_j (Tⁿ)[0][j]; O(m³ log n) ≈ 1.6·10⁶ operations
- Trap: rows for the pattern-complete state must be **absent**, not absorbing

---

## Expected scoreboard

| Solved | Typical team |
|---|---|
| 3 | A, E, B — fundamentals in place |
| 5–6 | + C, D or G, J — solid regional team |
| 8–9 | + F, H, I — medal contention |
| 10–11 | + K — regional winner |

---

## Debrief template (fill in as a team)

| | Read at | Label | Started | AC at | Tries | Time lost on | Root cause |
|---|---|---|---|---|---|---|---|
| A | | | | | | | |
| … | | | | | | | |

- Root cause ∈ {misread, wrong idea, implementation bug, overflow, TLE, format, idle machine}

---

## Debrief questions

1. Which problem did we solve **latest relative to the field**? Why?
2. How long was the machine idle or used for thinking?
3. Which WA could the 60-second checklist have prevented?
4. Which unsolved problem was closest? What was missing — idea or code?
5. What goes into the notebook / training plan this week?

---

## Upsolving rule

- Every problem: re-solve alone within one week
- Unsolved medium: write the solution, then **explain it** to a teammate
- Add a stress test for every WA you got
- Update the problem board template with what you learned

---

## Summary

- The mock exercises every lecture of this track under contest pressure
- Most points are in the medium band: C, D, F, G, H, J
- The debrief matters more than the score
- Next: National Championship Prep — training systems, advanced data structures, DP optimisations
