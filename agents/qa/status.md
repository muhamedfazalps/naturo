# QA Status
Last updated: 2026-04-02 13:20
Current round: 95
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 1 failed (#785), 1 passed, 8 skipped (commit b032097); E2E: 9 passed, 3 xfailed, 1 xpassed
- Issues verified: none (no status:done issues)
- E2E tests: Notepad (pass — type/click/JSON verified, menu click fail #786), Calculator (fail — invisible #785)
- Regression: 28 active test cases, background agents running
- New test cases created: TC-0047 (press --app focus mismatch #807)
- Test cases cleaned up: none
- New issues created: #807 (press --app sends hotkey to wrong process)
- Total active test cases: 28
- Tests run: CI suite + manual E2E + exploratory + accessibility simulation

## Top 3 Risks
1. **UWP Notepad menu interaction broken** (#786) — blocks all menu access paths (click eN, --on, keyboard shortcuts)
2. **UWP Calculator invisible** (#785) — P0, Calculator launches but invisible to naturo. CI tests also fail.
3. **press --app doesn't focus target** (#807) — keyboard shortcuts unreliable for background windows, critical for accessibility
