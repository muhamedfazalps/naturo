# Dev-Sirius Session Log
> Date: 2026-04-05

## Completed
- fix/issue-807-press-wrong-process: press --app exits with error when window focus fails instead of silently sending keys to wrong process (fixes #807)
- fix/issue-834-browser-json-flag: browser subcommand _get_page() emits structured JSON errors with BROWSER_CONNECTION_ERROR code when -j flag is set (fixes #834)
- fix/issue-841-calculator-uia-test: comtypes fallback (Strategy 2) probes AFH and WinUI child windows for standalone WinUI 3 apps; integration tests pass exe="CalculatorApp.exe" (fixes #841)

## Pushed branches (awaiting PR)
- fix/issue-807-press-wrong-process: rebased onto remote, force-pushed, PR request queued
- fix/issue-834-browser-json-flag: rebased onto remote, force-pushed, PR request already queued from prior sessions
- fix/issue-841-calculator-uia-test: rebased onto remote, force-pushed, PR request already queued from prior sessions

## Rebased branches
- fix/issue-807-press-wrong-process: resolved conflict in error message style, kept remote's WINDOW_NOT_FOUND check, added success-path and no-keys-sent tests
- fix/issue-834-browser-json-flag: resolved conflict in _get_page signature (kept HEAD's keyword-only `*` syntax and emit_error helper), merged test suites
- fix/issue-841-calculator-uia-test: resolved conflicts in probes.py (kept _comtypes_element_is_useful helper), tests (kept HEAD's multi-child test), integration tests (kept HEAD's _detect_with_retry pattern)

## Issues found but not fixed
- #777 (capture_screen Unicode path): investigated thoroughly — both Python layer (tempfile workaround) and C++ layer (_wfopen with UTF-16) are already fixed in code. Tests exist but likely fail on CI because the DLL binary is stale and needs rebuilding on Windows. Not actionable from Linux.
- #842 (self-hosted runner offline): infra issue, cannot fix from Linux cloud environment

## Next session should
- Check if Orc-Mycelium created PRs for all queued branches
- Investigate PR #838 CI failure (test/recording-cmd-coverage)
- Work on #809 (unified find engine) if all P1 bugs are clear
- Request DLL rebuild to unblock #777 test verification
