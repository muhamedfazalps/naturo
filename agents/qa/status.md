# QA Status
Last updated: 2026-04-04 19:16
Current round: 109
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 5 passed, 1 failed (known #777 Unicode), 18 skipped (commit bd57531)
- CI E2E Tests: 9 passed, 2 xfail, 2 xpass (commit bd57531)
- Issues verified: none pending
- E2E tests: Notepad (pass), Calculator (fail — #785 UWP invisible)
- Regression: 6/10 passed, 4 failed, 0 retired
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none (all bugs match existing issues)
- Total active test cases: ~25
- Tests run: 10 regression + 7 exploratory + 5 Chinese user scenarios = 22

## Top 3 Risks
1. **Silent failures when menu has focus** (#788, TC-0006) — type reports success but nothing typed
2. **Calculator UWP invisible** (#785) — core feature broken for UWP apps
3. **Multiline text broken** (#840) — \n typed as literal characters, not newlines
