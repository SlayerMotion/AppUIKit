//  AppUIKit.swift
//  AppUIKit
//
//  The cross-framework namespace layer for SlayerMotion's imperative (AppKit + UIKit) UI code. It vends
//  one set of `NSUI*` type aliases plus a small platform-detection and graphics-context helper, so a single
//  source file can target macOS and iOS without `#if` noise at every type reference. It is deliberately a
//  thin abstraction, names and a few helpers, not a UI framework; the actual reusable controls live in the
//  AppUIControls package, which depends on this one.

import Foundation

// Re-export the platform UI framework so a consumer only needs `import AppUIKit` to reach NSView/UIView and
// the rest. `@_exported` makes those types visible to any file that imports AppUIKit.
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    @_exported import AppKit
#elseif canImport(UIKit)
    @_exported import UIKit
#endif

/// The root namespace for AppUIKit. Holds the package version and the platform helpers; the cross-framework
/// type aliases are vended at the top level (e.g. `NSUIView`) so call sites read like ordinary type names.
public enum AppUIKit {
    /// The package version.
    public static let version = "0.1.0"

    /// The current Core Graphics context inside a view's `draw(_:)`, the one place AppKit and UIKit differ in
    /// how the context is reached. A control's drawing code calls this once and then draws identically on
    /// both platforms.
    public static func currentCGContext() -> CGContext? {
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            return NSGraphicsContext.current?.cgContext
        #elseif canImport(UIKit)
            return UIGraphicsGetCurrentContext()
        #else
            return nil
        #endif
    }
}

// MARK: - Platform flags

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    /// True when compiled against AppKit (macOS).
    public let isAppKit = true
    /// True when compiled against UIKit (iOS / iPadOS).
    public let isUIKit = false
#elseif canImport(UIKit)
    public let isAppKit = false
    public let isUIKit = true
#endif

// MARK: - Type aliases (NSUI*)

#if canImport(AppKit) && !targetEnvironment(macCatalyst)

    // Views and view controllers.
    public typealias NSUIView = NSView
    public typealias NSUIViewController = NSViewController
    public typealias NSUIResponder = NSResponder

    // Controls.
    public typealias NSUIControl = NSControl
    public typealias NSUIButton = NSButton
    public typealias NSUILabel = NSTextField
    public typealias NSUITextField = NSTextField
    public typealias NSUISlider = NSSlider
    public typealias NSUISegmentedControl = NSSegmentedControl

    // Containers.
    public typealias NSUIStackView = NSStackView
    public typealias NSUIScrollView = NSScrollView

    // Images and graphics.
    public typealias NSUIImage = NSImage
    public typealias NSUIImageView = NSImageView
    public typealias NSUIColor = NSColor
    public typealias NSUIFont = NSFont
    public typealias NSUIBezierPath = NSBezierPath

    // Events and gestures.
    public typealias NSUIEvent = NSEvent
    public typealias NSUIGestureRecognizer = NSGestureRecognizer
    public typealias NSUIPanGestureRecognizer = NSPanGestureRecognizer

#elseif canImport(UIKit)

    // Views and view controllers.
    public typealias NSUIView = UIView
    public typealias NSUIViewController = UIViewController
    public typealias NSUIResponder = UIResponder

    // Controls.
    public typealias NSUIControl = UIControl
    public typealias NSUIButton = UIButton
    public typealias NSUILabel = UILabel
    public typealias NSUITextField = UITextField
    public typealias NSUISlider = UISlider
    public typealias NSUISegmentedControl = UISegmentedControl

    // Containers.
    public typealias NSUIStackView = UIStackView
    public typealias NSUIScrollView = UIScrollView

    // Images and graphics.
    public typealias NSUIImage = UIImage
    public typealias NSUIImageView = UIImageView
    public typealias NSUIColor = UIColor
    public typealias NSUIFont = UIFont
    public typealias NSUIBezierPath = UIBezierPath

    // Events and gestures.
    public typealias NSUIEvent = UIEvent
    public typealias NSUIGestureRecognizer = UIGestureRecognizer
    public typealias NSUIPanGestureRecognizer = UIPanGestureRecognizer

#endif
