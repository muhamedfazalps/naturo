# QA Status
Last updated: 2026-05-28 21:08
Current round: 141
Current milestone: v0.3.2 (27 open, ship-gated by epic #885 + 5 SendInput-blocked status:done from console session)

## This Round
- CI Desktop Tests: skipped (no source changes since `2e7761a` — only QA-report `[skip ci]` commit R140 `b7b90ed` in interval). Reconciling `.last-ci-sha` to `b7b90ed` on commit.
- Persona: Accessibility User (hour 21 mod 8 = 5)
- Session: NO_DESKTOP_SESSION (ROBOT-COMPILE / Naturobot user, SSH session — no interactive desktop bind)
- Issues verified: none (5 status:done all SendInput-blocked from this session — no state change since R140, no fresh comments per Orc-Mycelium "piling on has diminishing value" escalation)
- E2E tests: skipped (no desktop)
- Regression: **9/9 testable-from-NO_DESKTOP TCs re-confirmed FAIL on HEAD `b7b90ed`** (TC-0054, 0055, 0062, 0065, 0067, 0071, 0076, 0079, 0080)
- Phase 4 (Accessibility User): probed naturo's accessibility surface from source schema + CLI help text since no desktop available. Found **structural schema gap**: `UIElement` exposes only `role + title + label + value + description + identifier + frame + isActionable + keyboardShortcut` — zero references anywhere in `naturo/` or `core/` to `IsKeyboardFocusable`, `HasKeyboardFocus`, `HelpText`, `IsEnabled`, `IsOffscreen`, or `LocalizedControlType`. `find` has no `--focusable`/`--enabled`/`--visible` filters. `press --on` / `type --on` require mouse-click-to-focus even though `focus_element_uia` (`_input.py:601`) calls `IUIAutomationElement::SetFocus()` directly and is reachable from Python — no CLI surface exposes it. Distinct from #886 (existing field never populated) — this is the schema-coverage angle the R128 report flagged but never filed.
- New issues created: **#896** (P2 v0.3.4 — `see` snapshot schema missing 6 UIA accessibility properties).
- Comments added: none (per Orc-Mycelium escalation: no fresh pile-on comments on #863 / status:done; new finding goes straight to a fresh issue).
- New test cases created: **TC-0082** (exploratory/see-schema-missing-accessibility-props, source #896).
- Test cases updated: none (R140 already set `last_run: 2026-05-28` and `consecutive_passes: 0` for the 8 re-run TCs; TC-0055 also at same state).
- Test cases cleaned up: none.
- Total active test cases: **61** (+1).
- Tests run: 9 regression re-verifications + ~12 read-only accessibility surface probes (schema grep, help-text inspection, focus-path tracing) + 1 new TC drafted + 1 new issue filed.

## Top 3 Risks
1. **Accessibility surface is structurally thin.** R141 confirms naturo's accessibility story is just `role + title + isActionable + keyboardShortcut(null)`. Six UIA accessibility properties — `IsKeyboardFocusable`, `HasKeyboardFocus`, `HelpText`, `IsEnabled`, `IsOffscreen`, `LocalizedControlType` — are absent from schema, never queried in core, and not filterable in `naturo find`. Combined with #886's null-shortcut bug, naturo cannot today serve the "AI agent driving a keyboard-only workflow on a non-English Windows" use case the README implies. #896 makes this concrete; absent action it remains a competitive-parity gap vs pywinauto (which exposes `UIA_*` properties verbatim via `comtypes`).
2. **#885 epic still unstaffed for 53+ days.** R141 adds another finding (#896) in the contract/coverage cluster. The cluster now spans 14 filed P2/P1 bugs against the `-j`/snapshot surface (#864–#884 + #886 + #895 + #896); #896 is the first that's a *schema-coverage* gap rather than a behaviour gap. Until a centralized snapshot-schema contract lands, additional persona rounds will keep finding adjacent omissions.
3. **5 SendInput-blocked `status:done` unverified ~29h** after restructured ship gate. R141 made no progress here — only Ace's console-session run or a #863 wrapper can move this. v0.3.2 ship gate cannot close.

## Environment
- Windows 11 Pro 10.0.26200.8457
- naturo 0.3.1 (HEAD `b7b90ed`)
- Runner: ROBOT-COMPILE (Naturobot user), NO_DESKTOP_SESSION
