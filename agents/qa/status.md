# QA Status
Last updated: 2026-05-27 23:09
Current round: 119
Current milestone: v0.3.2 (27 open / 82 closed, 75%)

## This Round
- Persona: Skeptical Evaluator (hour 23 % 8 = 7)
- CI Desktop Tests: skipped (no interactive desktop in QA session — same blocker as round 118; `.last-ci-sha` NOT advanced because the desktop suite did not actually run)
- Targeted unit tests for the 5 blocked status:done issues: **109 passed / 24 skipped** (code health green for #786/#788/#807/#840/#843)
- Issues verified + closed: **none** — all 5 status:done still blocked on #863 (added round 119 data point)
- E2E tests: skipped (no desktop)
- Regression (Phase 5): 2 testable cases pass — **TC-0041** (consec 29), **TC-0046** (consec 20). 1 new **TC-0054** fails (just-filed #866). All desktop-required TCs skipped.
- New issues created: **#866** (bug, P2, from:qa, v0.3.4) — input commands (type/press/click) exit 2 with `Usage:` banner on NO_DESKTOP_SESSION while read-only commands exit 1 cleanly. Root cause: `naturo/cli/interaction/_common.py:_get_backend` raises `click.UsageError` instead of `click.ClickException`.
- New test cases created: **TC-0054** (`exploratory/input-cmd-exit-code-on-no-desktop.yaml`)
- Test cases cleaned up: none
- Total active test cases: ~33 active / ~22 retired
- Tests run: 109 unit + 3 regression TCs + ~12 exit-code/JSON-envelope probes across 8 commands

## Status:done queue
- Started: 5
- Verified + closed: 0
- Rejected: 0
- Partial-verify, retained: 5 (no movement from round 118)
- **End of round**: 5 (#786, #788, #807, #840, #843) — all blocked on #863

## Top 3 Risks
1. **v0.3.2 verification stuck — #863 now persists 3 rounds.** Either run QA from console session 2 (not RDP), or accept unit-test evidence + Ace manual smoke for the 5 remaining issues. No mechanism in place to recover the desktop binding from inside the QA session itself.
2. **Self-hosted runner offline day 59 (#842)** — no Ace response since 2026-05-08. Cloud VM proposal (#860) day 20 unassigned.
3. **CLI error-contract drift (new this round, #866).** Compounds with the rolling JSON-envelope inconsistencies (#865) and `--id` non-uniformity (#864). A skeptical evaluator comparing naturo vs pywinauto would flag all three within 15 minutes. Recommend a contract-sweep PR before any v0.3.4 marketing push.
