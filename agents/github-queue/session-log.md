# Dev-Sirius Session Log
> Date: 2026-04-02

## Completed
- fix/issue-788-stale-pid-hwnd: Detect stale PID/HWND after app restart, fall back to process-name matching (fixes #788)
- fix/issue-789-app-filter-basename: Extract process basename before --app substring matching — prevents full-path contamination (fixes #789)
- fix/issue-781-json-exit-code: Exit non-zero when JSON mode reports failure in selector clear/export and visual report (fixes #781)
- fix/issue-787-coords-bounds: Reject out-of-bounds click coordinates with clear COORDS_OUT_OF_BOUNDS error (fixes #787)

## Pushed branches (awaiting PR)
- fix/issue-788-stale-pid-hwnd: Two-layer stale PID/HWND detection — _resolve_app_id validates PID liveness, _resolve_hwnd validates HWND with IsWindow()
- fix/issue-789-app-filter-basename: ntpath.basename() in _resolve_hwnd, _resolve_hwnds, _afh_has_content_window
- fix/issue-781-json-exit-code: Changed `return` to `sys.exit(1)` in 3 CLI error paths
- fix/issue-787-coords-bounds: _validate_coords helper with GetSystemMetrics (Windows) / 65535 generic bound

## Rebased branches
- (none — no stale branches this session)

## Issues found but not fixed
- #786 [P1] click eN on UWP Notepad menu items — needs desktop CI investigation, skipped for time
- #783 [P2] JSON mode emits duplicate stderr — identified but deferred

## Next session should
- Pick up #786 (P1 UWP Notepad menu click regression) — requires understanding UWP menu item click behavior
- Then #783 (P2 duplicate stderr in JSON mode)
- Then P1 features (#90, #91, #104, #105) if bugs are cleared
