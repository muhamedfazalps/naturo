# QA Status
Last updated: 2026-03-31 21:27
Current round: 71
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 124 passed, 4 failed, 5 skipped, 7 timeouts (commit 9bc3a02)
- Issues verified: #694 (blocked — PR #695 not merged)
- E2E tests: Explorer (pass), Notepad (pass)
- Regression: 9/10 passed, 1 failed (TC-0034), 1 blocked (TC-0007)
- New test cases created: TC-0035
- Test cases cleaned up: none
- New issues created: #704
- Total active test cases: 23
- Tests run: 10

## Top 3 Risks
1. **CI test infrastructure fragile** — Notepad UIA detection and lifecycle tests consistently fail/timeout in test runner. 7+ tests affected (#697).
2. **Chinese/Unicode file paths broken** — `naturo capture` fails with Chinese paths (#693). Blocks Chinese user adoption.
3. **AI vision cascade fix pending** — PR #695 still open, #694 unverified. Cascade captures terminal instead of target app.
