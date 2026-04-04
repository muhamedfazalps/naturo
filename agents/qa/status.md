# QA Status
Last updated: 2026-04-04 17:12
Current round: 107
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 0 passed, 0 failed, 151 skipped (commit 86e534d) — disconnected RDP session
- Issues verified: none (no status:done issues)
- E2E tests: Chrome (pass), Settings/设置 (pass, partial), full desktop capture (black — expected)
- Regression: 7/9 passed, 2 failed (TC-0042 #783, TC-0049 #834), 0 retired
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none (all failures map to existing issues)
- Total active test cases: 29
- Tests run: 9 regression + 5 exploratory + 6 MCP = 20

## Top 3 Risks
1. Disconnected RDP session blocks mouse/keyboard testing — click/type/press all fail with COM errors
2. Browser -j flag broken (#834) — AI agent builders cannot parse browser errors
3. JSON stderr duplication (#783) — scripts using 2>&1 get corrupted JSON output
