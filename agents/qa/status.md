# QA Status
Last updated: 2026-05-28 07:12
Current round: 127
Current milestone: v0.3.2 (23 open / 88 closed, 79%)

## This Round
- Persona: Skeptical Evaluator (hour 07 % 8 = 7) — naturo vs pywinauto / pyautogui comparison.
- CI Desktop Tests: 0 passed / 0 failed / 151 skipped (session-gated). Ran full `pytest -m "desktop or integration"` + `-m e2e` since `.last-ci-sha` (90c2220) differed from HEAD (e7615ce); delta was QA-only commits. `.last-ci-sha` advanced to e7615ce.
- Session unchanged: 8th consecutive round non-interactive. All `see / capture / list / type / press / click` return `NO_DESKTOP_SESSION`. No E2E possible.
- Issues verified + closed: **none** — all 5 status:done (#786 #788 #807 #840 #843) still partial-verified, blocked on #863. Unit-test re-run still green (88 passed across the 5 fix suites). No new comments posted (R121–R126 already document the persistent blocker).
- Regression (Phase 5): spot-check on non-desktop subset (TC-0054 / TC-0055 / TC-0059 / TC-0061 / TC-0062 / TC-0063) — all still **fail** (source issues open). `last_run` advanced.
- New issues created (**2**):
  - **#878** (bug, P1, from:qa, silent-failure, v0.3.2) — `app windows -j` bypasses NO_DESKTOP_SESSION guard, returns 12 real desktop windows in non-interactive session. Same class as closed #305 / #373 / #533 and still-open #875.
  - **#879** (bug, P2, from:qa, v0.3.4) — `browser launch -j` returns `{"status": "ok", "pid": ...}` instead of `{"success": true, ...}` standard envelope. Same class as #876.
- New test cases created: **TC-0065** (#878), **TC-0066** (#879).
- Test cases retired: none.
- Total active test cases: ~44 active / 22 retired / 2 blocked.
- Tests run: pytest collected 5594 (138 desktop+integration auto-skipped, 13 e2e auto-skipped — no failures), 88 unit-test re-runs for the 5 status:done fixes, ~22 CLI-contract spot-checks (exit-code matrix across 9 commands x plain/-j, envelope checks across browser / app / clipboard / config / selector / record / dialog / taskbar / tray, MCP tools listing, pywinauto import comparison).

## Status:done queue
- Started: 5
- Verified + closed: 0
- Rejected: 0
- Partial-verify, retained: 5 (no movement since R117)
- **End of round**: 5 (#786, #788, #807, #840, #843) — all still blocked on #863

## Top 3 Risks
1. **#863 (P0 ship gate)** — 8th consecutive round without console-session QA access. v0.3.2 ship is locked behind this single operational change. The 5 SendInput-dependent fixes cannot be runtime-verified from any RDP/SSH session.
2. **Silent-success class keeps growing** — closed #305 / #373 / #533 added per-command desktop guards. Still missing on #875 (dialog / taskbar / tray) and now #878 (app windows). Per-command pattern is fragile; needs a shared `@require_desktop_session` decorator at command registration to close the whole class.
3. **`-j` envelope drift now spans 11 endpoints** — #864 #865 #866 #867 #869 #871 #872 #874 #876 #877 #879. Each one breaks a different Scripter / AI-agent assumption. A unified `success_response()` helper used across the CLI would close most of these in one PR.

## Persona Coverage (rolling)
| Persona | Last round | Findings |
|---------|-----------|----------|
| First-time User (0) | R120 | #867 |
| AI Agent Builder (1) | R121 | #868 |
| Enterprise RPA Dev (2) | R122 | #869 |
| Chinese User (3) | R123 | #870 + #871 |
| Power User (4) | R124 | #872 + #873 |
| Accessibility User (5) | R125 | #874 |
| Scripter (6) | R126 | #875 + #876 + #877 |
| **Skeptical Evaluator (7)** | **R127** | **#878 + #879** |
