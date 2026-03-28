# Dev Status
Last updated: 2026-03-28T19:20:00Z
Session: Fixed 2 v0.3.2 bugs — escape sequences in type + capture --pid

## This Session
- **Fixed #555 (P1)**: type command now interprets escape sequences (\t, \n, \r, \\)
  - PR #557 created and merged (commit `19646f1`)
  - 6 new tests in TestTypeEscapeSequences
- **Fixed #556 (P2)**: added --pid flag to capture command for API consistency
  - PR #558 created and merged (commit `ddd2797`)
  - 2 new tests (flag existence + functional pid routing)
- Code health scan: no TODOs/FIXMEs/bare-excepts found
- All modules have test coverage
- Tests: 2194 passed, 497 skipped, 0 failures
- Linter: clean

## Current State
- Earliest open milestone: v0.3.2 (0 bugs remaining — both fixed this session)
- CI: green on main
- Open PRs by me: none
- All remaining open issues are backlog P2 tasks/enhancements (42 issues)

## Next Session Should
1. **Backlog triage**: backends/windows.py splitting (#411) is the biggest tech debt (4064 lines)
2. **Consider v0.4.0 milestone**: Unified Selector engine items need a milestone
3. **README badges**: add CI status, PyPI version, license badges for professional appearance
4. **Check for new QA-reported bugs**: QA may file new issues after verifying the fixes
5. **Input strategy refactor (#412)**: evaluate complexity for pluggable input pattern
