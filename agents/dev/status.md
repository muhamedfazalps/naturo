# Dev Status
Last updated: 2026-03-28T20:15:00Z
Session: Fixed 2 P1 bugs in v0.3.2 — UWP Calculator matching + E2E Notepad timing

## This Session
- **Fixed #559 (P1)**: `_resolve_hwnds()` AFH fixup now searches all windows, not just scored matches
  - PR #561 created — fixes UWP Calculator `--app` matching regression
  - 2 new regression tests (AFH full-window search + content window preference)
- **Fixed #560 (P1)**: E2E Notepad tests use polling loop instead of flat sleep
  - PR #562 created — 10s polling with 0.5s interval replaces 1.5s flat sleep
  - Applied to all 3 failing tests across test_app_control.py and test_cli_phase2.py
- Tests: 2138 passed, 539 skipped, 0 failures (Linux)
- Linter: clean

## Current State
- Earliest open milestone: v0.3.2 (2 P1 bugs fixed, PRs awaiting merge)
- CI: PR #561 — CI Gate passed, CodeQL in progress; PR #562 — running
- Open PRs by me: #561 (UWP Calculator fix), #562 (E2E polling fix)
- Auto-merge: could not enable yet (checks still running), retry next session

## Next Session Should
1. **Check PR #561 and #562 CI status** — enable auto-merge if green, fix if red
2. **Backlog triage**: backends/windows.py splitting (#411) is the biggest tech debt (4064 lines)
3. **Consider v0.4.0 milestone**: Unified Selector engine items need a milestone
4. **README badges**: add CI status, PyPI version, license badges for professional appearance
5. **Input strategy refactor (#412)**: evaluate complexity for pluggable input pattern
