# Changelog

All notable changes to AppUIKit are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Community-health docs: `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md` (Contributor
  Covenant 2.1), and `SECURITY.md`.

## [0.1.2] - 2026-06-25

### Added

- The full NativeKit helper surface, ported and renamed to the `AppUIKit`/`NSUI*`
  scheme: `AppUIKit.ViewFactory` (label/button/icon/pill/separator/card/scroll/stack/
  image-view constructors, plus `StackAxis`/`StackAlignment`), `AppUIKit.Pasteboard`,
  `AppUIKit.VisualEffects`, `AppUIKit.LayoutDirection`, `AppUIKit.TooltipHelper`,
  `AppUIKit.KeyboardShortcuts`, and the `nsui*` view/color convenience extensions.
- `AppUIKit.Colors` expanded to the full set (backgrounds, separators, labels, fills),
  keeping `accent` and `contentBackground`. `AppUIKit.Fonts` gains `monospaced` and
  `monospacedPreferred` alongside `monospacedDigit`.

## [0.1.1] - 2026-06-25

### Added

- The **complete** `NSUI*` type-alias set, at parity with NativeKit (renamed to the
  `NSUI*` prefix): windows, panels, tables/outlines/collections, toolbars, menus,
  drag and drop, alerts, navigation, document picker, appearance/trait, tracking,
  clip view, attributed strings, the full control and gesture families, and the
  delegate/data-source protocol aliases, for both the AppKit and UIKit branches.
- `NSUIApp` (the shared application instance) and the free function
  `NSUIGraphicsGetCurrentContext()`.

## [0.1.0] - 2026-06-25

Initial release: the cross-framework namespace layer for SlayerMotion's imperative
(AppKit + UIKit) UI code.

### Added

- `NSUI*` type aliases for the common view, control, container, image, color, font,
  event, and gesture types, resolving to the AppKit type on macOS and the UIKit type
  on iOS.
- `AppUIKit.currentCGContext()` for the one place AppKit and UIKit differ inside
  `draw(_:)`.
- `AppUIKit.Colors` semantic colors (label, secondaryLabel, tertiaryLabel, separator,
  background, contentBackground, accent).
- `AppUIKit.Fonts.monospacedDigit` for numeric readouts.
- `isAppKit` / `isUIKit` platform flags, and a re-export of the platform UI framework.
- Adopted the `rules-swift` enforcement set (`.swiftformat`, `.swiftlint.yml`,
  `.githooks/`).
