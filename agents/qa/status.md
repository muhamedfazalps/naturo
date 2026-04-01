# QA Status
Last updated: 2026-04-01 19:22
Current round: 79
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 5 passed, 1 failed, 18 skipped (commit c241158) — known #777
- CI E2E Tests: 9 passed, 3 xfailed, 1 xpassed
- Issues verified: none pending
- E2E tests: Notepad (pass), Calculator (pass)
- Regression: 14/15 passed, 1 retired (TC-0034)
- New test cases created: TC-0041 (json-mode-exit-code-zero-on-failure)
- Test cases cleaned up: TC-0034 retired (6 passes, #693 closed)
- New issues created: #781
- Total active test cases: 21
- Tests run: 15 regression + 2 E2E + exploratory + Chinese user simulation

## Top 3 Risks
1. JSON exit code masking (#781) — scripts/agents miss failures in -j mode
2. Unicode path in C++ DLL (#777) — capture_screen fails with Chinese paths via naturo_core.dll
3. v0.3.2 scope creep — 25 open issues including browser automation, risk of delay
