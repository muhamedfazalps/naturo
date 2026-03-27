# Dev Status
Last updated: 2026-03-27T12:42Z
Session: Fix 4 issues — IME type failure, Chinese app matching, CI markers, PyPI duplicate

## This Session
- Issue #425 (P0) — PR #433 created: Suspend IME during SendInput + paste fallback for Chinese/CJK IME
- Issue #430 (P1) — PR #434 created: Window title fallback in routing for Chinese app names
- Issue #410 (P1) — PR #435 created: Consistent test marker filtering on Ubuntu/macOS CI
- Issue #408 (P1) — PR #436 created: Remove duplicate PyPI publish from build.yml
- PR #429 (from last session): CI green, no review comments, mergeable_state=blocked (needs approval)
- Tests: 28 passed (routing + type tests), 8 skipped (Windows-only)
- PRs: #433, #434, #435, #436 created with auto-merge enabled

## Current State
- Earliest open milestone: v0.3.1
- CI: green (all PRs passing)
- Open PRs by me: #429, #433, #434, #435, #436
- Remaining P0: #367 (hybrid tree — large feature), #21 (Naturobot engine — large)
- Remaining P1: #427 (CI flaky test), #409 (code coverage), #420 (docs), #413 (comparison table), #361 (stable ID), #312 (hybrid mode)

## Next Session Should
- Check if PRs #429, #433-#436 have review feedback — address immediately
- If merged, tackle #427 (P1: CI flaky test — test_multi_window_list_all)
- Then #409 (P1: add code coverage reporting)
- If time permits, #420 (docs: README Linux/macOS status) or #413 (comparison table)
