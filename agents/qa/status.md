# QA Status
Last updated: 2026-05-28 16:13
Current round: 136
Current milestone: v0.3.2 (28 open after #889, ship-gated by epic #885 + 5 SendInput-blocked status:done from console session)

## This Round
- CI Desktop Tests: ran (HEAD `70e6591`), 138 desktop/integration + 13 e2e all SKIPPED legitimately (NO_DESKTOP_SESSION via WTSQuerySessionInformationW fixture guard). 0 fail. `.last-ci-sha` advanced to `70e6591`.
- Persona: First-time User (hour 16 mod 8 = 0)
- Session: NO_DESKTOP_SESSION (agent shell cannot bind to interactive desktop)
- Issues verified: none (5 status:done still SendInput-blocked from this session; all 5 already carry the "Partial verification BLOCKED" comment from earlier rounds)
- E2E tests: skipped (no desktop)
- Regression: TC-0054 re-validated FAIL on HEAD `70e6591` (type=2, press=2, click=2, see=1, type-j=1) — unchanged from R135. TC-0055 expanded with `key → hotkey` reproducer step.
- Phase 4 (First-time User): walked through first-touch CLI surface — `naturo`, `naturo --help`, `naturo --version`, intuitive command guesses (`screenshot`, `automate`, `ai`, `tap`, `launch notepad`). Three first-touch failure modes hit, two already filed (#880, #867), one new (#889).
- New issues created: **#889** (typo suggester wrong-match family — `ai → wait`, `tap → app` — P2 v0.3.4)
- Comments added: **#866** (scope-extension matrix: 7 commands not 3 — `highlight`/`move`/`drag`/`scroll` also exit 2 with Click `Usage:` banner via shared `_get_backend` in `naturo/cli/interaction/_common.py`); **#867** (scope-extension: deprecated hidden `hotkey` leaks via `naturo key` — same class as `snapshot`)
- New test cases created: **TC-0076** (typo-suggester-nonsense-match for #889)
- Test cases updated: TC-0054 (R136 expanded matrix notes — 7 commands), TC-0055 (R136 `key → hotkey` reproducer step)
- Test cases cleaned up: none
- Total active test cases: **55** (+1)
- Tests run: ~30 CLI surface probes across 16 subcommands (see/capture/list/find/menu-inspect/dialog/taskbar/tray/desktop/visual/highlight/move/drag/scroll/type/press/click/wait/record/selector/config/mcp) + TC-0054 + TC-0055 manual re-run

## Top 3 Risks
1. **#866 fix scope quietly grew by 4 commands**. The original title and reproducer only mention type/press/click, but the same `_get_backend` helper in `naturo/cli/interaction/_common.py` is shared by `highlight`/`move`/`drag`/`scroll` — all 7 commands emit the Click `Usage:` banner with exit 2 in bare mode. If the fix PR validates only the 3 commands in the title, the bug ships half-fixed. Verification gate should require all 7 to land at exit 1 (no banner) in bare mode.
2. **First-touch CLI surface has 3 separate typo-suggester bugs** (#867 hidden-command leak, #880 missing-subgroup, #889 nonsense-match) all firing within seconds of `pip install naturo`. A first-time user typing `naturo screenshot`, `naturo launch notepad`, `naturo ai` in any order hits at least one wrong suggestion. Cumulatively this is a worse first impression than any single bug in the cluster — worth treating as a single P1 hardening task for the typo suggester rather than three separate P2 polish fixes.
3. **Silent-failure epic #885 still unassigned ~9h after Orc filed it** (same as R135). Dev-Sirius idle 53 days; restructured ship gate (Python-only, no runner) is the unblocking path for v0.3.2. If no movement in next 12-24h, escalate to Ace.

## Environment
- Windows 11 Pro 10.0.26200
- naturo 0.3.1 (HEAD `70e6591`)
- Runner: NATUROBOT, NO_DESKTOP_SESSION (SSH/service session, no interactive desktop)
