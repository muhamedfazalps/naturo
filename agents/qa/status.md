# QA Status
Last updated: 2026-05-28 19:11
Current round: 139
Current milestone: v0.3.2 (27 open, ship-gated by epic #885 + 5 SendInput-blocked status:done from console session)

## This Round
- CI Desktop Tests: skipped (no source changes since `ceecfd5` — only QA-report commit R138 in interval). `.last-ci-sha` will be reconciled to `16adca7` if no new commits land before commit.
- Persona: Chinese User (hour 19 mod 8 = 3)
- Session: NO_DESKTOP_SESSION (ROBOT-COMPILE / Naturobot user, SSH session — no interactive desktop bind)
- Issues verified: none (5 status:done all SendInput-blocked from this session — no state change since R138)
- E2E tests: skipped (no desktop)
- Regression: 8/8 testable-from-NO_DESKTOP TCs re-confirmed FAIL on HEAD `16adca7` (TC-0054, 0062, 0065, 0067, 0071, 0076, 0079, plus new TC-0080).
- Phase 4 (Chinese User): probed every layer where Chinese arg / Chinese path / Chinese clipboard text could leak through. CLI parsing is UTF-8-clean ✓; `INVALID_INPUT` envelope correctly carries the Chinese arg through to the message; but **every JSON emit-site re-escapes the Chinese as `\uXXXX`** — drift between `-j` and non-`-j` (the latter emits literal Chinese, e.g. `wait --gone 记事本` → `Element '记事本' disappeared`). New P2 #894 captures this; the broader pattern surfaces in clipboard get, error-echo of `--file <chinese-path>`, and `app windows -j` of live Chinese-titled windows.
- New issues created: **#894** (P2 v0.3.4 — JSON ensure_ascii escapes Chinese/emoji).
- Comments added: **#881** (MCP `capture_window` confirmed in INTERNAL_ERROR/NaturoCoreError leak bucket), **#893** (R139 reproduction with Chinese selector data point).
- New test cases created: **TC-0080** (exploratory/json-ensure-ascii-escapes-chinese, source #894).
- Test cases updated: TC-0054, TC-0062, TC-0079 (R139 notes appended).
- Test cases cleaned up: none.
- Total active test cases: **59** (+1).
- Tests run: ~30 CLI probes (T1–T32) + 1 MCP probe (T33) + 7 regression re-verifications + 1 new TC drafted.

## Top 3 Risks
1. **#885 epic still entirely on Dev-Sirius's queue (idle 53+ days).** Every QA round adds ~one new entrypoint to the silent-failure surface matrix (R138: #893 wait-family; R139: nothing new — but the existing 6 entrypoints still all FAIL). Without the centralized middleware drop-in, this matrix will keep growing as new desktop-required commands ship. v0.3.2 ship cannot start until #885 closes.
2. **#894 is a stealthy "marketing claim" regression for CJK users.** README claims "AI Agent Ready: JSON output" — but a Chinese-locale developer running `naturo clipboard get -j` immediately sees `你好` instead of `你好` in their own data. Combined with the bigger envelope drift (#864–#884), the JSON contract is uniform on paper but human-hostile in CJK locales. Fix is one parameter; should be folded into the next v0.3.4 contract-drift sweep.
3. **5 SendInput-blocked status:done unverified ~26h** after restructured ship gate. R137/R138/R139 all hit the same wall — only Ace can verify these from a console session, or #863 needs a wrapper/workaround. v0.3.2 cannot ship even with #885 closed unless someone drives the console-session QA run.

## Environment
- Windows 11 Pro 10.0.26200
- naturo 0.3.1 (HEAD `16adca7`)
- Runner: ROBOT-COMPILE (Naturobot user), NO_DESKTOP_SESSION
