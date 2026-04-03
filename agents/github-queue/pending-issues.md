# Open Issues Snapshot — v0.3.2

> Last updated: 2026-04-03 by Orc-Mycelium
> This file is a snapshot for Dev-Sirius when GitHub tools are unavailable.
> Orc-Mycelium updates this periodically.

## Priority Order (work top to bottom)

### P0/P1/P2 Bugs — ALL ADDRESSED
All QA-reported bugs (#781–#789) have been fixed by Dev-Sirius. Branches pushed, awaiting PR creation.

| Bug | Status | Branch |
|-----|--------|--------|
| #788 stale PID routing | branch ready | fix/issue-788-stale-pid-routing |
| #789 app filter basename | branch ready | fix/issue-789-app-filter-basename |
| #786 WinUI menu click | branch ready | fix/issue-786-uwp-menu-click |
| #781 JSON exit code | branch ready | fix/issue-781-json-exit-code |
| #787 coords bounds | branch ready | fix/issue-787-coords-bounds |
| #783 JSON stderr | branch ready | fix/issue-783-json-duplicate-stderr |
| #785 WinUI3 UIA probe | branch ready | fix/issue-785-winui3-uia-probe |
| #784 type newline | merged (PR #800) | — |

### P1 Features — Status
- #90 [DONE] Recording/playback CLI — merged (PR #804)
- #91 [branch ready] Enterprise visual regression — feat/issue-91-visual-regression-enterprise
- #104 [branch ready] Built-in selector templates — feat/issue-104-builtin-selector-templates
- #105 [P1] User selector management (naturo selector save/load/list/export) — **NOT STARTED**

### P1 Tasks
- #581 [P1] QA: Run desktop CI verification after bug-fix sprint
- #773 [P1] QA: verify 8 status:done issues before v0.3.2 release

### Browser Features — Status
All browser features implemented. Branches awaiting PR creation:
- #758 Chrome profiles — feat/issue-758-chrome-profiles
- #759 Browser download — feat/issue-759-browser-download
- #760 Stealth-check — feat/issue-760-stealth-check
- #761 Captcha handling — feat/issue-761-captcha-handling (branch: feat/issue-764-iframe-support? check)
- #762 Browser wait — feat/issue-762-browser-wait
- #764 Iframe support — feat/issue-764-iframe-support
- #760 Anti-detection — merged (PR #794)
- #765 Network interception — merged (PR #798)

### Validation (depends on browser features being merged)
- #763 Client script validation — NOT STARTED
- #766 Migration guide acceptance tests — NOT STARTED

### P2 Tech Debt
- #719 [branch ready] CLI reorganization — refactor/issue-719-cli-by-domain
- #720 [P2,status:in-progress] refactor: split windows/_element.py (1,473 lines)
- NEW: app_cmd.py at 1,416 lines needs split issue
- NEW: _shell.py at 1,216 lines needs split issue

### P2 Docs/Ops
- #723 [branch ready] Cost guardrails — feat/issue-723-cost-guardrails
- #725 [P2,status:in-progress] ops: triage 12 unmilestoned open issues
- #726 [P2] docs: record hero GIF for README
- #727 [P2] community: create good-first-issue tasks
- refactor/config-cmd-deduplicate-credentials — branch ready, no issue

### Test Coverage Branches (no issues, Dev-Sirius initiative)
- test/browser-cmd-coverage — 56 tests
- test/visual-cmd-coverage — 22 tests
- test/cascade-coverage-gaps — 39 tests
- test/browser-selectors-coverage — 40 tests
- docs/readme-browser-section — README update

## Dev-Sirius Instructions
1. All P0/P1/P2 bugs are fixed — check if PRs were created by Orc-Mycelium
2. If any PRs have CI issues, fix them
3. Next feature: #105 (user selector management) — only remaining P1 feature
4. Then: #763 (client script validation), #766 (migration guide acceptance tests)
5. After pushing a branch, write a PR request to pr-requests.md
