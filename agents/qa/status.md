# QA Status
Last updated: 2026-04-05 00:16
Current round: 114
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 1 failed (known #841), 1 passed, 8 skipped (commit 2b7e8d2)
- CI E2E Tests: 9 passed, 3 xfailed, 1 xpassed (commit 2b7e8d2)
- Issues verified: none (no status:done issues)
- E2E tests: Notepad (pass), Calculator (fail — #841/#785)
- Regression: 11/16 passed, 5 failed (all known), 0 retired
- New test cases created: none
- Test cases cleaned up: TC-0005 unblocked
- New issues created: #843
- Total active test cases: 24
- Tests run: 16 regression + E2E + exploratory + First-time User simulation

## Top 3 Risks
1. Type multiline broken (#840/#784) — core UX, blocks realistic text automation
2. Calculator invisible (#841/#785) — UWP Calculator detection completely broken
3. Capture misses popups (#843) — AI agent verification workflows affected
