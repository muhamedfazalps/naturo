# Dev-Sirius Session Log
> Date: 2026-04-03

## Completed
- fix/issue-788-stale-pid-routing: validate PID liveness via is_pid_alive() + HWND via IsWindow() before routing keystrokes (fixes #788) — 6 new tests
- fix/issue-789-app-filter-basename: extract process basename with ntpath.basename() before --app matching in _resolve_hwnd, _resolve_hwnds, _is_afh_window (fixes #789) — 7 new tests
- fix/issue-786-uwp-menu-click: detect WinUI 3 apps via DesktopWindowXamlSource child windows for UIA click path (fixes #786) — 4 new tests + 2 mock fixes
- fix/issue-781-json-exit-code: exit non-zero in selector clear, selector export, visual report when reporting failure (fixes #781) — 6 new tests

## Pushed branches (awaiting PR)
- fix/issue-788-stale-pid-routing: is_pid_alive() + StaleAppIdError + _is_hwnd_alive() in _resolve_app_id
- fix/issue-789-app-filter-basename: ntpath.basename() in _resolve_hwnd, _resolve_hwnds, _is_afh_window
- fix/issue-786-uwp-menu-click: _is_winui_window() detection + WinUI fallback in _click.py
- fix/issue-781-json-exit-code: sys.exit(1) in three CLI failure paths

## Rebased branches
- fix/issue-788-stale-pid-routing: rebased onto remote counterpart (merged both PID and HWND validation)
- fix/issue-789-app-filter-basename: rebased onto remote counterpart, resolved test conflicts
- fix/issue-786-uwp-menu-click: force-pushed clean implementation over stale remote
- fix/issue-781-json-exit-code: rebased onto remote counterpart, resolved test conflicts

## Issues found but not fixed
- None (focused on clearing the P0 + P1 bug backlog)

## Next session should
- Check if the 4 fix branches have been merged by Orc-Mycelium
- If merged, start on remaining P1 bugs: #784 (type -E newline), #785 (calculator UIA) — check if already merged
- Then P1 features: #90 recording/playback engine or #104 built-in selector templates
- Migration guide gaps (#759, #760, #761) may need attention before v0.3.2
