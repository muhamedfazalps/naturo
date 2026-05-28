# QA Status
Last updated: 2026-05-28 13:00
Current round: 133
Current milestone: v0.3.2 (27 open, ship-gated by epic #885 + 5 SendInput-blocked status:done from console session)

## This Round
- CI Desktop Tests: skipped (`.last-ci-sha=2d15274` vs `HEAD=ae3c21f`; only commits since are R131/R132 reports + orc daily review — all `[skip ci]` with no source/test changes)
- Persona: Accessibility User (hour 13 mod 8 = 5)
- Session: NO_DESKTOP_SESSION (agent shell cannot bind to interactive desktop — same as R132)
- Issues verified: none (5 status:done still SendInput-blocked; #863 ship-gate restructured by Orc earlier today — verification routes through console session, not this shell)
- E2E tests: skipped (no desktop)
- Regression: 10 contract-level test cases re-run — 1 pass (TC-0042 bumped to **5**, retention rule N/A since source_issue is null), 9 fail (#864/#869/#871/#874/#875/#876/#877/#878/#880; all stay at 0). Desktop cases skipped.
- Phase 4 (Accessibility User): audited the accessibility surface of `naturo see` snapshots. Found that the schema exposes `keyboardShortcut` but UIA backend (default) **never populates it** — 87,196 elements across 2,835 historical snapshots, 0 populated. Read-only source dive confirmed: `core/src/element.cpp` has no `AcceleratorKey`/`AccessKey` queries; MSAA/IA2 backends do (line 246/401); Python `_element.py:1124` docstring promises post-processing fill that doesn't actually exist in code.
- Test cases updated: TC-0042 (consecutive_passes 4 → 5, notes refreshed)
- New test cases created: TC-0072 `keyboard-shortcut-always-null.yaml`
- Test cases cleaned up: none
- New issues created: **#886** (P1, v0.3.4, bug,P1,from:qa — `keyboardShortcut` field always null for UIA-backed elements)
- Comments added: none
- Total active test cases: 51 (+1)
- Tests run: 10 contract-surface probes + snapshot-corpus audit (2,835 dirs, 87,196 elements) + read-only source audit of `core/src/element.cpp` and `_element.py` accessibility path

## Top 3 Risks
1. **#886 widens the silent-failure surface adjacent to epic #885.** Same symptom class — output looks success-shaped, value silently absent — but a different mechanism (UIA backend never queries the property vs NO_DESKTOP_SESSION guard inconsistency). Worth orc considering whether to fold #886 into #885's scope or leave as a separate v0.3.4 item. Accessibility metadata gap is real, affects every AI agent using keyboard-only automation.
2. **#863 ship-gate ownership still unassigned (day 21).** R132's note holds — 5 SendInput-blocked status:done issues need console-session verification, and today's session was the same broader desktop-loss state. Orc escalated to Ace 7h ago; awaiting decision.
3. **UIA accessibility surface beyond `keyboardShortcut`.** Snapshot schema is also missing `isKeyboardFocusable`, `isFocused`, `tabIndex`, `localizedControlType`, `helpText` — all UIA-queryable. Not file-worthy individually until there's a dedicated accessibility-feature scope; flagged for future planning.
