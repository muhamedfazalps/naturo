# Daily Review — 2026-03-29 (evening update)

## Summary
- 35 PRs merged in one day — the most productive day in project history. 4 P0 bugs, 5 P1 bugs, 2 major refactors, 1 new feature, 87 new unit tests.
- Pipeline is empty — agents are blocked pending Ace's scope decision on #580.
- v0.3.2 is functionally complete (24/29 closed) — remaining 3 feature issues should move to v0.4.0.

## Milestone Progress
| Milestone | Open | Closed | Health |
|-----------|------|--------|--------|
| v0.3.2    | 5    | 24     | at-risk — awaiting scope decision (#580). Feature work done (#168 completed today). |
| v0.3.4    | 18   | 7      | on-track — launch tasks, blocked by v0.3.2 |

## Merged PRs (today — 35 total)

### P0 Bug Fixes
- #610 click --app now brings target window to foreground (fixes #608)
- #622 negative element coordinates on 4K/DPI UWP apps (fixes #613)
- #621 coverage falsely reports 100% on Electron apps (fixes #609)
- #618 AI Vision JSON parsing fails — handle arrays, code fences, wrapper objects (fixes #611)

### P1 Bug Fixes
- #614 type/press --app use robust focus_window (fixes #612)
- #623 app quit false failure when ghost process survives (fixes #620)
- #624 add --raw flag to type command (fixes #619)
- #632 CI auto-merge build-python check (fixes #603)
- #605 add --pid to scroll, drag, move (fixes #604)

### New Features
- #607 unified clipboard command + click modifiers (fixes #168)
- #626 wire CDP into cascade — see/click web content in Chrome/Electron (fixes #617)
- #628 selector usability — // shorthand, app name normalization, Unicode (fixes #615)

### Refactoring
- #627 split backends/windows.py (4383 lines) into 6 focused submodules (fixes #411)
- #638 split mcp_server.py create_server() into 11 focused modules (fixes #629)
- #631 replace 35+ silent except-pass patterns with debug logging (fixes #630)

### Test Coverage (+87 new tests)
- #633 27 tests for cli.table and detect.models
- #636 26 tests for cli/options.py
- #637 34 tests for annotate.py helpers

### Documentation & QA
- #625 --raw flag docs for type command
- #616 add 6 mandatory real-world QA scenarios

### Earlier PRs (from morning, also merged today)
- #579, #578, #577, #576, #574, #572, #566, #564, #562, #561, #558, #557, #554, #552, #550

## Closed Issues (today)
#629, #630, #615, #603, #411, #617, #619, #620, #608, #613, #609, #611, #612, #168, #604, #586, #606 + 15 from earlier sprint

## Open PR
- #568 (external contributor @Adraca) — README Linux/macOS. Targets already-closed #420. Three comments recommending closure. Contributor hasn't responded (>24h). Mergeable state: unstable (conflicts with main after 35 merges).

## Actions Taken
- Commented on #580: updated recommendation — #168 completed, recommend shipping v0.3.2 as-is, move #104/#105/#412 to v0.4.0
- Updated STATE.md with today's massive progress
- Identified 2 new unmilestoned tech debt issues (#634 cli/interaction.py split, #635 cli/core.py split) — should be milestoned to v0.4.0

## Top 3 Priorities (next 24h)
1. **Ace decides v0.3.2 scope** (#580) — this is THE blocker. Everything else flows from this decision.
2. **Full desktop CI verification** (#581) — 35 PRs in one day, many touching window resolution. Regression risk is high.
3. **Resolve external PR #568** — contributor hasn't responded. Close with a kind message pointing to `good first issue` labels, or request specific rework.

## Risks
- **Regression risk (HIGH)**: 35 PRs in one day, many touching overlapping code paths (UWP/AFH resolution, coordinate handling, input routing). Combined interaction on real desktop is untested. Mitigation: #581 desktop CI + real-machine verification.
- **Idle agents**: Pipeline has been empty for most of the day. Dev-Sirius shifted to self-directed refactoring and test coverage (#627, #629, #633-638) — good initiative, but forward feature work is stalled. Mitigation: #580 scope decision unblocks planning.
- **External contributor**: PR #568 stale >24h with 3 review comments. Poor contributor experience if left unresolved. Mitigation: close kindly or request specific changes within 24h.
- **Test count trajectory**: ~2200 → ~2469 (+269 tests today). Excellent velocity. No tests removed or skipped to make things pass — healthy.
