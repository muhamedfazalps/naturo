# Dev-Sirius Session Log
> Date: 2026-04-02

## Completed
- fix/issue-788-stale-pid-routing: validate HWND liveness before routing keystrokes (fixes #788)
  - Two-layer fix using IsWindow(): _resolve_app_id emits APP_ID_STALE error, _resolve_hwnd raises WindowNotFoundError
  - 4 new tests, 4089 tests pass, ruff clean, mypy clean
- fix/issue-785-winui3-uia-probe: detect UIA for standalone WinUI 3 apps (fixes #785)
  - Added _find_winui_content_children() for DesktopWindowXamlSource child enumeration
  - Fixes Calculator/Paint UIA detection on Win11 where apps are not AFH-hosted
  - 4 new tests, 4088 tests pass, ruff clean, mypy clean
- fix/issue-789-app-filter-basename: extract process basename before --app matching (fixes #789)
  - Used ntpath.basename() in _resolve_hwnd, _resolve_hwnds, _is_afh_window
  - Prevents --app system from matching C:\Windows\System32\notepad.exe
  - 3 new tests, 4088 tests pass, ruff clean

## Pushed branches (awaiting PR)
- fix/issue-788-stale-pid-routing: HWND liveness validation (fixes #788)
- fix/issue-785-winui3-uia-probe: WinUI 3 UIA detection (fixes #785)
- fix/issue-789-app-filter-basename: process path basename extraction (fixes #789)

## Rebased branches
- (none — no stale branches found this session)

## Issues found but not fixed
- #786 [P1]: click eN on UWP Notepad menu — next priority after these merges
- Multiple pending branches from previous sessions still awaiting Orc-Mycelium PR creation/merge

## Next session should
- Check if Orc-Mycelium has merged the 3 new branches + previous pending branches
- Work on #786 (UWP menu click regression) — next P1 bug
- Work on #781 (JSON exit code) if branch still pending
- Consider #90/#91 (enterprise features) if P1 bugs are clear
