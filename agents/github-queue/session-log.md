# Dev-Sirius Session Log
> Date: 2026-04-05

## Completed
- fix/issue-843-capture-popup-menus: capture --app now composites popup menu windows from same process into a single screenshot (fixes #843)
- fix/issue-844-mcp-pydantic-leak: MCP tool validation errors return INVALID_INPUT with clean messages instead of leaking Pydantic internals (fixes #844)
- fix/issue-810-mcp-stdout-debug: rebased onto prior remote branch; added tests for stdio logging suppression (fixes #810)
- fix/issue-840-type-newline-drop: rebased onto prior remote branch; added 8 tests for newline handling in type_text (fixes #840)

## Pushed branches (awaiting PR)
- fix/issue-843-capture-popup-menus: new branch, PR request queued
- fix/issue-844-mcp-pydantic-leak: new branch, PR request queued
- fix/issue-810-mcp-stdout-debug: rebased onto prior remote, force-pushed, PR request queued
- fix/issue-840-type-newline-drop: rebased onto prior remote, force-pushed, PR request queued

## Rebased branches
- fix/issue-810-mcp-stdout-debug: rebased onto prior remote's version (had _suppress_stdout_logging helper), resolved conflicts
- fix/issue-840-type-newline-drop: rebased onto prior remote's version (had re.split approach), resolved conflicts

## Issues found but not fixed
- test_visual.py::TestEnterpriseCLI::test_report_errors_exit_nonzero — pre-existing NameError failure, not caused by my changes
- #807, #834, #841 branches from prior sessions no longer exist on remote — need Orc-Mycelium to re-create PRs or Dev-Sirius to re-implement fixes in next session

## Next session should
- Fix #807 (press --app sends hotkey to wrong process) — P1, needs fresh implementation
- Fix #834 (browser subcommand ignores -j flag) — P1, needs fresh implementation
- Fix #841 (Calculator UIA test fails) — P1, needs fresh implementation
- Fix #777 (capture_screen fails with Unicode file path) — P1 backlog
- Investigate PR #838 CI failure (test/recording-cmd-coverage)
