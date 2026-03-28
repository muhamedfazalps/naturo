# Dev Status
Last updated: 2026-03-28T06:25:00Z
Session: Merge backlog + implement #361 stable app IDs

## This Session
- **Merged 6 PRs** that were stuck:
  - #492 — feat: `--selector` flag on click/type/press (fixes #103) — merged
  - #493 — feat: Win32+UIA hybrid enumeration (fixes #312) — merged
  - #494 — feat: highlight simultaneous display + annotate mode (fixes #313) — rebased, CI fixed, merged
  - #500 — fix: test_quit_app mock side_effect (Orc) — merged
  - #489 — fix: dev-prompt CI diagnosis protocol (Orc) — merged
  - #498 — fix: dev-prompt lint before PR (Orc) — updated branch, CI fixed, merged
  - #499 — fix: conftest monkeypatch skip (Orc) — updated branch, CI fixed, merged
- **Issue #361 (v0.3.2, P1):** PR #501 created. Implemented stable app/window ID system:
  - `naturo/app_ids.py` — AppIdMap class (session-scoped, TTL-aware, atomic persistence)
  - `naturo app list` now shows ID column (a1, a2, ...)
  - `--app-id` flag added to click, type, press, see, capture
  - 16 new tests, full suite: 2008 passed, 490 skipped
- Tests: 2008 passed, 0 failed (local Ubuntu)
- PRs: #501 created, CI running (lint may need branch update)

## Open PRs (mine)
- #501 — feat: stable app/window ID system (fixes #361) — CI running, branch updated

## Current State
- Earliest open milestone: v0.3.2 (6 issues remaining: #361 PR'd, #412, #168, #102, #105, #104)
- CI: GREEN on main
- Open PRs: #501 (mine)

## Next Session Should
1. **Check PR #501 CI** — if lint fails, investigate and fix; merge if green
2. **Pick next v0.3.2 issue** — #102 (see outputs selectors) or #412 (input strategy refactor) by priority
3. **Add --app-id to remaining commands** (scroll, drag, move, find, highlight) — follow-up to #361
4. **Close done issues** — #312, #313, #103 should be closeable now (PRs merged)
