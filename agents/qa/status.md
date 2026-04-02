# QA Status
Last updated: 2026-04-02 22:20 UTC+8
Current round: 101
Current milestone: v0.3.2

## This Round
- CI Desktop Tests: 5 passed, 1 failed (#777 unicode path), 18 skipped (commit 1101af7). E2E: 9 passed, 2 xfail, 2 xpass
- Issues verified: none pending
- E2E tests: Notepad (pass, except menu click #786), Calculator (pass)
- Regression: 6/10 passed, 4 failed (known: #784, #786, #787, #807)
- New test cases created: none
- Test cases cleaned up: none
- New issues created: none (all failures match existing issues)
- Total active test cases: 25
- Tests run: 10 regression + E2E + exploratory + scripter simulation

## Top 3 Risks
1. **type -E newline drop (#784)** — P1: Multiline text automation broken in keystroke mode; blocks scripting workflows
2. **press --app focus mismatch (#807)** — P1: Keyboard shortcuts sent to wrong process, unreliable automation
3. **UWP menu click (#786)** — P1: click eN on UWP Notepad menu items does not open menu
