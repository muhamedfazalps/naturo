# Dev Status
Last updated: 2026-03-28T23:25:00Z
Session: Merged P0 fix #565, fixed flaky CI test #567, reviewed external PR #568

## This Session
- **Merged PR #566 (P0 fix for #565)**: `click --app nonexistent` silent success re-regression
  - Updated branch to latest main, CI Gate passed, merged via squash
  - Commit: c126e268
- **Fixed #567 (P2)**: Flaky CI test `test_window_minimize_restore_cycle` Notepad polling race
  - Root cause: redundant `skipif(CI or GITHUB_ACTIONS)` on `TestAppLifecycleE2EWindows` blocked tests on self-hosted desktop runner (GitHub Actions sets CI=true even on self-hosted). The `@pytest.mark.desktop` marker is the correct and sufficient guard.
  - Also increased `_poll_for_notepad` timeout from 10s to 20s for slow UWP Notepad launches
  - PR #572 created and merged. Commit: 015b4e7a
- **Reviewed PR #568** (external from @Adraca): Issue #420 already closed, PR removes accurate macOS/Peekaboo info. Left feedback recommending closure.
- **Code health scan**: no TODOs/FIXMEs/bare-excepts. 102 typed `except ... pass` patterns (intentional cleanup/fallback code). 30 modules lack dedicated test files (mostly CLI/platform-specific).
- PRs: #566 merged, #572 created + merged, #568 reviewed

## Current State
- Earliest open milestone: v0.3.2 (0 issues remaining after #567 fix)
- CI: green (CI Gate passes; Windows DLL job fails as expected with continue-on-error)
- Open PRs by me: none
- Open PRs by others: #568 (external, recommended closure)

## Next Session Should
1. **Check if PR #568 was closed** by Adraca or needs further action
2. **Backlog triage**: prioritize P2 items — backends/windows.py splitting (#411, 4079 lines) is biggest tech debt
3. **v0.4.0 milestone**: Unified Selector engine items need a milestone created
4. **Test coverage gaps**: 30 modules lack dedicated tests (cli/*, detect/*, providers/*)
5. **README badges**: small visible improvement for open-source presence
