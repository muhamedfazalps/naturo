# QA Status
Last updated: 2026-04-04 23:12
Current round: 113
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 1 passed, 1 failed, 8 skipped (commit 81b465a)
- CI E2E Tests: 9 passed, 3 xfailed, 1 xpassed (commit 81b465a)
- Issues verified: none (no status:done issues)
- E2E tests: Notepad (pass), Calculator (fail — #841)
- Regression: 4/9 passed, 5 failed, 0 retired
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none
- Total active test cases: 25
- Tests run: 9 regression + E2E + exploratory + Skeptical Evaluator simulation

## Top 3 Risks
1. Multiline text completely broken (#784/#840) — both default and -E modes drop newlines
2. Calculator UWP invisible (#785/#841) — core UWP app automation broken
3. Menu click silent failure (#786) — click on UWP Notepad menu reports success but nothing happens
