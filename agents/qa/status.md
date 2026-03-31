# QA Status
Last updated: 2026-04-01 07:45
Current round: 76
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 21 passed, 4 failed, 18 skipped (commit 17a4e1c)
- Issues verified: #718 (pass), #716 (pass), #729 (fail), #702 (blocked)
- E2E tests: Calculator (pass), Notepad (fail)
- Regression: 6/7 passed, 1 retired
- New test cases created: TC-0038
- Test cases cleaned up: TC-0007 (retired — 5 passes, #442 closed)
- New issues created: #749, #750
- Total active test cases: ~20
- Tests run: 14

## Top 3 Risks
1. **UWP window enumeration broken on Chinese Windows** (#749) — basic Notepad workflow fails, pywinauto handles it fine
2. **Silent failure in app quit** (#750) — reports success but leaves apps running
3. **CI tests still failing** (#729) — timing fix insufficient, root cause is UWP enumeration
