# Dev Status
Last updated: 2026-03-29T03:30:00Z
Session: Fixed #582 (--app-id gaps in set/get commands), code health audit

## This Session
- **Fixed #582 (P1 bug)**: `set` command missing `--app-id` support; `get` command leaked full-path process_name from `--app-id`
  - Root cause: `set` was never given `--app-id` when other action commands got it. `get` copied `entry.process_name` as `app` (same #576 bug pattern).
  - Fix: Added `--app-id` to `set`, fixed `get` to use hwnd only. 5 new tests + 1 updated test.
  - PR #583 created → CI running (Lint & Type Check passed, others in progress).
- **Created #584**: Broader `--app-id` gap — `window_cmd`, `dialog_cmd`, `desktop_cmd` also missing it.
- **Code health audit**: No TODOs/FIXMEs, no bare excepts, ruff clean, mypy clean.
- **Test coverage**: 2195 passed, 506 skipped. Large untested modules: `cli/interaction.py` (2334 lines), `cli/core.py` (1900 lines), `detect/probes.py` (877 lines).
- **CLI consistency**: All 22 commands have consistent `--help` output.
- Tests: 2195 passed, 506 skipped
- PRs: #583 created (CI in progress)

## Current State
- Earliest open milestone: all milestones clear (issues in backlog only)
- CI: green on main, #583 CI running
- Open PRs by me: #583 (CI in progress)
- Open PRs by others: #568 (external, recommend not merging — 3 reviews already explaining why)

## Next Session Should
1. **Check PR #583 CI** — enable auto-merge if green, fix if red
2. **Fix #584** — add `--app-id` to `window_cmd`, `dialog_cmd`, `desktop_cmd`
3. **Test coverage**: Write tests for `cli/interaction.py` helpers (testable without desktop)
4. **Top tech debt**: `backends/windows.py` splitting (#411, 4184 lines)
5. **Self-driven mode**: MCP server lacks `app_id` support entirely — investigate gap
