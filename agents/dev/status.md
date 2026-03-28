# Dev Status
Last updated: 2026-03-28T17:20:00Z
Session: PR cleanup + CLI reference generator (#414)

## This Session
- **Merged 3 PRs** from previous session:
  - PR #545 → `b1b68a7` (fixes #543 — highlight help formatting)
  - PR #546 → `032f76a` (fixes #544 — config command tests)
  - PR #549 → `341a3ca` (fixes #547 — MCP setup README)
- **Issue #414 — Auto-generate CLI reference**: implemented
  - PR #550: `scripts/generate_cli_reference.py` introspects all Click commands
  - Generated `docs/CLI_REFERENCE.md` (1474 lines, 24 commands with options/examples)
  - 12 tests in `tests/test_cli_reference_gen.py`
- **Issue #551 created**: ROADMAP lists Excel COM as not done, but it shipped in v0.1.1
- Code health scan: clean — no TODOs, no bare excepts, linter passes
- Tests: 2192 passed, 499 skipped, 0 failures
- PRs: #550 created (CI running)

## Current State
- Earliest open milestone: none (all milestones clear)
- CI: green on main
- Open PRs by me: #550 (docs: CLI reference generator)
- All open issues are backlog P2 tasks/enhancements (41 issues + #551)

## Next Session Should
1. **Merge PR #550** if CI green, or fix if CI fails
2. **Fix ROADMAP** per #551 — mark Excel COM as done
3. **Backlog triage**: backends/windows.py splitting (#411) is the biggest tech debt
4. **Consider v0.4.0 milestone**: Unified Selector engine items need a milestone
5. **README badges**: add CI status, PyPI version, license badges for professional appearance
