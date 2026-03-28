# Dev Status
Last updated: 2026-03-28T16:20:00Z
Session: Self-driven mode — fix CLI help bug, add config tests, document MCP setup

## This Session
- **Issue #543 created & fixed**: highlight --help examples wrapped into unreadable mess
  - PR #545: shortened example lines, added regression test
- **Issue #544 created & fixed**: config command had zero test coverage
  - PR #546: 25 new tests covering setup/show/clear, credential I/O, redaction
- **Issue #547 created & fixed**: README missing MCP server setup instructions
  - PR #549: added Claude Desktop config example, transport options, verify steps
- **Issue #548 created & closed**: deps.py print() statements are actually correct (interactive progress)
- Tests: 2096 passed, 557 skipped, 0 failures (+ 25 new config tests)
- PRs: #545, #546, #549 created (CI Gate green, awaiting merge)

## Current State
- Earliest open milestone: none (all milestones clear)
- CI: green on main; all 3 new PRs pass CI Gate
- Open PRs by me: #545, #546, #549 (auto-merge not available — may need repo settings)
- All open issues are backlog P2 tasks/enhancements (42 issues)

## Next Session Should
1. **Merge PRs**: #545, #546, #549 — check if they're merged or need manual merge
2. **Code health**: backends/windows.py at 4064 lines — splitting is overdue (#411)
3. **ROADMAP v0.4.0**: Unified Selector engine (SelectorBuilder + SelectorResolver)
4. **Test coverage**: Run coverage report, find untested code paths
5. **JSON consistency**: Standardize indent across CLI commands (some use indent=2, others none)
6. **Backlog triage**: Consider which P2 items should be promoted to a v0.4.0 milestone
