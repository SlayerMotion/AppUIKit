# AppUIKit

The cross-framework namespace layer for SlayerMotion's imperative (AppKit + UIKit) UI code.

AppUIKit is **not** a UI framework. It is a thin abstraction: one set of `NSUI*` type aliases plus a few
semantic helpers, so a single source file can target macOS and iOS without an `#if` at every type reference.
The actual reusable controls live in **AppUIControls**, which depends on this package.

## What it provides

- `NSUI*` type aliases for the common view, control, container, image, color, font, event, and gesture types
  (`NSUIView`, `NSUIColor`, `NSUIFont`, `NSUIPanGestureRecognizer`, …). Resolves to the AppKit type on macOS
  and the UIKit type on iOS.
- `AppUIKit.currentCGContext()` — the current Core Graphics context inside a view's `draw(_:)`, the one place
  the two frameworks differ.
- `AppUIKit.Colors` — semantic colors (`label`, `secondaryLabel`, `tertiaryLabel`, `separator`, `background`,
  `contentBackground`, `accent`).
- `AppUIKit.Fonts` — a monospaced-digit font helper for numeric readouts.
- `isAppKit` / `isUIKit` platform flags.

`import AppUIKit` also re-exports the platform UI framework, so consumers usually do not need to import AppKit
or UIKit directly.

## Installation

```swift
.package(url: "https://github.com/SlayerMotion/AppUIKit.git", branch: "main"),
```

```swift
.target(name: "YourTarget", dependencies: ["AppUIKit"])
```

## Platforms

| Platform | Minimum |
|---|---|
| macOS | 14 |
| iOS | 17 |

## Rules

This package follows the canonical Swift rules in
[`rules-swift`](https://github.com/mihaelamj/rules-swift); see `CLAUDE.md`. Formatting, linting, and
commit hygiene are enforced by `.githooks/` (install per clone with `git config core.hooksPath .githooks`).

## Changelog

See [CHANGELOG.md](CHANGELOG.md).
