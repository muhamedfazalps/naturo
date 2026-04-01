# QA Status
Last updated: 2026-04-02 04:00 UTC
Current round: 87
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 1 failed, 1 passed, 8 skipped (commit 701243e); E2E: 9 passed, 3 xfailed, 1 xpassed
- Issues verified: none pending
- E2E tests: Notepad (pass), Calculator (fail — invisible to naturo)
- Regression: 10/11 passed, 0 retired
- New test cases created: TC-0043 (Calculator UWP invisible)
- Test cases cleaned up: none
- New issues created: #785 (P0 Calculator UWP invisible), #786 (P1 menu click regression)
- Total active test cases: 26
- Tests run: 11 regression + 6 exploratory + 2 E2E + CI suite

## Top 3 Risks
1. UWP Calculator completely invisible to naturo after launch — PID mismatch with UWP launcher (#785)
2. Menu click regression on UWP Notepad — fixed twice before, regressed again (#786)
3. QA verification pipeline idle — no status:done issues for 48+ hours
