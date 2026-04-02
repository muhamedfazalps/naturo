# Dev-Sirius Session Log
> Date: 2026-04-02

## Completed
- fix/issue-788-stale-pid-app-id: Validate cached PID liveness via find_process(pid=) in both _resolve_app_id callers, fail with APP_ID_STALE error (fixes #788)
- fix/issue-789-app-filter-basename: Extract ntpath.basename() in _resolve_hwnd/_resolve_hwnds/_is_afh_window to prevent full-path directory matching (fixes #789)
- fix/issue-781-json-exit-code: Change return→sys.exit(1) in selector clear/export and visual report when success:false (fixes #781)
- fix/issue-783-json-duplicate-stderr: Add NullHandler to root logger in JSON mode + downgrade routing/press WARNING→DEBUG (fixes #783)
- fix/issue-787-coords-bounds: Validate coordinates against GetSystemMetrics/65535 with COORDS_OUT_OF_BOUNDS error (fixes #787)

## Pushed branches (awaiting PR)
- fix/issue-788-stale-pid-app-id: PID liveness check in both _resolve_app_id callers + 4 new tests + 13 existing tests updated
- fix/issue-789-app-filter-basename: ntpath.basename() in 3 locations in _element.py + 3 new tests
- fix/issue-781-json-exit-code: 3 return→sys.exit(1) changes + 4 new tests
- fix/issue-783-json-duplicate-stderr: NullHandler + 2 WARNING→DEBUG downgrades + 1 new test
- fix/issue-787-coords-bounds: _get_max_screen_coord() helper + bounds validation + 2 new tests

## Rebased branches
- All 5 branches force-pushed over stale previous versions (clean re-implementation from current develop)

## Issues found but not fixed
- #786: Desktop-only UWP menu click regression. Requires WinUI 3 detection which needs Windows desktop testing.
- #785: Desktop-only CI test. Already addressed by PR #801 (merged). Needs verification on Windows desktop runner.

## Next session should
- Check if Orc-Mycelium has created/merged PRs for the 5 new branches
- If bugs are cleared: tackle remaining P1 features (#90 recording, #104 selector templates) — previous implementations were lost
- Consider #786 (UWP menu click) if desktop testing capability is available
