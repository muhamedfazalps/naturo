# Dev Status
Last updated: 2026-03-27T17:30:00Z
Session: P1 bug fixes — UIA probe UWP fallback + foreground window tie-breaking

## This Session
- Issue #455 (P1) — UIA probe fails on UWP apps: PR #461 created (adds AFH child window fallback)
- Issue #449 (P1) — --app flag non-deterministic: PR #462 created (foreground window tie-breaker)
- PR #461 lint fix pushed (removed unused wintypes import)
- Tests: 64 passed (test_detect + test_resolve_hwnd_session), 3 skipped, 0 failed
- PRs: #461 created (UIA probe), #462 created (foreground preference)

## Open PRs by Me
- #461 — fix: UIA probe fails on UWP apps — add AFH child window fallback (fixes #455) — CI running
- #462 — fix: --app flag non-deterministic when multiple windows match (fixes #449) — CI running

## Current State
- Earliest open milestone: backlog (no milestones assigned)
- CI: green on main
- Open P1 bugs: #456 (eN stability), #446 (flaky test_window_lifecycle)
- Open P1 enhancements: #413 (README comparison table), #361 (stable app/window ID), #312 (hybrid mode)

## Next Session Should
- Check CI on PRs #461 and #462 — enable auto-merge if green
- Fix #456 (element ID stability) — implement hash-based stable eN IDs
- Fix #446 (flaky test_window_lifecycle) — add IsWindow() validation in C++ core, or improve test cleanup
- Address any review feedback on #461 or #462
