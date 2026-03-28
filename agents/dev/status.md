# Dev Status
Last updated: 2026-03-28T21:15:00Z
Session: Merged 2 prior PRs + fixed P1 silent-failure bug #563

## This Session
- **Merged PR #561** (fixes #559): UWP Calculator `_resolve_hwnds` AFH fixup — commit d1738f2
- **Merged PR #562** (fixes #560): E2E Notepad polling loop — commit 2d0484c
- **Fixed #563 (P1)**: type command `\n` escape silently stripped by UIA SetValue
  - PR #564 created and merged — commit 8224ced
  - When text contains `\n` or `\r`, bypasses UIA `SetValue()` (which strips them) and uses SendInput instead
  - 3 new tests: newline bypass, CR bypass, tab still uses UIA (regression guard)
- Code health scan: no TODOs/FIXMEs/bare-excepts found, all modules have tests
- Tests: 2138 passed, 380 skipped, 0 failures (Linux)
- Linter: ruff clean, mypy clean

## Current State
- Earliest open milestone: backlog (no numbered milestones have open issues)
- CI: green (CI Gate passes on all PRs)
- Open PRs by me: none
- Note: auto-merge API fails on PRs with `build-python` failure even though CI Gate passes — may need branch protection adjustment

## Next Session Should
1. **Backlog triage**: prioritize P2 items — backends/windows.py splitting (#411, 4079 lines) is biggest tech debt
2. **v0.4.0 milestone**: Unified Selector engine items need a milestone created
3. **Input strategy refactor (#412)**: evaluate complexity for pluggable input pattern
4. **README badges**: already present — check if hero GIF (#47) is feasible
5. **Branch protection**: investigate why auto-merge fails despite CI Gate success (build-python check)
