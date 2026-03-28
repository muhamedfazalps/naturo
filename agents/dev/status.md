# Dev Status
Last updated: 2026-03-28T14:35:00Z
Session: Merge PRs, implement unified selector output in see command, add --selector to scroll/move

## This Session
- **PR #537 merged**: Fix click --app ignoring nonexistent app filter (fixes #533 P0)
- **PR #538 merged**: Fix UWP Notepad test fixtures (fixes #534 P1)
- **PR #539 created & merged**: see command outputs unified selectors alongside eN IDs (fixes #102)
  - JSON mode: always includes `selector` field with URI selector on each element
  - Text mode: new `--selectors` flag shows selector URIs alongside eN refs
  - 11 new tests in `test_see_selectors.py`
- **PR #540 created**: Add --selector to scroll and move commands
  - Matches existing --selector on click, type, press
  - 7 new tests in `test_selector_cli.py`
  - CI in progress, awaiting merge
- **Issue #541 created**: feat: add --from-selector/--to-selector to drag command
- Tests: 2140 passed, 499 skipped, 0 failures
- PRs: #537 merged, #538 merged, #539 merged, #540 awaiting CI

## Current State
- Earliest open milestone: none (all milestones clear)
- CI: green on main
- Open PRs by me: #540 (selector for scroll/move — CI running)
- All open issues are backlog P2 tasks/enhancements

## Next Session Should
1. **Check PR #540 CI** — merge if CI passes
2. **ROADMAP v0.4.0 selectors**: Add --selector to get, set, and drag commands (#541)
3. **Code health**: backends/windows.py at 4064 lines — splitting is overdue (#411)
4. **Test coverage**: Run coverage report, find untested code paths
5. **Self-driven**: First-user experience audit, JSON output format consistency
