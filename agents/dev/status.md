# Dev Status
Last updated: 2026-03-29T00:30:00Z
Session: Fixed P1 bug #569 (UWP --app matching), reviewed issues #570/#571 (already resolved)

## This Session
- **Fixed #569 (P1)**: `see/click --app calculator` fails for UWP apps hosted by ApplicationFrameHost.exe
  - Root cause: `_resolve_hwnd`/`_resolve_hwnds` only match process names; UWP windows are owned by `ApplicationFrameHost.exe`, not by the actual app (e.g. `CalculatorApp.exe`). The existing UWP fixup only runs after a match is found, so it can't help when no initial match exists.
  - Fix: Added `_uwp_afh_fallback` helper that probes AFH windows' content children via `_resolve_uwp_child_pid` to discover the real app process name and match against search term + aliases.
  - PR #574 created. CI Gate passed, waiting on Analyze (c-cpp) job to finish for auto-merge.
  - 12 new unit tests, all 2155 existing tests pass.
- **#570 and #571**: Both already resolved per QA-Mariana (CI green on commit ebc2b23). Both have `verified` label.
- **Reviewed PR #568** (external from @Adraca): Repeated prior feedback — issue #420 already closed, PR removes accurate macOS info.
- **Code health scan**: No TODOs/FIXMEs/bare-excepts. All modules have test coverage.
- PRs: #574 created

## Current State
- Earliest open milestone: v0.3.2 (3 issues: #569 in PR, #570/#571 verified awaiting close)
- CI: green (CI Gate passes on PR #574)
- Open PRs by me: #574 (CI passing, auto-merge pending)
- Open PRs by others: #568 (external, recommended closure)

## Next Session Should
1. **Enable auto-merge on PR #574** if CI fully passed (or merge manually)
2. **Close #570 and #571** if Ace confirms — both have `verified` label and QA confirmation
3. **Check PR #568** status — was it closed by Adraca or needs further action?
4. **Backlog triage**: prioritize P2 items — backends/windows.py splitting (#411, 4184 lines) is biggest tech debt
5. **v0.4.0 milestone**: Unified Selector engine items need a milestone created
