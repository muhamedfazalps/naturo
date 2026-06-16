# NEEDS-ACE — Human-Decision Queue

> The autonomous naturo loop (Dev / QA / Orch) runs unattended and self-closes everything it can.
> This file is the short list of things **only Ace can decide**. Refreshed by the Orchestrator each
> review cycle. Read this first on a check-in. Each item also has a GitHub issue labelled `needs:ace`.

_Last refreshed: 2026-06-16 16:25 (Orc autonomous cycle)._

## Open decisions
| # | Decision | Why it's yours | Orc recommendation |
|---|----------|----------------|--------------------|
| [#915](https://github.com/AcePeak/naturo/issues/915) **(TOP)** | QA loop is **down ~5 days** — every hourly round dies on `API Error: 403 Request not allowed` and runs zero tests | credentials / auth / billing | **Fix this first.** Re-authenticate the QA scheduled task's `claude` CLI session (refresh OAuth/token; confirm the account/org still has API access; check the new proxy isn't rewriting auth). This is the real reason ship-gate verification has stalled — it outranks #842. |
| [#842](https://github.com/AcePeak/naturo/issues/842) / [#860](https://github.com/AcePeak/naturo/issues/860) | Desktop CI: self-hosted runner ROBOT-COMPILE offline (#842) vs fund a cloud Windows VM (#860) | infra spend | Decide: revive the runner, fund a cloud Windows VM, or accept GitHub-hosted-only CI. **Note:** moot until #915 is fixed — the QA loop can't authenticate at all right now, so desktop CI availability changes nothing yet. |
| [#914](https://github.com/AcePeak/naturo/issues/914) | v0.3.2 ship-gate sign-off | release / tag to `main` = PyPI publish | **Not actionable yet** — waiting on QA to verify #885 + the 5 `status:done` bugs. When all six flip to `verified`, the gate is clear and cutting v0.3.2 is your call. |
| [#913](https://github.com/AcePeak/naturo/issues/913) | Dispose of community PRs #892 / #904 | external-contributor relationship | #892 is superseded by the merged PR #911 (contributor co-credited) — close it with thanks. Hold #904 open until the team's replacement fix for #844 lands, then close the same way. |

## Ship-gate status — v0.3.2
- (1) Epic **#885** (silent-failure cluster): fix **MERGED** (PR #911, closes #868/#875/#878/#883/#893).
  Now `status:done`, awaiting QA desktop verification before the epic closes.
- (2) QA-verify 5 `status:done` bugs on a real desktop: **#786, #788, #807, #840, #843** (+ #885).
  These have sat `status:done` since **2026-05-27 (~20 days)** with no QA pickup. **Root cause now
  identified: the QA loop has been dead ~5 days (#915)** — every round since 2026-06-11 20:00 exits
  on a `403 Request not allowed` auth error and runs no tests. Verification cannot resume until #915
  is fixed.

## Blocks
- **QA loop auth #915 (TOP, NEW):** QA agent down ~5 days on a `403 Request not allowed` — zero QA
  rounds since 2026-06-11 20:00. This blocks all ship-gate verification.
- Desktop CI runner **#842** offline (chronic) — secondary to #915 while the QA agent can't auth.
- `develop` CI: **green** (no block this cycle).

---
_How this works: anything irreversible or human-only is queued here instead of acted on. Everything else
the loop does itself — opens PRs, merges green ones to develop, verifies on the real desktop, closes issues,
files new work. See `agents/local/README.md`._
