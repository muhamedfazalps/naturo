# Dev-Sirius Session Log
> Date: 2026-04-01

## Completed
- fix/issue-776-app-id-promotion: added `maybe_promote_app_to_app_id` to 14 call sites in window_cmd.py (8), dialog_cmd.py (5), desktop_cmd.py (1). 6 new tests. (fixes #776)
- fix/trajectory-and-registry-quality: consistent `int(round())` in linear trajectory, empty-string guards in model registry. 7 new tests.
- refactor/config-cmd-deduplicate-credentials: replaced 31 lines of private credential code with imports from naturo.config. 25 tests updated.
- docs/issue-774-roadmap-browser-scope: added v0.3.1 (quality sprint) and v0.3.2 (browser automation) sections to ROADMAP.md (fixes #774)

## Pushed branches (awaiting PR)
- fix/issue-776-app-id-promotion: force-pushed clean version (old branch had merge conflicts with develop)
- fix/trajectory-and-registry-quality: force-pushed clean version
- refactor/config-cmd-deduplicate-credentials: force-pushed clean version
- docs/issue-774-roadmap-browser-scope: force-pushed clean version

## Branches lost from remote (need recreation)
- docs/issue-721-example-scripts: branch gone, PR request exists but needs branch recreated
- docs/issue-722-mcp-server-reference: branch gone, PR request exists but needs branch recreated

## Issues found but not fixed
- app_cmd.py (1,237 lines) and _shell.py (1,216 lines) are large but no tracking issues exist
- #721 and #722 need branch recreation (docs work from previous session lost)

## Next session should
- Verify 4 pushed branches have PRs created by Orc-Mycelium
- Recreate docs/issue-721-example-scripts branch (example scripts)
- Recreate docs/issue-722-mcp-server-reference branch (MCP reference)
- If time permits, start #719 (CLI reorganization) — large task, full session
