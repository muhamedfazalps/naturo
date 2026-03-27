# Dev Status
Last updated: 2026-03-27T23:20:00Z
Session: Fix CI timeout (merged), rebase all PRs, #413 comparison table, #422 .work cleanup

## This Session
- **CI timeout fix (critical):** PR #477 — increased Windows timeout from 20→45min + added pip caching. CI passed in ~2.5min (down from >35min timeout). Merged to main (d456189).
- **Rebased all 6 blocked PRs** (#466, #473, #475, #476, #479, #480) onto new main with CI fix. All have CI running with Windows tests in progress.
- **Issue #413 (P1 docs):** PR #481 created. Added comparison table vs PyAutoGUI/pywinauto/AutoIt/WinAppDriver to README. Kept Peekaboo subsection.
- **Issue #422 (P2 chore):** PR #482 created. Removed 42 stale files from .work/ (screenshots, old QA reports, debug logs). Added .gitignore patterns.
- Tests: 1836 passed, 363 skipped, 0 failed

## Open PRs by Me
- #466 — fix: stable hash-based element refs (fixes #456) — CI running
- #473 — fix: localized --app alias cleanup (fixes #469) — CI running
- #475 — fix: --pid flag passthrough (fixes #471) — CI running
- #476 — fix: flaky test_window_lifecycle (fixes #472) — CI running
- #479 — fix: find_process alias resolution (fixes #474) — CI running
- #480 — fix: error message format (fixes #478) — CI running
- #481 — docs: comparison table (fixes #413) — CI running
- #482 — chore: clean .work/ (fixes #422) — CI running

## Current State
- Earliest open milestone: v0.3.4
- CI: GREEN on main (PR #477 merged). All PRs rebased with fix, Windows tests running.
- All 6 bug issues have PRs, awaiting CI green + merge
- 2 new PRs (#481 docs, #482 chore) also awaiting CI

## Next Session Should
- Check if all PRs passed CI — merge them (squash) or enable auto-merge
- If merge conflicts arise from multiple merges, rebase sequentially
- After PRs clear, look at remaining P1 issues: #361 (stable app/window ID), #312 (Win32+UIA hybrid)
- Run code health scan for test coverage gaps
