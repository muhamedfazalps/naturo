# QA Status
Last updated: 2026-04-02 06:16 UTC
Current round: 89
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 130 passed, 4 failed, 1 skipped (commit 1362f63); E2E: 9 passed, 3 xfailed, 1 xpassed
- Issues verified: none (no status:done issues)
- E2E tests: Notepad (pass), Calculator (fail — #785 invisible)
- Regression: 4/10 passed, 6 failed, 0 retired
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none (all failures map to existing issues)
- Total active test cases: 26
- Tests run: 23 (CI + manual regression + exploratory + Scripter script)

## Top 3 Risks
1. Calculator completely unusable (#785) — UWP Calculator invisible to list/see after launch
2. Scripting reliability (#783, #784) — JSON stderr pollution + type -E newline dropping break scripted workflows
3. Unicode path DLL failure (#777) — Chinese Windows users hit file I/O errors on capture
