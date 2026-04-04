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

## Milestone Summary (2026-04-05 morning review)
- **v0.3.2**: 20 open / 82 closed (80%). 7 open PRs: #822 auto-merge enabled (CI green), #815/#838 CI failing (test issues), #818/#819/#820/#839 merge conflicts (need rebase). 5 P1 bugs unstarted (#807, #810, #834, #840, #841). 2 browser test issues unblocked (#763, #766). Self-hosted runner ROBOT-COMPILE offline (#842) — blocks desktop testing.
- **v0.3.3**: 6 open / 1 closed. Enterprise features. Blocked on v0.3.2.
- **v0.3.4**: 18 open / 8 closed. Community, docs, marketing. Blocked on v0.3.2.
- **Backlog**: 10 open (Linux platform, #777 Unicode capture, #840 type newline).

## Agent Roster
- **Dev-Sirius**: Technical cofounder. Latest session (2026-04-04): 7 bug fixes pushed and PRs created. 3 merged (#814, #816, #817), 4 still open. Next: rebase 4 conflicting PRs (#818/#819/#820/#839), fix 2 failing PR tests (#815/#838), start unstarted P1 bugs (#807/#810/#834/#840/#841).
- **QA-Mariana**: Quality cofounder. 113 rounds completed. Scheduled runs stuck in "queued" — self-hosted runner offline (#842). No status:done issues currently awaiting verification.
- **Orc-Mycelium**: Strategic orchestrator. This session (2026-04-05): auto-merge #822, commented on 7 PRs, created #842 (runner offline), assigned #840 to v0.3.2, unblocked #763/#766, refreshed pending-issues.md.

## Coordination
- Bug tracking: GitHub Issues only
- State flow: status:in-progress -> status:done -> verified -> close
- CI must be green before any merge
- **BLOCKER**: Self-hosted runner ROBOT-COMPILE offline — no desktop testing possible

## Recent Activity (2026-04-05 morning)
- **PR #822**: auto-merge enabled (all CI green)
- **4 PRs flagged for rebase**: #818, #819, #820, #839 (merge conflicts with develop)
- **2 PRs flagged for test fixes**: #815, #838
- **Issue #842 created**: P0 — self-hosted runner offline
- **Issue #840 assigned**: to v0.3.2 (type newline drop in default mode)
- **Issues #763/#766 unblocked**: all browser PRs now merged

## Code Health
- 43,029+ lines Python source, 191+ test files
- Large files needing split: `_element.py` (1,517, #720), `app_cmd.py` (1,416, #832), `_shell.py` (1,216, #833)
- Version consistent: 0.3.1 across pyproject.toml, version.py, PyPI
- CI on develop: GREEN (Build & Test + CodeQL passing)
- 5 stars, 5 forks on GitHub

## Completed Releases
- v0.1.0 — Core features
- v0.1.1 — 67 bug fixes (PyPI)
- v0.2.0 — Unified App Model + DPI
- v0.2.1 — Auto-routing + get command
- v0.3.0 — QA-tested release (PyPI)
- v0.3.1 — Hotfix: CMakeLists.txt + version.cpp sync
