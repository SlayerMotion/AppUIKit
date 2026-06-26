//  AppUITopLeftView.swift
//  AppUIKit
//
//  A subclassable container whose coordinate system is top-left with y increasing downward, the
//  convention UIKit already uses and AppKit does not. On macOS an `NSView` is bottom-left unless it
//  overrides `isFlipped`, so a cross-platform layer that positions subviews by absolute top-left frames
//  needs this. It is layer-backed on macOS so its subviews' layers can be animated, and it vends one
//  cross-framework layout hook, `didLayout()`, so a subclass reacts to size changes without an `#if`.

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit

    open class AppUITopLeftView: NSView {
        override open var isFlipped: Bool {
            true
        }

        override public init(frame frameRect: NSRect) {
            super.init(frame: frameRect)
            wantsLayer = true
        }

        public required init?(coder: NSCoder) {
            super.init(coder: coder)
            wantsLayer = true
        }

        override open func layout() {
            super.layout()
            didLayout()
        }

        /// A plain (non-Auto-Layout) NSView does not get `layout()` called merely
        /// because its frame changed, so drive the hook from the size change too.
        /// The window resizing the view, or a superview re-framing it, both go
        /// through `setFrameSize`, so this makes `didLayout()` reliable.
        override open func setFrameSize(_ newSize: NSSize) {
            super.setFrameSize(newSize)
            didLayout()
        }

        /// Called after the view lays out; override to position subviews. The
        /// cross-framework twin of `UIView.layoutSubviews`.
        open func didLayout() {}
    }

#elseif canImport(UIKit)
    import UIKit

    open class AppUITopLeftView: UIView {
        override open func layoutSubviews() {
            super.layoutSubviews()
            didLayout()
        }

        /// Called after the view lays out; override to position subviews.
        open func didLayout() {}
    }
#endif
