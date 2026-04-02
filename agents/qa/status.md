# QA Status
Last updated: 2026-04-02 23:42
Current round: 102
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 5 passed, 1 failed (#777 known), 18 skipped, 1 xpassed (commit a1ebe62)
- CI E2E Tests: 9 passed, 3 xfailed, 1 xpassed
- Issues verified: none (no status:done issues)
- E2E tests: Calculator (pass), Notepad (pass)
- Regression: 20/25 passed, 3 skipped, 5 failed (all known bugs)
- Test cases retired: TC-0025 (#613 closed)
- New test cases created: none
- New issues created: none
- Total active test cases: 29
- Tests run: 27

## Top 3 Risks
1. **type -E newline drop (#784)** — P1: breaks multi-line automation, no workaround
2. **press --app focus mismatch (#807)** — P1: hotkeys sent to wrong process
3. **--app title cross-matching (#789)** — P1: wrong process targeted silently
