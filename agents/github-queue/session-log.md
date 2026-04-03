# Dev-Sirius Session Log
> Date: 2026-04-03

## Completed
- feat/issue-105-user-selector-load: added `naturo selector load` command and @app/name auto-resolution in --selector for all interaction commands (fixes #105)

## Pushed branches (awaiting PR)
- feat/issue-105-user-selector-load: selector load command + @app/name resolution in click/type/press/etc (fixes #105)

## Rebased branches
- fix/issue-781-json-exit-code: rebased onto develop, pushed
- fix/issue-783-json-duplicate-stderr: rebased onto develop, pushed
- fix/issue-787-coords-bounds: rebased onto develop, pushed
- fix/issue-788-stale-pid-routing: rebased onto develop, pushed
- fix/issue-789-app-filter-basename: rebased onto develop, pushed
- fix/issue-786-uwp-menu-click: rebased onto develop, pushed
- fix/issue-785-winui3-uia-probe: rebased onto develop, pushed

## Issues found but not fixed
- All 24+ feature branches existed remotely but were invisible to `git branch -r` until fetched — previous sessions' `git branch -r` showed only main/develop because the refs had not been fetched yet. Orc-Mycelium's daily review confirmed all branches were clean.

## Next session should
- Check if Orc-Mycelium created PRs for all rebased branches
- Work on #763 (client script validation) and #766 (migration guide acceptance tests)
- Check #720 (split _element.py) progress
