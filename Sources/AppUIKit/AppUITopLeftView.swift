//  AppUITopLeftView.swift
//  AppUIKit
//
//  A container whose coordinate system is top-left with y increasing downward, the convention UIKit
//  already uses and AppKit does not. On macOS an `NSView` is bottom-left unless it overrides `isFlipped`,
//  so a cross-platform layer that positions subviews by absolute top-left frames needs this. It is layer-
//  backed on macOS so its subviews' layers can be animated.

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit

    public final class AppUITopLeftView: NSView {
        override public var isFlipped: Bool {
            true
        }

        override public init(frame frameRect: NSRect) {
            super.init(frame: frameRect)
            wantsLayer = true
        }

        @available(*, unavailable)
        public required init?(coder _: NSCoder) {
            fatalError("init(coder:) is not used")
        }
    }

#elseif canImport(UIKit)
    import UIKit

    public final class AppUITopLeftView: UIView {}
#endif
