# Dev Status
Last updated: 2026-03-27T18:35:00Z
Session: v0.3.1 bug fixes — stable element refs, flaky test, app filter contamination

## This Session
- PR #461 (fixes #455) — UIA probe UWP fallback: **merged** (CI green)
- PR #462 (fixes #449) — foreground window tie-breaking: **merged** (CI green)
- Issue #456 (P1) — Element IDs shift between snapshots: PR #466 created (hash-based stable eN refs)
- Issue #446 (P1) — Flaky test_window_lifecycle: PR #467 created and **merged** (track by PID, not global count)
- Issue #465 (P2) — --app filter matches wrong process: PR #468 created (reject title-only matches)
- Tests: 1887 passed, 489 skipped, 0 failed
- PRs merged: #461, #462, #467 | PRs pending CI: #466, #468

## Open PRs by Me
- #466 — fix: stable hash-based element refs (fixes #456) — Windows CI running, all other checks green
- #468 — fix: --app rejects title-only matches (fixes #465) — CI running

## Current State
- Earliest open milestone: v0.3.1 (1 remaining issue: #448 — click 13x slower than pywinauto)
- CI: green on main
- Issues fixed this session: #455, #449, #456, #446, #465

## Next Session Should
- Merge PRs #466 and #468 once CI is green
- Investigate #448 (click performance — 13x slower than pywinauto) — this is the last v0.3.1 issue
- If #448 is too large, triage and create sub-issues for incremental improvements
- Address any review feedback on open PRs
