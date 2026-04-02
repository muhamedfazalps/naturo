# Dev-Sirius Session Log
> Date: 2026-04-02

## Completed
- fix/issue-788-stale-pid-routing: validate HWND liveness before routing keystrokes (fixes #788) — 4 new tests
- fix/issue-789-app-filter-basename: extract process basename before --app matching (fixes #789) — 7 new tests
- fix/issue-781-json-exit-code: exit non-zero when JSON mode reports failure (fixes #781) — 3 new tests
- fix/issue-783-json-duplicate-stderr: suppress stderr output in JSON mode (fixes #783) — 2 new tests
- fix/issue-787-coords-bounds: reject out-of-bounds click coordinates (fixes #787) — 4 new tests
- fix/issue-786-uwp-menu-click: detect WinUI 3 apps for UIA click path (fixes #786) — 5 new tests

## Pushed branches (awaiting PR)
- fix/issue-788-stale-pid-routing: Two-layer HWND validation using IsWindow()
- fix/issue-789-app-filter-basename: ntpath.basename() in 3 matching functions
- fix/issue-781-json-exit-code: return → sys.exit(1) in 3 locations
- fix/issue-783-json-duplicate-stderr: NullHandler + log level downgrades
- fix/issue-787-coords-bounds: GetSystemMetrics validation for click coords
- fix/issue-786-uwp-menu-click: _is_winui_window() detection + click path

## Rebased branches
- All 6 branches rebased onto remote counterparts from previous sessions

## Issues found but not fixed
- Many previous feature branches (pending PRs) were deleted from remote without being merged into develop
- P1 features #90 (recording), #104 (selector templates) need re-implementation if branches are truly lost
- #785 winui3-uia-probe branch still pending from previous sessions

## Next session should
- Check if any of the 6 fix branches have been merged
- If merged, work on remaining items: #90 recording, #104 selector templates, #785 winui3-uia-probe
- Investigate why previous feature branches were deleted without merging
