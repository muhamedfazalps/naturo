# Naturo Project Status
> Auto-maintained by Orc-Mycelium. Agents: read on every startup.

## Current Version
v0.3.1 (PyPI + GitHub Release)

## Active Work
Query live data — do not rely on this section for specific issue numbers:
```bash
gh issue list --state open --limit 100 --json milestone,number,title,labels \
  --jq 'group_by(.milestone.title // "backlog") | sort_by(.[0].milestone.title // "z") |
  .[] | "\n### \(.[0].milestone.title // "Backlog")\n\(.[] | "- #\(.number) [\(.labels | map(.name) | join(","))] \(.title)")"'
```

## Milestone Summary (2026-04-01 morning)
- **v0.3.2**: 31 open / 50 closed — scope tripled since Mar 29. Now includes browser automation (#758-#766), AI model registry (#754, #767), mouse trajectories (#757), plus original UWP fixes and tech debt. 8 issues awaiting QA verification (#773). Ace needs to decide on scope split (#775).
- **v0.3.4**: 18 open / 8 closed — launch & community tasks, blocked on v0.3.2.
- **Backlog**: 63 open issues including Linux platform work, enterprise features, community tasks.
- **Pipeline**: 3 open PRs (#770 Gemini provider, #771 AI CLI params, #772 browser subcommand). 3 in-progress issues (#759 browser, #725 triage, #720 _element.py split). 8 status:done awaiting QA.

## Agent Roster
- **Dev-Sirius**: Technical cofounder. Reads: dev-prompt.md
- **QA-Mariana**: Quality cofounder. Reads: qa-prompt.md — **inactive 48+ hours, 8-issue verification backlog**
- **Orc-Mycelium**: Strategic orchestrator. Maintains this file.

## Coordination
- Bug tracking: GitHub Issues only
- State flow: status:in-progress -> status:done -> verified -> close
- CI must be green before any merge

## Recent Activity (2026-03-31 to 2026-04-01)
- **15 PRs merged** — another highly productive sprint
- Bug fixes: UWP app quit (#751), Chinese app name wrong PID (#744), UWP invisible (#753), app ID pattern (#755)
- Features: AI vision text+proximity dedup (#742), mouse trajectory primitives (#768), AI model registry (#767), AI CLI params (#769)
- Refactors: agent base class extraction (#748), return type annotations (#747), shared session utilities (#745), cascade split (#707 done earlier)
- CI: coverage threshold 70% (#741), commit author validation (#756), Notepad test polling fix (#746), dependency upper bounds (#740)
- **Browser automation pivot**: Ace created 8 issues (#758-#766) and #759 is actively in-progress with PR #772 open
- Created #773 (QA verification backlog), #774 (ROADMAP update), #775 (scope split decision)

## Completed Releases
- v0.1.0 — Core features
- v0.1.1 — 67 bug fixes (PyPI)
- v0.2.0 — Unified App Model + DPI
- v0.2.1 — Auto-routing + get command
- v0.3.0 — QA-tested release (PyPI)
- v0.3.1 — Hotfix: CMakeLists.txt + version.cpp sync
