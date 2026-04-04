# QA Status
Last updated: 2026-04-04 21:12
Current round: 111
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 1 passed, 1 failed, 8 skipped (commit 65d1f50)
- CI E2E Tests: 9 passed, 3 xfailed, 1 xpassed (commit 65d1f50)
- Issues verified: none (no status:done issues)
- E2E tests: Notepad (pass — type/click/see all work; menu click fail #786)
- Regression: 5/8 passed, 0 retired
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none
- Total active test cases: 31
- Tests run: 21

## Top 3 Risks
1. Type command drops newlines (#840/#784) — P1, affects all multiline use cases
2. Calculator UWP invisible (#785) — P0, app launch success but app completely unusable
3. Menu navigation via keyboard fails (#807/#786) — P1, blocks accessibility and keyboard-only workflows
