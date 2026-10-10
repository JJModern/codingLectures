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
### Process, scoreboard, upsolving

---

## Intended difficulty

| | Difficulty |
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

---

## Solutions

> **Solutions are not published here.** The coach holds the solutions and releases them only after the contest has been run.

- Problem-by-problem solutions are presented by the coach after the contest
- Before that: every team fills in its timeline (debrief template)

---

## Running the judge and the log

- Any local judge: DOMjudge, a Codeforces Gym mashup, or the coach checking outputs by script
- Each team keeps the problem board from Lecture 1
- The board records when each problem was read, labelled, started and accepted
- The board is the main input to the debrief

---

## Generic traps worth a second look

- Overflow: beyond 2·10⁹ → `long long`; beyond 10¹⁸ → `__int128`
- Special outputs ("never", unreachable, stays forever) are part of the problem
- "At most" vs "exactly": reread every quantifier
- Modular subtraction without `+ MOD`
- Team level: nobody reading the last problems until the final hour

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
