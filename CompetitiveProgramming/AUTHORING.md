# Authoring Guide

Every lecture lives in its own folder and contains exactly two files:

| File | Purpose |
|------|---------|
| `slides.md` | The slide deck, written in [Marp](https://marp.app) Markdown. Renders as slides in VS Code (Marp extension) or via `npx @marp-team/marp-cli slides.md --pdf`. Also readable as plain Markdown on GitHub. |
| `notes.md`  | Instructor/student lecture notes: the full explanation behind the slides, worked examples, complete reference code, common bugs, and a practice problem list. |

## Slide format

```markdown
---
marp: true
theme: default
paginate: true
header: "Competitive Programming · <Track> · <Lecture N>"
footer: "codingLectures"
---

<!-- _class: lead -->
# Lecture Title
### Subtitle / one-line hook

---

## Learning goals
- ...

---
```

* Slides are separated by `---` on its own line.
* 18–30 slides per deck. One idea per slide; keep ≤ ~10 lines of text or ≤ ~25 lines of code per slide.
* Order: title → goals → motivation/example problem → core ideas (with diagrams in ASCII or tables where useful) → code → complexity → pitfalls → practice problems → summary.
* Speaker notes may be added with `<!-- ... -->` HTML comments under a slide.

## Notes format

```markdown
# Lecture N — Title

> Track · Prerequisites · Estimated time

## 1. Overview
## 2. ... (core sections)
## k. Reference implementation(s)
## k+1. Common mistakes
## k+2. Practice problems
## k+3. Further reading
```

* Notes are the long-form companion (roughly 1,500–4,000 words), written so a student who missed class can learn from them alone.
* All code is **C++17**, uses `#include <bits/stdc++.h>`, and full programs compile with `g++ -std=c++17 -O2 -Wall`.
* Practice problems reference real, public problems (Codeforces, AtCoder, CSES, Kattis, ICPC archives, USACO) by name and ID/link.
