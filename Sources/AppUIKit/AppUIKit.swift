//  AppUIKit.swift
//  AppUIKit
//
//  The cross-framework namespace layer for SlayerMotion's imperative (AppKit + UIKit) UI code. It vends one
//  full set of `NSUI*` type aliases plus platform-detection and graphics-context helpers, so a single source
//  file can target macOS and iOS without `#if` noise at every type reference. It is deliberately a thin
//  abstraction, names and a few helpers, not a UI framework; the reusable controls live in the AppUIControls
//  package, which depends on this one.

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
    public static let version = "0.1.2"

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

/// The current Core Graphics context, the free-function spelling (the `NSUI*` analogue of
/// `UIGraphicsGetCurrentContext`). Equivalent to `AppUIKit.currentCGContext()`.
public func NSUIGraphicsGetCurrentContext() -> CGContext? {
    AppUIKit.currentCGContext()
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

    // View types.
    public typealias NSUIView = NSView
    public typealias NSUIViewController = NSViewController
    public typealias NSUIWindow = NSWindow
    public typealias NSUIWindowController = NSWindowController
    public typealias NSUIApplication = NSApplication
    public typealias NSUIScreen = NSScreen
    public typealias NSUIResponder = NSResponder

    /// The shared application instance.
    public var NSUIApp: NSApplication {
        NSApp
    }

    // Controls.
    public typealias NSUIControl = NSControl
    public typealias NSUIButton = NSButton
    public typealias NSUILabel = NSTextField
    public typealias NSUITextField = NSTextField
    public typealias NSUITextView = NSTextView
    public typealias NSUISearchField = NSSearchField
    public typealias NSUISegmentedControl = NSSegmentedControl
    public typealias NSUISwitch = NSSwitch
    public typealias NSUISlider = NSSlider
    public typealias NSUIPopUpButton = NSPopUpButton
    public typealias NSUIColorWell = NSColorWell

    // Container views.
    public typealias NSUIScrollView = NSScrollView
    public typealias NSUIStackView = NSStackView
    public typealias NSUISplitView = NSSplitView
    public typealias NSUISplitViewController = NSSplitViewController
    public typealias NSUISplitViewItem = NSSplitViewItem
    public typealias NSUITabViewController = NSTabViewController
    public typealias NSUITabView = NSTabView
    public typealias NSUITabViewItem = NSTabViewItem
    public typealias NSUIBox = NSBox

    // Table / outline views.
    public typealias NSUITableView = NSTableView
    public typealias NSUITableColumn = NSTableColumn
    public typealias NSUITableCellView = NSTableCellView
    public typealias NSUIOutlineView = NSOutlineView

    // Images and graphics.
    public typealias NSUIImage = NSImage
    public typealias NSUIImageView = NSImageView
    public typealias NSUIColor = NSColor
    public typealias NSUIFont = NSFont
    public typealias NSUIBezierPath = NSBezierPath
    public typealias NSUIGraphicsContext = NSGraphicsContext

    // Alerts and panels.
    public typealias NSUIAlert = NSAlert
    public typealias NSUIPanel = NSPanel
    public typealias NSUIOpenPanel = NSOpenPanel
    public typealias NSUISavePanel = NSSavePanel

    // Events and gestures.
    public typealias NSUIEvent = NSEvent
    public typealias NSUIGestureRecognizer = NSGestureRecognizer
    public typealias NSUIPanGestureRecognizer = NSPanGestureRecognizer
    public typealias NSUIClickGestureRecognizer = NSClickGestureRecognizer
    public typealias NSUIPressGestureRecognizer = NSPressGestureRecognizer
    public typealias NSUIMagnificationGestureRecognizer = NSMagnificationGestureRecognizer

    // Drag and drop.
    public typealias NSUIDraggingInfo = NSDraggingInfo
    public typealias NSUIDraggingSession = NSDraggingSession
    public typealias NSUIDraggingSource = NSDraggingSource
    public typealias NSUIDragOperation = NSDragOperation
    public typealias NSUIDraggingItem = NSDraggingItem
    public typealias NSUIDraggingContext = NSDraggingContext

    // Menu.
    public typealias NSUIMenu = NSMenu
    public typealias NSUIMenuItem = NSMenuItem

    // Toolbar.
    public typealias NSUIToolbar = NSToolbar
    public typealias NSUIToolbarItem = NSToolbarItem
    public typealias NSUIToolbarDelegate = NSToolbarDelegate
    public typealias NSUIToolbarItemIdentifier = NSToolbarItem.Identifier

    // Layout and geometry.
    public typealias NSUIEdgeInsets = NSEdgeInsets
    public typealias NSUIRect = NSRect
    public typealias NSUISize = NSSize
    public typealias NSUIPoint = NSPoint
    public typealias NSUILayoutConstraint = NSLayoutConstraint

    // Pasteboard.
    public typealias NSUIPasteboard = NSPasteboard
    public typealias NSUIPasteboardItem = NSPasteboardItem

    /// Visual effects.
    public typealias NSUIVisualEffectView = NSVisualEffectView

    // Animation, appearance, tracking, clip view.
    public typealias NSUIAnimationContext = NSAnimationContext
    public typealias NSUIAppearance = NSAppearance
    public typealias NSUITrackingArea = NSTrackingArea
    public typealias NSUIClipView = NSClipView

    // Protocols (as aliases for consistency).
    public typealias NSUIOutlineViewDataSource = NSOutlineViewDataSource
    public typealias NSUIOutlineViewDelegate = NSOutlineViewDelegate
    public typealias NSUITableViewDataSource = NSTableViewDataSource
    public typealias NSUITableViewDelegate = NSTableViewDelegate
    public typealias NSUITextViewDelegate = NSTextViewDelegate
    public typealias NSUITextFieldDelegate = NSTextFieldDelegate
    public typealias NSUISearchFieldDelegate = NSSearchFieldDelegate

    // Attributed strings.
    public typealias NSUIMutableAttributedString = NSMutableAttributedString
    public typealias NSUIAttributedString = NSAttributedString

    // Other.
    public typealias NSUICoder = NSCoder
    public typealias NSUIUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier
    public typealias NSUIRegularExpression = NSRegularExpression
    public typealias NSUIRange = NSRange
    public typealias NSUIUnderlineStyle = NSUnderlineStyle

#elseif canImport(UIKit)

    // View types.
    public typealias NSUIView = UIView
    public typealias NSUIViewController = UIViewController
    public typealias NSUIWindow = UIWindow
    public typealias NSUIWindowScene = UIWindowScene
    public typealias NSUIApplication = UIApplication
    public typealias NSUIScreen = UIScreen
    public typealias NSUIResponder = UIResponder

    // Controls.
    public typealias NSUIControl = UIControl
    public typealias NSUIButton = UIButton
    public typealias NSUILabel = UILabel
    public typealias NSUITextField = UITextField
    public typealias NSUITextView = UITextView
    public typealias NSUISearchBar = UISearchBar
    public typealias NSUISearchController = UISearchController
    public typealias NSUISegmentedControl = UISegmentedControl
    public typealias NSUISwitch = UISwitch
    public typealias NSUISlider = UISlider
    public typealias NSUIColorWell = UIColorWell

    // Container views.
    public typealias NSUIScrollView = UIScrollView
    public typealias NSUIStackView = UIStackView
    public typealias NSUISplitView = UISplitViewController
    public typealias NSUISplitViewController = UISplitViewController
    public typealias NSUITabBarController = UITabBarController

    // Table / collection views.
    public typealias NSUITableView = UITableView
    public typealias NSUITableViewCell = UITableViewCell
    public typealias NSUITableViewController = UITableViewController
    public typealias NSUICollectionView = UICollectionView
    public typealias NSUICollectionViewCell = UICollectionViewCell

    // Images and graphics.
    public typealias NSUIImage = UIImage
    public typealias NSUIImageView = UIImageView
    public typealias NSUIColor = UIColor
    public typealias NSUIFont = UIFont
    public typealias NSUIBezierPath = UIBezierPath
    public typealias NSUIGraphicsContext = UIGraphicsImageRenderer

    // Alerts.
    public typealias NSUIAlertController = UIAlertController
    public typealias NSUIAlertAction = UIAlertAction

    // Events and gestures.
    public typealias NSUIEvent = UIEvent
    public typealias NSUIGestureRecognizer = UIGestureRecognizer
    public typealias NSUIPanGestureRecognizer = UIPanGestureRecognizer
    public typealias NSUITapGestureRecognizer = UITapGestureRecognizer
    public typealias NSUILongPressGestureRecognizer = UILongPressGestureRecognizer
    public typealias NSUIPinchGestureRecognizer = UIPinchGestureRecognizer

    // Drag and drop.
    public typealias NSUIDragInteraction = UIDragInteraction
    public typealias NSUIDropInteraction = UIDropInteraction
    public typealias NSUIDropInteractionDelegate = UIDropInteractionDelegate
    public typealias NSUIDropSession = UIDropSession
    public typealias NSUIDropProposal = UIDropProposal

    // Menu.
    public typealias NSUIMenu = UIMenu
    public typealias NSUIAction = UIAction
    public typealias NSUIContextMenuInteraction = UIContextMenuInteraction
    public typealias NSUIContextMenuConfiguration = UIContextMenuConfiguration

    // Navigation and toolbar.
    public typealias NSUINavigationController = UINavigationController
    public typealias NSUIBarButtonItem = UIBarButtonItem

    // Layout and geometry.
    public typealias NSUIEdgeInsets = UIEdgeInsets
    public typealias NSUILayoutConstraint = NSLayoutConstraint

    /// Pasteboard.
    public typealias NSUIPasteboard = UIPasteboard

    // Visual effects.
    public typealias NSUIVisualEffectView = UIVisualEffectView
    public typealias NSUIBlurEffect = UIBlurEffect

    // Appearance.
    public typealias NSUIUserInterfaceStyle = UIUserInterfaceStyle
    public typealias NSUITraitCollection = UITraitCollection

    /// Tab bar.
    public typealias NSUITabBarItem = UITabBarItem

    // Protocols.
    public typealias NSUITableViewDataSource = UITableViewDataSource
    public typealias NSUITableViewDelegate = UITableViewDelegate
    public typealias NSUITextViewDelegate = UITextViewDelegate
    public typealias NSUITextFieldDelegate = UITextFieldDelegate
    public typealias NSUISearchBarDelegate = UISearchBarDelegate
    public typealias NSUISearchResultsUpdating = UISearchResultsUpdating
    public typealias NSUIDocumentPickerDelegate = UIDocumentPickerDelegate

    /// Document picker.
    public typealias NSUIDocumentPickerViewController = UIDocumentPickerViewController

    // Attributed strings.
    public typealias NSUIMutableAttributedString = NSMutableAttributedString
    public typealias NSUIAttributedString = NSAttributedString

    // Other.
    public typealias NSUICoder = NSCoder
    public typealias NSUIRegularExpression = NSRegularExpression
    public typealias NSUIRange = NSRange
    public typealias NSUIUnderlineStyle = NSUnderlineStyle

#endif
