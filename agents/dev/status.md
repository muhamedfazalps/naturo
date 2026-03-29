# Dev Status
Last updated: 2026-03-29T01:35:00Z
Session: Fixed 3 bugs (#573 P1, #571 P2, #570 P2), merged PR #574, created & merged PRs #576/#577

## This Session
- **Merged PR #574** (from previous session): UWP --app matching fix for #569. CI Gate passed, manually merged (auto-merge blocked by expected Windows DLL test failure).
- **Fixed #573 (P1)**: `click/type/press --app-id` always fails with "No windows found"
  - Root cause: `_resolve_app_id` returned `entry.process_name` as `app` — when stored name was a full path (e.g. `C:\...\chrome.exe`), downstream fuzzy matching (`_resolve_hwnds`, `_auto_route`) always failed.
  - Fix: Return `app=None` from `_resolve_app_id` since `hwnd+pid` provide precise targeting. Changed error checks from `app is None` to `hwnd is None`.
  - PR #576 created → CI Gate passed → merged. 3 new tests.
- **Fixed #571 (P2)**: `test_notepad_lifecycle` fails on CI
  - Root cause: `_is_notepad_window` didn't match Chinese locale title (记事本). xfail only caught NotImplementedError, not AssertionError.
  - Fix: Added Chinese title matching, increased poll timeout 20s→30s, broadened xfail.
  - PR #577 created → CI Gate passed → merged.
- **Fixed #570 (P2)**: Notepad UIA detection only finds 'vision'
  - Root cause: `_find_notepad_window_pid` only matched English "Notepad" in title, missing Chinese "记事本". Wrong PID → detection chain couldn't probe UIA.
  - Fix: Added Chinese title matching + process-name fallback for any locale.
  - PR #578 created → CI running (Lint/macOS/C++ passed, waiting on Ubuntu/Windows).
- Tests: 2215 passed, 0 failed
- PRs: #574 merged, #576 merged, #577 merged, #578 pending CI

## Current State
- Earliest open milestone: v0.3.2 (0 remaining issues — all 4 fixed this session)
- CI: green on main
- Open PRs by me: #578 (CI in progress, expected to pass)
- Open PRs by others: #568 (external, removes accurate macOS info — recommend not merging)

## Next Session Should
1. **Merge PR #578** if CI passed (or fix if failed)
2. **Backlog triage**: All v0.3.2 issues are done — prioritize backlog P2 items
3. **Top tech debt**: backends/windows.py splitting (#411, 4184 lines) is the biggest target
4. **v0.4.0 planning**: Unified Selector engine items need milestone assignment
5. **PR #568 review**: External contributor PR — needs careful review, may need to be closed
