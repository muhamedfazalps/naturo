# Dev-Sirius Session Log
> Date: 2026-04-02

## Completed
- feat/issue-104-builtin-selector-templates: Built-in selector templates for Top 20 Windows apps — 20 JSON files with 119 selectors, package-data config, 71 tests (fixes #104)

## Pushed branches (awaiting PR)
- feat/issue-104-builtin-selector-templates: 20 app templates (Notepad, Chrome, Firefox, Edge, Explorer, VS Code, Word, Excel, PowerPoint, Calculator, Settings, Task Manager, Windows Terminal, Outlook, Teams, CMD, Paint, Snipping Tool, Control Panel, Registry Editor), pyproject.toml package-data update, 71 tests

## Rebased branches
- feat/issue-90-recording-playback-cli: rebased onto develop, pushed
- fix/issue-788-stale-pid-hwnd: rebased onto develop, pushed
- fix/issue-789-app-filter-basename: rebased onto develop, pushed
- fix/issue-781-json-exit-code: rebased onto develop, pushed
- fix/issue-783-json-duplicate-stderr: rebased onto develop, pushed
- fix/issue-786-uwp-menu-click: rebased onto develop, pushed
- fix/issue-787-coords-bounds: rebased onto develop, pushed
- feat/issue-759-browser-download: rebased onto develop, pushed
- feat/issue-760-stealth-check: rebased onto develop, pushed
- feat/issue-761-drag-from-element: rebased onto develop, pushed
- feat/issue-764-iframe-support: rebased onto develop, pushed
- feat/issue-723-cost-guardrails: rebased onto develop, pushed
- test/browser-cmd-coverage: rebased onto develop, pushed
- refactor/config-cmd-deduplicate-credentials: rebased onto develop, pushed
- docs/issue-722-mcp-reference: rebased onto develop, pushed
- feat/issue-758-chrome-profiles: rebased with conflict resolution (browser_cmd.py), pushed
- feat/issue-761-captcha-handling: rebased with conflict resolution (browser_cmd.py), pushed
- feat/issue-762-browser-wait: rebased with conflict resolution (browser_cmd.py), pushed

## Issues found but not fixed
- feat/issue-90-recording-cli (old branch, superseded by -playback-cli): has conflict in cli/__init__.py — can be deleted since -playback-cli variant is the active branch
- docs/ROADMAP.md lines 175-176: #104 and #105 should be marked [x] done

## Next session should
- All P0/P1/P2 bugs and features have PRs queued — check which have been merged
- Check if Orc-Mycelium has created PRs for pending branches
- If all PRs merged: enter self-driven mode, focus on code health and test coverage gaps
- Consider updating ROADMAP.md to reflect completed features
