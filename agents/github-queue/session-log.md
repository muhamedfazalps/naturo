# Dev-Sirius Session Log
> Date: 2026-04-04

## Completed
- fix/issue-781-json-exit-code: exit non-zero when JSON reports failure (fixes #781) — 7 new tests
- fix/issue-789-app-filter-basename: extract process basename before --app matching (fixes #789) — 5 new tests
- fix/issue-787-coords-bounds: reject out-of-bounds click coordinates (fixes #787) — 7 new tests
- fix/issue-783-json-stderr-suppress: suppress stderr in JSON mode (fixes #783) — 1 new test
- fix/issue-788-stale-pid-routing: detect stale PID, fall back to process name (fixes #788) — 3 new tests
- fix/issue-786-uwp-menu-click: detect WinUI 3 for UIA click path (fixes #786) — 4 tests
- fix/issue-785-winui3-uia-probe: UIA probe for standalone WinUI 3 apps (fixes #785) — 3 new tests

## Pushed branches (awaiting PR)
- fix/issue-781-json-exit-code
- fix/issue-789-app-filter-basename
- fix/issue-787-coords-bounds
- fix/issue-783-json-stderr-suppress
- fix/issue-788-stale-pid-routing
- fix/issue-786-uwp-menu-click
- fix/issue-785-winui3-uia-probe

## Rebased branches
- None needed — all previous branches had been deleted from remote

## Issues found but not fixed
- Previous bug-fix branches keep getting deleted from remote without merging — recurring process issue across multiple sessions
- #763 (client script validation) still blocked — no rpa-client scripts in repo
- #766 (migration guide acceptance tests) still blocked — depends on browser PRs being merged
- app_cmd.py (1,416 lines) and _shell.py (1,216 lines) still need split issues
- feat/issue-105-selector-management from last session was also deleted — needs re-push if branch still exists locally (it doesn't)

## Next session should
- Verify Orc-Mycelium created PRs for the 7 bug-fix branches
- Re-implement #105 (selector management) — it was completed last session but branch was deleted
- If process issue persists (branches deleted without merge), escalate to Ace
- Work on #763/#766 if dependencies resolve
