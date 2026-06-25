//  AppUIKit.Colors.swift
//  AppUIKit
//
//  Semantic colors that name the same intent on both platforms, so imperative UI code reaches one accessor
//  instead of branching on NSColor vs UIColor at every call site. A focused subset, grown as the controls
//  and editors need more.

public extension AppUIKit {
    /// Semantic color accessors that resolve to the right `NSColor`/`UIColor` per platform.
    enum Colors {
        /// The primary label color (high-contrast text).
        public static var label: NSUIColor {
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                .labelColor
            #else
                .label
            #endif
        }

        /// The secondary label color (muted text, ticks).
        public static var secondaryLabel: NSUIColor {
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                .secondaryLabelColor
            #else
                .secondaryLabel
            #endif
        }

        /// The tertiary label color (faint marks, the dial track).
        public static var tertiaryLabel: NSUIColor {
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                .tertiaryLabelColor
            #else
                .tertiaryLabel
            #endif
        }

        /// A hairline separator color.
        public static var separator: NSUIColor {
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                .separatorColor
            #else
                .separator
            #endif
        }

        /// The window/view background.
        public static var background: NSUIColor {
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                .windowBackgroundColor
            #else
                .systemBackground
            #endif
        }

        /// The background for text/content areas (the editor stage, code panels).
        public static var contentBackground: NSUIColor {
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                .textBackgroundColor
            #else
                .secondarySystemBackground
            #endif
        }

        /// The system accent (the default tint for the rotate dial). UIKit has no first-class accent color, so
        /// it resolves to system blue there, matching AppKit's default control accent on a fresh install.
        public static var accent: NSUIColor {
            #if canImport(AppKit) && !targetEnvironment(macCatalyst)
                .controlAccentColor
            #else
                .systemBlue
            #endif
        }
    }
}
