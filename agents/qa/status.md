# QA Status
Last updated: 2026-03-31 23:25
Current round: 72
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 123 passed, 8 failed, 4 skipped (commit b1c37e3)
- Issues verified: #705, #706, #707, #708, #709, #710, #711, #660 (all pass)
- E2E tests: Calculator (pass), Notepad (pass)
- Regression: 6/7 passed, 2 retired
- New test cases created: none
- Test cases retired: TC-0012 (PID targeting, #471 closed), TC-0030 (backslash escape, #619 closed)
- New issues created: #728 (unicode capture), #729 (CI notepad tests)
- Total active test cases: ~20
- Tests run: 14

## Top 3 Risks
1. **Unicode file paths broken in C++ core** — capture fails with Chinese paths despite #693 fix being "closed". This blocks Chinese users and CI tests. Filed #728.
2. **CI desktop test reliability** — 8 tests fail due to UWP Notepad timing issues. Tests need longer waits or retry logic for ApplicationFrameHost process model. Filed #729.
3. **Per-command CLI overhead** — Skeptical Evaluator comparison shows naturo is 4x slower than pywinauto for multi-step scripts. A batch/session mode could close this gap.
