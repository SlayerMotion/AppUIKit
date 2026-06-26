//
//  AppUICursor.swift
//  AppUIKit
//
//  A cross-platform cursor. On AppKit it sets the matching NSCursor; on UIKit,
//  where touch input has no pointer, it is a no-op. Lets a cross-platform view
//  show a resize cursor without an #if or a direct NSCursor reference.
//

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit
#endif

public enum AppUICursor {
    case arrow
    case resizeLeftRight
    case resizeUpDown

    public func set() {
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            switch self {
            case .arrow: NSCursor.arrow.set()
            case .resizeLeftRight: NSCursor.resizeLeftRight.set()
            case .resizeUpDown: NSCursor.resizeUpDown.set()
            }
        #endif
    }
}
