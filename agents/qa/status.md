# QA Status
Last updated: 2026-04-04 16:16
Current round: 106
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 0 passed, 0 failed, 151 skipped (commit 2ad1ae6)
- Issues verified: none (no status:done issues)
- E2E tests: Notepad (pass — see/capture/find/get/quit all work; click/type blocked by disconnected RDP)
- Regression: 4/7 passed, 2 failed (TC-0049 #834, TC-0042-exp #783), 1 blocked
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none
- Total active test cases: 30
- Tests run: 7 (16 blocked by disconnected RDP)

## Top 3 Risks
1. Disconnected RDP session blocks mouse/keyboard testing — click/type/press all fail with COM errors
2. Browser -j flag broken (#834) — AI agent builders cannot parse browser errors
3. JSON stderr duplication (#783) — scripts using 2>&1 get corrupted JSON output
