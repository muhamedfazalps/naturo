# QA Status
Last updated: 2026-05-29 03:13 UTC
Current round: 147
Current milestone: v0.3.2 (29 open / 89 closed; v0.3.4 = 46 open / 8 closed)

## This Round
- CI Desktop Tests: skipped (no new source commits since `17aefe6`; `e2afdcb` is QA-report-only)
- Issues verified: none — 5 `status:done` (#786/#788/#807/#840/#843) all SendInput-blocked (#863)
- E2E tests: Phase 2 desktop blocked by NO_DESKTOP_SESSION; non-desktop CLI envelope+exit-code sweep instead
- Persona: Chinese User (hour 03 mod 8 = 3)
- Regression: 12 cases re-confirmed on HEAD `e2afdcb` — TC-0046 PASS (29 consecutive), TC-0054/0061/0063/0064/0067/0074/0079/0080/0083/0084 FAIL (all extending existing open issues #866/#874/#876/#877/#880/#888/#893/#894/#897/#899)
- New test cases created: TC-0087 (`regression/selector-chinese-name-roundtrip.yaml`) — Chinese-name selector flow regression-prevention
- Test cases refined: TC-0063 (4th callsite — `selector show`), TC-0079 (Chinese-selector repro confirms drift is language-agnostic), TC-0080 (selector domain repros), TC-0046 / TC-0054 / TC-0061 / TC-0064 / TC-0067 / TC-0074 / TC-0083 / TC-0084 (R147 notes added)
- Test cases cleaned up: none
- New issues created: none — both genuine new findings are extensions to existing issues
- Issue comments: #876 (selector show as 4th envelope-drift callsite, expands fix surface to `naturo/cli/selector_cmd.py:show`), #894 (selector domain repros add `selector_cmd.py` to fix-surface area)
- Total active test cases: 66
- Tests run: ~30 CLI invocations across exit-code / envelope / Chinese-roundtrip matrices

## Top 3 Risks
1. #876 `selector show <typo> -j` returns `{"user":{}, "builtin":{}}` indistinguishable from `<valid-app-no-selectors>` — Scripter who mistypes app name gets clean exit 0 + empty body and proceeds with wrong-data assumption. Same severity class as #885 silent-failures but tracked separately under #876's P2 envelope-shape bucket. Recommend Dev-Sirius treat #876's 4 callsites (list / record list / visual list / selector show) as one PR.
2. Chinese silent-failure paths (e.g. `wait --gone '记事本'`) reach the same code paths as ASCII — confirms #885's Python-only middleware fix shape will cover both at once with no locale-specific work. Positive risk-resolution signal for the cluster.
3. 5 SendInput-blocked `status:done` (#786, #788, #807, #840, #843) remain unverified. Console-session QA pass is the only path forward; restructured ship gate cannot close without it. Day 9+ since #863 escalation to Ace.
