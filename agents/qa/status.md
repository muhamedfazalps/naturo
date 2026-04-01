# QA Status
Last updated: 2026-04-02 01:16
Current round: 84
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 5 passed, 1 failed (known #777), 18 skipped (commit 2c07bb2)
- CI E2E Tests: 9 passed, 2 xfailed, 2 xpassed
- Issues verified: none pending
- E2E tests: Calculator (pass), Notepad (pass)
- Regression: 12/13 passed, 0 retired
- Failed: TC-0031 (Notepad menu click targeting)
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none
- Commented on #781, #783 (appear fixed)
- Total active test cases: 23
- Tests run: 13

## Top 3 Risks
1. **TC-0031: Notepad UWP menu click targeting** — click eN on menu items reports success but has no visual effect. Impacts any workflow requiring menu interaction.
2. **CI Unicode DLL failure (#777)** — naturo_core.dll capture_screen still fails with Unicode paths in CI test. CLI workaround works via Python PIL fallback.
3. **MCP error messages expose Pydantic internals** — AI agents receiving validation errors get raw Pydantic URLs instead of actionable guidance. Poor DX for agent builders.
