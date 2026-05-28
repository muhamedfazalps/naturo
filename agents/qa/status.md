# QA Status
Last updated: 2026-05-28 23:00
Current round: 143
Current milestone: v0.3.2 (27 open, ship-gated by epic #885 + 5 SendInput-blocked status:done from console session)

## This Round
- CI Desktop Tests: skipped (HEAD `426477d` differs from `.last-ci-sha` `ca7a9bc`, but `git diff --stat ca7a9bc..HEAD` shows only `agents/qa/**` + `tests/qa-reports/**` paths — all `[skip ci]` R141/R142 report commits, zero source changes). Sentinel advanced to `426477d`.
- Persona: Skeptical Evaluator (hour 23 mod 8 = 7)
- Session: NO_DESKTOP_SESSION (Naturobot user, non-interactive — same constraint as R134–R142)
- Issues verified: none new (5 status:done all SendInput-blocked from this session; comment threads already comprehensive — no piling-on)
- E2E tests: skipped (no desktop)
- Regression: **8/8 testable-from-NO_DESKTOP TCs re-confirmed FAIL on HEAD `426477d`** (TC-0057 #869, TC-0061 #874, TC-0062 #875, TC-0063 #876, TC-0065 #878, TC-0067 #880, TC-0079 #893, TC-0080 #894)
- Phase 4 (Skeptical Evaluator): Cold-install side-by-side vs pywinauto and pyautogui from a standard (non-admin) Windows user account. **Concrete competitive observation**: `pip install pywinauto` succeeds but `import pywinauto` immediately fails with `PermissionError` writing to `C:\Program Files\Python312\Lib\site-packages\comtypes\gen\` (comtypes regenerates UIAutomationCore bindings on first import and needs admin). naturo's `import naturo` + `naturo --help` work cleanly. naturo also clearly wins on error-envelope quality (structured `NO_DESKTOP_SESSION` with `suggested_action` vs comtypes stack trace) and on surface breadth (record/replay, selector save/load, visual regression, MCP — none in pywinauto). **Gap that would tip an evaluator the other way**: no `naturo doctor` single-shot environment self-check — they'd have to run 6+ separate probes (session, pyvda, mcp, providers, DPI, version-vs-PyPI, log location) to answer "is naturo configured to do anything useful here?" Filed as #898 (P2 enhancement v0.3.4) with concrete output mock-up and acceptance criteria.
- New finding cross-cutting #876 (envelope drift): **`naturo visual list -j` is a third callsite** of the same envelope drift (returns `{"baselines": []}` with no top-level `success` field). Mapped all 12 `*list -j` commands: 9 wrap correctly via `success_response()`, 3 do not (record/selector/visual). Extended #876 with the full table and a third commit suggestion (`naturo/cli/visual_cmd.py:list`).
- New issues created: **#898** (P2 v0.3.4 enhancement — `naturo doctor` diagnostic command, Skeptical Evaluator framing).
- Comments added: #876 (extended scope to `visual list -j`, full envelope-conformance table).
- New test cases created: none (no new bug — #898 is enhancement; visual-list extends existing TC-0063).
- Test cases updated: **TC-0063** scope expanded to include `visual list -j`, title updated; CATALOG.md sync. R143 last_run/notes set on TC-0057, TC-0061, TC-0062, TC-0063, TC-0065, TC-0067, TC-0079, TC-0080.
- Test cases cleaned up: none.
- Total active test cases: **62** (unchanged; TC-0083 from R142 already counted).
- Tests run: 8 regression re-verifications + ~15 envelope/exit-code probes + 12-command `*list -j` success-field sweep + cross-tool import smoke (pywinauto / pyautogui) + 1 new issue filed + 1 issue scope-extended.

## Top 3 Risks
1. **Same risk as R142: exit-code + envelope contract is still un-script-able, ship-gated.** Nothing moved on the open cluster (#864–#884, #886, #889–#891, #893–#897) in the 1h between R142 and R143. The Skeptical Evaluator angle adds a new edge: an evaluator running side-by-side scripts against naturo and pywinauto will hit JSON-parse failures on `record list -j` / `selector list -j` / `visual list -j` (no `success` key — same root as #876, now confirmed across 3 callsites). For an evaluator deciding "is naturo's contract solid enough for production scripting?", the answer at HEAD `426477d` is no. All three are one PR's worth of work via the existing `success_response()` helper.
2. **`naturo doctor` gap is a soft retention killer.** Distinct from the contract-drift cluster: a first-time user or evaluator without a diagnostic command has to read source (or 6 probe commands) to answer "is my environment OK?" — and the prompt-leak in `desktop list -j` (#869) actively misleads them on the `pyvda` probe. #898 closes the gap with zero functional change — purely a UX win — and would also serve as a stable health-check endpoint for CI / agent bootstrap. Strong candidate for v0.3.4 since it touches no production hot path.
3. **Same risk as R142: 5 SendInput-blocked `status:done` unverified ~31h** after restructured ship gate; only Ace's console-session run or a #863 workaround moves this. R143 made no progress (same NO_DESKTOP session); same as R134–R142.

## Environment
- Windows 11 Pro 10.0.26200.8457
- naturo 0.3.1 (HEAD `426477d`)
- Runner: NATUROBOT (Naturobot user), NO_DESKTOP_SESSION
