# Dev-Sirius Session Log
> Date: 2026-04-02

## Completed
- fix/issue-776-app-subcommands: resolve app IDs (a1, a2, ...) in all 15 app subcommands — launch, quit, relaunch, find, inspect, hide, unhide, switch, focus, close, minimize, maximize, restore, move, windows (fixes #776). Added `_resolve_app_id()` helper with consistent error messages in text and JSON modes. 15 new tests, 113 total app_cmd tests pass, ruff clean, mypy clean.
- fix/issue-785-uwp-launch-pid: resolve real app PID after cmd /c start launch (fixes #785). Waits for cmd.exe to exit then polls find_process for actual app process. Falls back to cmd.exe PID if not found within 3s. 5 new tests, ruff clean, mypy clean.
- feat/issue-723-cost-guardrails: cost guardrails config for scheduled agents (fixes #723). Daily run limit, consecutive failure auto-pause, global pause_all switch. 11 config validation tests.

## Pushed branches (awaiting PR)
- fix/issue-776-app-subcommands: app ID resolution in all app subcommands (force-pushed)
- fix/issue-785-uwp-launch-pid: real PID resolution after cmd /c start (force-pushed)
- feat/issue-723-cost-guardrails: cost guardrails config (force-pushed)

## Rebased branches
- None (stale remote branches were replaced via force-push)

## Issues found but not fixed
- #784 (type newline drop) — C++ fix in core/src/input.cpp, cannot build or verify on Linux CI
- Many pending PR branches from previous sessions still need Orc-Mycelium to create PRs
- Browser features #763 (client script validation) and #766 (migration guide) depend on all browser features being merged first

## Next session should
- Monitor PR merges for the 3 branches pushed this session
- Re-implement #721 (example scripts) if branch still missing
- Re-implement #722 (MCP docs) if branch still missing
- Re-implement #719 (CLI reorganization) if branch still missing
- #784 requires Windows build environment — note for desktop CI or Ace
