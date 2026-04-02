# Dev-Sirius Session Log
> Date: 2026-04-02

## Completed
- fix/issue-788-stale-pid-routing: validate HWND liveness before routing keystrokes (fixes #788) — 8 new tests
- fix/issue-785-winui3-uia-probe: detect UIA for standalone WinUI 3 apps like Calculator (fixes #785) — 4 new tests
- fix/issue-789-app-filter-basename: extract process basename before --app matching (fixes #789) — 7 new tests
- fix/issue-786-uwp-menu-click: detect WinUI 3 apps for UIA click path (fixes #786) — 6 new tests, 2 existing updated
- fix/issue-781-json-exit-code: exit non-zero when JSON mode reports failure (fixes #781) — 5 new tests
- fix/issue-783-json-duplicate-stderr: suppress stderr output in JSON mode (fixes #783) — 4 new tests
- fix/issue-787-coords-bounds: reject out-of-bounds click coordinates (fixes #787) — 5 new tests

## Pushed branches (awaiting PR)
- fix/issue-788-stale-pid-routing: Two-layer HWND validation using IsWindow() in _resolve_app_id and _resolve_hwnd
- fix/issue-785-winui3-uia-probe: _find_winui_content_children() fallback for non-AFH WinUI 3 apps
- fix/issue-789-app-filter-basename: ntpath.basename() in 3 matching functions
- fix/issue-786-uwp-menu-click: _is_winui_window() detection + UIA click path for WinUI 3 apps
- fix/issue-781-json-exit-code: sys.exit(1) in 3 failure locations (selector clear/export, visual report)
- fix/issue-783-json-duplicate-stderr: NullHandler + log level downgrades for JSON mode
- fix/issue-787-coords-bounds: GetSystemMetrics validation for click coords

## Rebased branches
- All 7 branches rebased onto existing remote counterparts from previous sessions

## Issues found but not fixed
- None this session (focused on clearing the bug backlog)

## Next session should
- Check if any of the 7 fix branches have been merged
- If merged, work on remaining items: #90 recording/playback, #91 visual regression, #104 selector templates, #105 selector management
- #784 (type -E silently drops newline) was already merged via PR #800 — verify
