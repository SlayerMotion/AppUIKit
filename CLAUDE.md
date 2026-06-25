# AppUIKit: session rules loader

This repository follows the canonical Swift rules in **`rules-swift`** (the public canon, local at
`/Volumes/T74/DeveloperExt/public/rules-swift`). Load them at the start of every session and again after
any context compaction. They are not optional and they are not background.

## Load these now, in order

1. **The `rules-swift` core spine** under `core/` (the cross-cutting engineering discipline:
   `no-shortcuts-first-principles.md`, `verification.md`, `testing-discipline.md`, `commits.md`,
   `git-discipline.md`, `file-naming.md`, `folder-grouping.md`).
2. **The `rules-swift` Swift rules**: `CONVENTIONS.md` for the overview, then by topic, especially
   `formatting-and-linting.md`, `namespacing.md`, `package-structure.md`, `testing.md`,
   `framework-policy.md`, and `cross-platform.md` (this package is AppKit + UIKit, so cross-platform
   applies directly).
3. The shared workspace rules per the per-machine table in the global `~/.claude/CLAUDE.md`.

## What this package is

AppUIKit is the cross-framework **namespace** layer for SlayerMotion's imperative (AppKit + UIKit) UI
code: `NSUI*` aliases plus a few semantic color/font/context helpers. It is not a UI framework. The
reusable controls live in the sibling **AppUIControls**, which depends on this package.

## How the rules are enforced (mechanical, not memory)

- **Formatting and linting:** `swiftformat --lint . --config .swiftformat` and
  `swiftlint --config .swiftlint.yml --strict`, run by the pre-commit hook in `.githooks/`.
- **Commit hygiene:** a commit-msg hook (no tool attribution, no em dashes).
- **Install the hooks per clone** (hooks are not cloned): `git config core.hooksPath .githooks`.
