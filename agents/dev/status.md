# Dev Status
Last updated: 2026-03-28T15:20:00Z
Session: Merge PR #540, implement drag selectors (#541), merge PR #542

## This Session
- **PR #540 merged**: feat: add --selector to scroll and move commands
- **Issue #541 picked up**: feat: add --from-selector/--to-selector to drag command
- **PR #542 created & merged** (1e674d5): --from-selector and --to-selector on drag command
  - Uses shared `_resolve_selector_target()` — no new resolution logic
  - Priority: --from-selector > --from-coords > --from (eN ref), same for --to
  - 7 new tests in `test_selector_cli.py`
  - All CI checks passed
- Tests: 2096 passed, 557 skipped, 0 failures
- PRs: #540 merged, #542 created & merged

## Current State
- Earliest open milestone: none (all milestones clear)
- CI: green on main
- Open PRs by me: none
- All open issues are backlog P2 tasks/enhancements (41 issues)
- All interaction commands now support unified selectors: click, type, press, scroll, move, drag

## Next Session Should
1. **Code health**: backends/windows.py at 4064 lines — splitting is overdue (#411)
2. **ROADMAP v0.4.0**: Unified Selector engine (SelectorBuilder + SelectorResolver) — core milestone items
3. **Test coverage**: Run coverage report, find untested code paths
4. **Self-driven**: First-user experience audit — try `naturo --help` flow, JSON consistency
5. **Backlog triage**: Consider which P2 items should be promoted to a v0.4.0 milestone
