# QA Status
Last updated: 2026-05-28 08:11
Current round: 128
Current milestone: v0.3.2 (21 open, ship-gated by #863)

## This Round
- CI Desktop Tests: skipped (no new code since e7615ce — only QA reports/YAMLs changed)
- Persona: First-time User (hour 08 mod 8 = 0)
- Session: NO_DESKTOP_SESSION (worse than #863 RDP scenario — no desktop binding at all)
- Issues verified: none (all 5 status:done still blocked by #863; unit tests 93/93 pass)
- E2E tests: skipped (no desktop)
- Regression: 4 contract-only test cases re-run (TC-0054/0055/0059/0061) — all confirm bug still present; desktop test cases skipped
- New test cases created: TC-0067 (typo-suggester-ignores-subgroups, #880)
- Test cases cleaned up: none
- New issues created: #880 (P2, v0.3.4) — CLI typo suggester ignores subgroups
- Scope-expansion comments: #866 (highlight/move/drag), #867 (hidden `window`), #876 (`visual list -j`)
- Total active test cases: ~36
- Tests run: 93 unit tests + ~25 contract probes

## Top 3 Risks
1. **#863 ship-gate unmoved** — no progress on console-session workaround in 21 days; this round's machine is even more constrained
2. **CLI contract drift** — 6+ inconsistencies (#864/#865/#866/#872/#874/#876) still open; missing a unified -j contract test
3. **First-time UX friction** — #880 + #867: intuitive verbs hit dead-end on first contact, retention risk
