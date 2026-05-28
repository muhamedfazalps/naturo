# QA Status
Last updated: 2026-05-28 09:00
Current round: 129
Current milestone: v0.3.2 (21 open, ship-gated by #863)

## This Round
- CI Desktop Tests: skipped (no new code since e7615ce — only QA reports/YAMLs changed)
- Persona: AI Agent Builder (hour 09 mod 8 = 1)
- Session: NO_DESKTOP_SESSION (CLI desktop ops blocked; MCP partially passes through to UIA)
- Issues verified: none (all 5 status:done still blocked by #863; unit tests 92/92 pass)
- E2E tests: skipped (no desktop)
- Regression: 13 contract-only test cases re-run — all confirm bug still present; desktop test cases skipped
- MCP end-to-end probe: 14 tool calls covering happy path + 5 failure modes; surfaced 2 new contract bugs (#881, #882) plus scope expansion of #878
- New test cases created: TC-0068 (mcp-error-code-naturocore-leak, #881), TC-0069 (mcp-iserror-flag-inconsistent, #882)
- Test cases cleaned up: none
- New issues created: #881 (P1, v0.3.4), #882 (P2, v0.3.4)
- Scope-expansion comments: #878 (app find/inspect/focus/maximize/minimize/close + MCP list_windows/see_ui_tree/focus_window/app_inspect)
- Total active test cases: ~38
- Tests run: 92 unit tests + 13 contract regressions + 14 MCP JSON-RPC probes

## Top 3 Risks
1. **Contract drift on -j / MCP surface is widening** — 18 open envelope/error-code/exit-code bugs now (#844, #864–882). Three rounds in a row each added 2–3 new ones. Needs a single contract-test harness before v0.3.4.
2. **#863 ship-gate unmoved** — 21+ days since workaround identified. MCP `see_ui_tree` works in this session even when CLI `see` doesn't — worth investigating as a partial verification path for the 5 blocked status:done items.
3. **NO_DESKTOP_SESSION silent-failure cluster** — #868 (MCP capture_screen black PNG), #875 (dialog/taskbar/tray success:true []), #878+scope (app windows/find/inspect/focus). All fixable with one `require_interactive_desktop()` precondition at the resolver layer.
