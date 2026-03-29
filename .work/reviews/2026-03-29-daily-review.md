# Daily Review — 2026-03-29

## Summary
- 15 PRs merged in 24h — massive bug-fix sprint on UWP/AFH resolution, Chinese locale, and CI stability
- No active work in pipeline (zero in-progress or done issues) — agents need new assignments
- v0.3.2 at 84% but remaining 4 issues are all unstarted large features — needs scoping decision

## Milestone Progress
| Milestone | Open | Closed | Health |
|-----------|------|--------|--------|
| v0.3.2    | 4 (+2 new) | 21 | at-risk — remaining issues are large features, none started |
| v0.3.4    | 18   | 7      | on-track — launch tasks, blocked by v0.3.2 completion |

## Merged PRs (last 24h)
- #579 MCP launch_app returns PID and process info
- #578 Notepad UIA detection — Chinese locale + process name fallback
- #577 Notepad lifecycle test — Chinese locale + broader xfail
- #576 --app-id resolves to hwnd+pid only
- #574 UWP --app matching probes AFH child process name
- #572 Remove redundant skipif(CI) + increase Notepad poll timeout
- #566 Error when --app not found instead of silent vision fallback
- #564 Bypass UIA SetValue for text containing newlines
- #562 Poll for Notepad window in E2E tests
- #561 _resolve_hwnds AFH fixup searches all windows
- #558 Add --pid flag to capture command
- #557 Interpret escape sequences in type command
- #554 Remove dead java/sap CLI stubs
- #552 Mark Excel COM as shipped in ROADMAP.md
- #550 Auto-generate CLI reference from Click definitions

## Closed Issues (last 24h)
#575, #570, #571, #573, #569, #567, #565, #563, #560, #559, #556, #555, #553, #551, #414

## Open PR
- #568 (external contributor @Adraca) — README Linux/macOS clarification. Targets already-closed #420. Changes would regress macOS documentation. Commented with review feedback.

## Actions Taken
- Created issue #580: v0.3.2 milestone scope assessment — remaining 4 issues are large unstarted features, pipeline is empty
- Created issue #581: QA desktop CI verification after 15-PR sprint — regression risk from concentrated UWP/AFH changes
- Commented on PR #568: pointed out that #420 is already closed, macOS Peekaboo support exists, test file placement issues

## Top 3 Priorities (next 24h)
1. **Decide v0.3.2 scope** (#580) — keep or defer the 4 remaining features so agents have clear direction
2. **Full desktop CI verification** (#581) — 15 PRs touching window resolution in one day needs a clean pass
3. **Dev-Sirius picks up next feature** — once scope is decided, start on the highest-value v0.3.2 item (likely #168 clipboard)

## Risks
- **Regression risk**: 15 PRs merged in 24h, many touching the same UWP/AFH code paths. Combined interaction untested. Mitigation: #581 desktop CI run.
- **Priority drift**: All recent work was reactive (QA-found bugs). No forward feature progress on v0.3.2 for 2+ days. Mitigation: #580 scope decision.
- **Community PR**: #568 from external contributor needs resolution — either guide to rework or close. Leaving it open with no decision harms contributor experience.
