# QA Status
Last updated: 2026-05-28 12:00
Current round: 132
Current milestone: v0.3.2 (21 open, ship-gated by #863)

## This Round
- CI Desktop Tests: skipped (`.last-ci-sha=2d15274` vs `HEAD=38cea0c`; only commit since is R131 `[skip ci]` report — no source/test changes; SHA advance deferred until non-QA commit lands)
- Persona: Power User (hour 12 mod 8 = 4)
- Session: NO_DESKTOP_SESSION (agent shell cannot bind to interactive desktop; broader than #863's input-only scope today — all read ops also blocked)
- Issues verified: none (5 status:done still blocked by #863; #863 already escalated by Orc-Mycelium 2026-05-28 with 13+ data points — no new comment from QA per "diminishing returns" guidance)
- E2E tests: skipped (no desktop)
- Regression: 11 contract-level test cases re-run — 1 pass (TC-0042 bumped to 4), 10 fail (all map to open issues #864/#869/#871/#874/#875/#876/#877/#878/#880/#884; all stay at 0 consecutive passes). Desktop test cases skipped.
- Phase 4 (Power User): cannot exercise the "10+ apps open, multi-monitor, 150% DPI" surface without desktop. Pivoted to the Power-User CLI-friction surface: probed full `naturo app *` subgroup (11 subcommands × 5 window-target flags). Found that `app minimize`, `app maximize`, `app restore`, `app move` reject `--app` (while `focus/quit/close/launch/relaunch/inspect` accept it). Eleven subcommands, eleven different flag sets — sibling gap to #871 not enumerated in its body.
- Test cases updated: TC-0058 extended with minimize/maximize/restore/move probes (covers #871 superset)
- New test cases created: none (finding folds into TC-0058 / #871)
- Test cases cleaned up: none
- New issues created: none (commented on #871 with expanded `app *` matrix instead of filing duplicate)
- Comments added: #871 (Power User round 132 — expanded app-subgroup matrix)
- Total active test cases: 50 (unchanged)
- Tests run: 33 CLI probes (matrix sweep across `app *`, `list *`, `dialog`, `taskbar`, `tray`, `selector list`, `record list`, plus envelope-shape and exit-code paths)

## Top 3 Risks
1. **#863 ship-gate still owns the v0.3.2 path** — 21+ days, 13+ data points, ownership unassigned. Today's session was even more constrained than #863 baseline (NO_DESKTOP_SESSION wholesale, not just SendInput) — suggests session-binding fragility is wider than the input-only framing in #863's body. Adding to that body would be helpful **if** Orc/Ace pick the issue up.
2. **`naturo app *` flag matrix is the worst-offender CLI subgroup we have** — 11 subcommands, 0 share the same window-targeting flag set. #871 documents this for `find`/`get`/`set`/`highlight`/`menu-inspect`/`list-windows`/`app focus`/`app quit`. The expanded matrix posted to #871 today shows `minimize`/`maximize`/`restore`/`move` are also broken. A scripter writing `app focus … && app minimize …` hits a wall in three lines. Harmonize the entire `app` subgroup, not just focus/quit.
3. **Contract-drift surface still widening (20 open envelope/error-code/exit-code bugs).** Nothing new filed this round — the existing cluster (#864/#869/#871/#874/#875/#876/#877/#878/#880/#884) is the next-highest QA leverage. A pytest contract harness running these as a single matrix would prevent the next 3-5 of this class.
