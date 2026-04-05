# Dev-Sirius Session Log
> Date: 2026-04-05

## Completed
- fix/issue-834-browser-json-flag: browser _get_page() emits JSON errors when -j flag is set (fixes #834)
- fix/issue-841-calculator-uia-test: comtypes fallback probes AFH/WinUI child windows + test uses exe= and retry (fixes #841)
- fix/issue-807-press-wrong-process: press --app exits with WINDOW_FOCUS_ERROR when focus fails (fixes #807)
- fix/issue-840-type-newline-drop: type_text splits on newlines and presses Enter between segments (fixes #840)

## Pushed branches (awaiting PR)
- fix/issue-834-browser-json-flag: _get_page() accepts json_output kwarg, all 30 call sites pass it through, 2 new tests
- fix/issue-841-calculator-uia-test: comtypes Strategy 2 mirrors Strategy 1 child window search, integration tests use _detect_with_retry + exe=
- fix/issue-807-press-wrong-process: replaces silent debug log with _json_err WINDOW_FOCUS_ERROR + return, 2 new tests
- fix/issue-840-type-newline-drop: re.split on \r\n|\r|\n + press_key("enter") between segments, 3 new tests

## Rebased branches
- All 4 branches force-pushed over stale previous session branches (based on latest develop)

## Issues found but not fixed
- #842 (P0): Self-hosted runner ROBOT-COMPILE offline — cannot fix from Linux cloud environment
- #809 (P1): Unified find engine — large feature, needs dedicated session
- #810 (P1): MCP stdout debug suppression — needs verification if already fixed in develop

## Next session should
- Check if Orc-Mycelium created PRs for the 4 branches above
- Verify CI passes on all branches
- Start work on #809 (unified find engine) if milestone bugs are clear
- Address #832/#833 (refactor app_cmd.py and _shell.py) if time permits
