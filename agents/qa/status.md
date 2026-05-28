# QA Status
Last updated: 2026-05-28 17:13
Current round: 137
Current milestone: v0.3.2 (29 open, ship-gated by epic #885 + 5 SendInput-blocked status:done from console session)

## This Round
- CI Desktop Tests: skipped (no new commits since `70e6591` — R136 ran the suite, all desktop/integration/e2e legitimately SKIPPED via NO_DESKTOP_SESSION fixture guard). `.last-ci-sha` reconciled to `70e6591`.
- Persona: AI Agent Builder (hour 17 mod 8 = 1)
- Session: NO_DESKTOP_SESSION (agent shell, no interactive desktop)
- Issues verified: none (5 status:done all SendInput-blocked from this session)
- E2E tests: skipped (no desktop)
- Regression: TC-0010 partial (handshake+tools/list pass, type_text NO_DESKTOP); TC-0051/0056/0062/0068/0069/0070 FAIL — all MCP bug clusters still reproduce on `70e6591`. notes updated with R137 evidence.
- Phase 4 (AI Agent Builder): drove `naturo mcp start` end-to-end with a 32-msg JSON-RPC batch (`initialize` + `notifications/initialized` + `tools/list` + 29 `tools/call`). All 42 responses parsed cleanly; 0 stderr bytes. Surfaced 2 new MCP-layer bugs + 2 scope-extensions.
- New issues created: **#890** (P1 v0.3.4 — MCP `list_snapshots` 100% failure, signature mismatch in wrapper), **#891** (P2 v0.3.4 — MCP silent-drop of unknown args / typo → defaults)
- Comments added: **#881** (NaturoCoreError leak across 8 MCP tools; `press_key`/`hotkey` additionally leak Python `repr()` of args), **#885** (silent-failure cluster MCP surface map — adds `list_apps`/`list_monitors`/`app_inspect` to the bypass family; strikes clipboard family as false alarm)
- New test cases created: **TC-0077** (mcp-list-snapshots-broken regression, source #890), **TC-0078** (mcp-unknown-arg-silent-drop exploratory, source #891)
- Test cases updated: TC-0056, TC-0062, TC-0068, TC-0070 (R137 notes appended with confirmation evidence)
- Test cases cleaned up: none
- Total active test cases: **57** (+2)
- Tests run: 32 MCP JSON-RPC messages × 29 tools/call probes + ~12 CLI side-checks + 7 regression TCs

## Top 3 Risks
1. **MCP error-surface is the agent product's weakest layer.** Three systemic bug families visible to a first-touch agent author within ~10 tool calls: silent-success in NO_DESKTOP (#883/#885), exception class names leaking in `error.message` (#881/#890), unknown-arg silent drops (#891). Cumulatively worse than the CLI surface today. naturo's README leads with "AI Agent Ready" — the MCP layer needs a hardening pass before any agent-targeted demo.
2. **`list_snapshots` end-to-end break (#890) was caught only by exploratory probing.** Wrapper-vs-manager signature mismatch in `naturo/mcp/_snapshot.py:165` vs `naturo/snapshot.py:632`. No CI test exists for MCP tool wrappers calling the manager API — entire `naturo/mcp/_*.py` surface should be covered by smoke import + smoke-call tests. Second time in two months a Python-only refactor broke an interface (cf. #870).
3. **The 5 SendInput-blocked status:done remain unverified ~24h after restructured ship gate.** Console-session QA invocation still not driven by anyone. Without that, v0.3.2 ships blocked even after #885 closes. Escalate to Ace if no movement in next 12-24h.

## Environment
- Windows 11 Pro 10.0.26200
- naturo 0.3.1 (HEAD `70e6591`)
- Runner: NATUROBOT, NO_DESKTOP_SESSION (SSH/service session, no interactive desktop)
