# QA Status
Last updated: 2026-04-04 11:19
Current round: 104
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 5 passed, 1 failed (#777 unicode path), 18 skipped (commit 5495dfe)
- CI E2E Tests: 9 passed, 3 xfailed, 1 xpassed
- Issues verified: none (no status:done issues)
- E2E tests: Notepad (pass), Calculator (fail — UWP invisible)
- Regression: 6/8 passed, 2 failed, 0 retired
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none
- Total active test cases: ~25
- Tests run: 8 regression + 5 exploratory + 4 Chinese user + 2 E2E

## Top 3 Risks
1. **Calculator UWP completely invisible** — app launch reports success but Calculator not detected (#785)
2. **UWP menu click regression** — click reports success but menu doesn't open (#786)
3. **type -E newline dropped** — multiline automation broken (#784)
