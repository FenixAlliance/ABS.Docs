# CHANGELOG — Reconstruction Notes

Internal companion to `Changelog.md`. It explains how the post-`2.0.0` releases were reconstructed, so future maintainers can always tell **reconstructed** history from **contemporaneously recorded** history.

## Why reconstruction was needed

- The original `Changelog.md` (now also frozen in `Changelog.Archived.md`) was maintained contemporaneously through **`2.0.0` LTS (2022-08-11)**.
- The current code repository begins with a **squashed "Initial commit" on 2023-08-25** (at internal version `1.9.9.60`) — a migration / re-platforming reset. No commit history exists before it.
- Everything after `2.0.0` LTS was therefore reconstructed from git evidence.

## Evidence sources (Layer 1 — raw, not customer-facing)

- ~540 merged-PR titles (`git log --grep="Merged PR"`), dated.
- Commit messages (feat / fix / refactor / etc.) and per-month volume.
- Framework-upgrade commits (.NET 8 / 9 / 10) as hard date anchors.
- A named release commit — **PR 287, "Alliance Business Suite 2.0 Stable Release" (2024-06-13)**.
- *Not yet mined (available for deeper passes):* ADO work items, pipeline/release history, migration history.

## Version inference (Layer 2 — internal reconstruction)

There are **no product-line `2.x` tags** in git: GitVersion emitted build tags starting at `0.1.0` (2024-02-09), unrelated to the product version line. The published product versions are therefore **inferred** from theme + framework boundaries:

| Inferred | Date anchor | Basis | Confidence |
|---|---|---|---|
| `2.1.0` Stable | 2024-06-13 | named "2.0 Stable Release" PR; re-platform completion | **B** (named release + git) |
| `2.2.0` | 2024-12-21 | .NET 9 upgrade PR; REST/OData + HRMS/Logistics cluster | **C** (git clustering) |
| `2.3.0` | 2025-08-11 | DDD-refactor PR; identity / billing / MCP / email cluster | **C** |
| `2.4.0` | 2026-01-07 | .NET 10 LTS PR; assets / namespace cluster | **C** |
| `3.0.0` | Unreleased (2026 H1) | Suite UI Kit + RBAC + IMediatorService + ResultFactory — major platform shift | **D** (inferred major; not a cut release) |

## Confidence scale

- **A** — tagged release **and** contemporaneous changelog evidence (the ≤ `2.0.0` entries).
- **B** — tag / named release + git evidence.
- **C** — git clustering only (theme + date inference; no release tag).
- **D** — inferred (an inferred major bump, or an as-yet-uncut release).

## Key assumptions & caveats

- **The two "2.0"s are distinct.** `2.0.0` LTS (2022-08, original) was the V2 line; the git "2.0 Stable Release" (2024-06) is the **re-platformed** baseline. To avoid a SemVer collision it is recorded as `2.1.0` Stable, with the original name noted.
- Releases are **coarser** than the original (which had granular `1.x.y` entries) because exact `2.x` boundaries were never tagged — one inferred minor per major theme / framework period.
- Bullets are **curated** from PR titles, not transcribed — minor PRs are rolled into theme lines (per Keep a Changelog: a changelog is not a commit dump).
- The **2022-08 → 2023-08** window has **no evidence** and is left as an explicit gap.

## Deepening this reconstruction

- Per-period drill-down: `git log --grep="Merged PR" --format="%ad|%s" --date=short` filtered by date range.
- Cross-reference ADO work items / pipeline runs to firm up `C` → `B` confidence and pin real release dates.

---

See also: `Changelog.md` (Layer 3 — published) · `Changelog.Archived.md` (frozen original) · the Architecture Archaeology Register (Developer Handbook → `Strategy/Archaeology`).
