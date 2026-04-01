# QA Status
Last updated: 2026-04-02 00:22
Current round: 83
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 18 passed, 1 failed (known #777), 5 skipped; E2E: 9 passed, 3 xfailed, 1 xpassed (commit 5e890b3)
- Issues verified: none pending
- E2E tests: Calculator (pass), Notepad (pass)
- Regression: 12/12 passed, 0 retired
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none (all findings match existing #777, #783)
- Total active test cases: ~22
- Tests run: 16

## Top 3 Risks
1. **CI Unicode DLL failure (#777)** — naturo_core.dll capture_screen still fails with Unicode paths in CI. CLI path works via Python PIL fallback, but C++ bridge is broken.
2. **JSON mode stderr duplication (#783)** — type/click -j emit duplicate human-readable error to stderr alongside JSON stdout. Breaks clean pipe parsing for AI agents.
3. **v0.3.2 scope tripled** — 31+ open issues including browser automation pivot (#759 in-progress). Risk of shipping with insufficient QA on new browser features.
