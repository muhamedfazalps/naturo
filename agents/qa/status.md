# QA Status
Last updated: 2026-05-28 02:12
Current round: 122
Current milestone: v0.3.2 (22 open / 88 closed, 80%)

## This Round
- Persona: Enterprise RPA Dev (hour 02 % 8 = 2)
- CI Desktop Tests: skipped (desktop unavailable per #863; PRs #845-#855 source changes between `.last-ci-sha = cf3e1fd5` and HEAD `099da0d4` — CI can't run without desktop). `.last-ci-sha` NOT advanced.
- Targeted unit tests for the 5 blocked `status:done` issues: **48 passed** (stale_hwnd / newline / press_focus / capture_popup / click_uwp). Code health unchanged.
- Issues verified + closed: **none** — all 5 status:done still blocked on #863 (round 122 data point posted to #863, 6th consecutive blocked round).
- E2E tests: skipped (no desktop). RPA workflow script designed and run; stopped at step 2 (desktop probe) — see Phase 4.
- Regression (Phase 5): TC-0041 consec 32, TC-0046 consec 23, TC-0042 consec 1 (flip), TC-0049 consec 1 (flip — #834 fix landed), TC-0048 consec 5 → **retired**. TC-0054 (#866) and TC-0055 (#867) — fail (unchanged).
- New issues created: **#869** (bug, P2, from:qa, v0.3.4) — Optional-dep install prompt leaks into -j JSON output. Discovered during Enterprise RPA Dev simulation.
- Existing issues updated: **#866** scope expanded by comment (drag + highlight exhibit the same exit-2 + Usage banner).
- New test cases created: **TC-0057** (`exploratory/deps-prompt-leaks-into-json.yaml`, sources #869).
- Test cases retired: **TC-0048** (5 consecutive passes, #810 closed).
- Total active test cases: 35 active / 23 retired.
- Tests run: 48 unit + 9 regression/exploratory TCs + 1 RPA 10-step workflow + ~15 exploratory probes.

## Status:done queue
- Started: 5
- Verified + closed: 0
- Rejected: 0
- Partial-verify, retained: 5 (no movement from rounds 117/118/119/120/121/122)
- **End of round**: 5 (#786, #788, #807, #840, #843) — all blocked on #863

## Top 3 Risks
1. **NEW: #869 — JSON contract leak under optional deps.** Any caller piping `-j` output through `jq` or `python -m json.tool` hits a JSONDecodeError when an optional dep is missing, because `naturo/deps.py:_is_interactive` ignores `json_output`. Worst case: if both stdin and stdout are TTYs, the script will block on `input()` waiting for keyboard input that will never come. One-line fix, but the same bug class likely exists in any other prompt/confirm path that doesn't check `-j`.
2. **#863 — 6th consecutive blocked round, still ship-gate.** v0.3.2 cannot be released until the 5 SendInput-dependent fixes are verified. Workarounds unchanged: console session, accept unit-test + code-review evidence, or stand up cloud VM #860 (still day 22 unassigned).
3. **#866 — wider than the title.** Round 122 confirmed `drag` and `highlight` text-mode paths exhibit the same exit-2 + `Usage:` behavior. Both go through `_common._get_backend` so the fix should naturally cover them, but the issue title and repro need updating so the fix isn't scoped narrowly.
