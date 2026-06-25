# AppUIKit

The cross-framework namespace layer for SlayerMotion's imperative (AppKit + UIKit) UI code.

AppUIKit is **not** a UI framework. It is a thin abstraction: one set of `AppUI*` type aliases plus a few
semantic helpers, so a single source file can target macOS and iOS without an `#if` at every type reference.
The actual reusable controls live in **AppUIControls**, which depends on this package.

## What it provides

- The **full** `AppUI*` type-alias set, at parity with NativeKit: views, windows, view controllers, the
  control and gesture families, containers, tables/outlines/collections, images, color, font, bezier path,
  alerts, menus, toolbars, drag and drop, navigation, pasteboard, appearance/trait, attributed strings, and
  the delegate/data-source protocols (`AppUIView`, `AppUIViewController`, `AppUIColor`, `AppUIFont`,
  `AppUIPanGestureRecognizer`, …). Each resolves to the AppKit type on macOS and the UIKit type on iOS.
- `AppUIKit.currentCGContext()` (and the free `AppUIGraphicsGetCurrentContext()`): the current Core Graphics
  context inside a view's `draw(_:)`, the one place the two frameworks differ.
- `AppUIKit.Colors`: semantic colors (backgrounds, separators, labels, fills, plus `contentBackground` and
  `accent`).
- `AppUIKit.Fonts`: `monospaced`, `monospacedPreferred`, and `monospacedDigit`.
- `AppUIKit.ViewFactory`: constructors for labels, buttons, icon/pill buttons, separators, cards, scroll
  views, stacks, and image views (with `StackAxis` / `StackAlignment`).
- `AppUIKit.Pasteboard`, `AppUIKit.VisualEffects`, `AppUIKit.LayoutDirection`, `AppUIKit.TooltipHelper`,
  `AppUIKit.KeyboardShortcuts`, and `appui*` view/color convenience extensions.
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
