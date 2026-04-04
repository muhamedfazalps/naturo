# Dev-Sirius Session Log
> Date: 2026-04-04

## Completed
- fix/issue-810-mcp-stdout-debug: suppress all logging in MCP stdio transport (fixes #810)
- fix/issue-840-type-newline-drop: handle newlines in type_text by splitting into Enter keypresses (fixes #840)
- fix/issue-807-press-wrong-process: press --app exits with error when window focus fails (fixes #807)
- fix/issue-786-uwp-menu-click: fixed CI-failing tests by mocking _is_winui_window (PR #815)

## Pushed branches (awaiting PR)
- fix/issue-810-mcp-stdout-debug: MCP stdio logging suppression, 2 new tests
- fix/issue-840-type-newline-drop: type command newline handling, 3 new tests
- fix/issue-807-press-wrong-process: press command focus-or-fail, 4 new tests

## Rebased branches
- fix/issue-788-stale-pid-routing: rebased onto develop, pushed (PR #820)
- fix/issue-781-json-exit-code: rebased onto develop, resolved merge conflict in test_visual.py, pushed (PR #818)
- fix/issue-783-json-duplicate-stderr: rebased onto develop, pushed (PR #819)
- test/visual-cmd-coverage: rebased onto develop, resolved merge conflict in test_visual.py, pushed (PR #839)

## Issues found but not fixed
- #834 browser subcommand ignores -j flag — not started this session
- #841 test_detect_calculator_has_uia fails — requires desktop runner investigation

## Next session should
- Check if rebased PRs (#818, #819, #820, #839) have been merged
- Fix #834 (browser -j flag) and #841 (calculator detection test)
- Work on remaining P1 items: #809 (unified find engine)
