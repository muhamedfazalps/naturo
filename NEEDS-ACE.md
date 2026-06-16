# NEEDS-ACE — Human-Decision Queue

> The autonomous naturo loop (Dev / QA / Orch) runs unattended and self-closes everything it can.
> This file is the short list of things **only Ace can decide**. Refreshed by the Orchestrator each
> review cycle. Read this first on a check-in. Each item also has a GitHub issue labelled `needs:ace`.

_Last refreshed: 2026-06-17 02:24 (Orc autonomous cycle — **ship-gate one QA-check from ready**. The last
remaining v0.3.2 ship-gate bug **#843** (capture omits same-PID popup menu) had its **Dev fix MERGED** this
cycle: PR **#948** (`fix/issue-843-zorder-composite` → `73d7d32`, Z-order-aware compositing of
`capture --app/--pid`) landed at 17:32Z; branch deleted. Orc did the **post-merge handoff: flipped #843
`status:in-progress` → `status:done`** with a QA verification comment. **#843 is now the sole `status:done`
item and the last ship-gate blocker — once QA verifies it, req (2) is fully met and cutting v0.3.2 (#914) is
your call.** No open PRs; `status:in-progress` empty; `develop` CI **GREEN** (Build & Test + CodeQL on
`73d7d32`). #862 (PR #947 macos split) confirmed already **verified+closed** by QA. Live needs:ace queue
**#935/#915/#914/#860/#842** unchanged; **#863** already de-labeled (now QA-owned `from:qa`, awaiting QA
close); **#915** still recommended for closure (durability proven across a day+ of clean rounds incl. live
input). Weekly competitiveness step not due (<7d since 06-16 baseline)._

## Open decisions
| # | Decision | Why it's yours | Orc recommendation |
|---|----------|----------------|--------------------|
| [#914](https://github.com/AcePeak/naturo/issues/914) | **v0.3.2 ship-gate sign-off** | release / tag to `main` = PyPI publish | **One QA-check from ready.** Req (1) (epic #885) verified+closed; of the 5 status:done bugs, **4 verified+closed** (#786/#788/#807/#840 — 01:15Z). The 5th, **#843**, now has its **fix merged** (PR #948, `73d7d32`) and sits `status:done` awaiting QA. **When QA verifies #843, cutting v0.3.2 is your call.** |
| [#935](https://github.com/AcePeak/naturo/issues/935) | Two Dev cycles ran **concurrently in the shared `naturo-dev` worktree** — the 2nd cycle's Step 0 `reset --hard` wiped the 1st's in-flight uncommitted branch (#910). **Rule 4 violation at the orchestration layer.** | orchestration / scheduling policy (runner.ps1 / cron / lock) | Add a **per-worktree lock** in `naturo-loop-locks\` that a starting `runner:dev` must acquire (skip the round if held), and/or serialize dev so two cycles never share one tree. Self-fixing is unsafe — concurrent git ops would corrupt the peer cycle. |
| [#842](https://github.com/AcePeak/naturo/issues/842) / [#860](https://github.com/AcePeak/naturo/issues/860) | Desktop CI: self-hosted runner ROBOT-COMPILE offline (#842) vs fund a cloud Windows VM (#860) | infra spend | Decide: revive the runner, fund a cloud Windows VM, or accept GitHub-hosted-only CI. (No longer needed for input verification — see #863 below — but still the only path to desktop-marked CI jobs.) |

## Recommended for closure (Orc cannot close needs:ace/QA items unattended — your confirm)
| # | What changed | Orc recommendation |
|---|--------------|--------------------|
| [#915](https://github.com/AcePeak/naturo/issues/915) | "QA loop down ~5 days / 403". **Fully recovered.** QA has run **many** clean rounds since the proxy auto-detect fix (`2ccbcf0`) — 16:43/17:42/18:50/20:45/21:40/22:40 on 06-16, then 00:45Z and a full **real-input ship-gate verification round at 01:15Z** that closed 4 P0/P1 bugs. The 403 era is over. | **Close #915.** Durability is demonstrated across a day+ of rounds incl. live input. |
| [#863](https://github.com/AcePeak/naturo/issues/863) | "SendInput blocked in agent session — runtime verification impossible." **Premise disproven.** QA's 01:15Z probe-first gate (launch throwaway notepad → `type "QA_PROBE"` → confirm window title) showed **input works on this no-RDP console** and verified all 4 input-family bugs end-to-end. Capability landed in `19a72cd`. | **QA to close #863** (it owns the `from:qa` issue). No human input-session provisioning is needed. Orc left it for QA rather than closing cross-domain. |

_Resolved earlier: **#913** (dispose community PRs #892 / #904) — closed 2026-06-16; both community PRs closed._

## Ship-gate status — v0.3.2
- (1) Epic **#885** (silent-failure cluster): **CLOSED + verified 2026-06-16** (with #868/#875/#878/#883/#893).
  **Requirement (1) MET.**
- (2) QA-verify the 5 `status:done` bugs on a real desktop: **#786, #788, #807, #840** → **VERIFIED + CLOSED
  2026-06-17 01:15Z** (input confirmed working unattended via probe-first gate). **#843** → **fix MERGED**
  2026-06-17 (PR #948, `73d7d32` — Z-order-aware compositing); now `status:done` **awaiting QA verification**.
  **This is the sole remaining ship-gate item, and it's now a QA verification, not a code fix.**

## Blocks
- **#843 (P1)** — capture popup compositing: **fix merged (PR #948), awaiting QA verification.** The last
  v0.3.2 ship-gate item.
- `develop` CI: **green** (Build & Test + CodeQL success on HEAD `73d7d32`).
- Desktop CI runner **#842** offline (chronic; infra decision above).
- _Cleared this cycle:_ **#863** (input verification — proven possible) and **#915** (QA auth — recovered)
  are no longer blocks; both recommended for closure above.
- _Related (not a human decision):_ [#917](https://github.com/AcePeak/naturo/issues/917) (P1,
  `silent-failure`) — `runner.ps1` still has no failure-streak watchdog. Code-only for Dev.

---
_How this works: anything irreversible or human-only is queued here instead of acted on. Everything else
the loop does itself — opens PRs, merges green ones to develop, verifies on the real desktop, closes issues,
files new work. See `agents/local/README.md`._
