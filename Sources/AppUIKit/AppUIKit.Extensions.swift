// AppUIKit - Cross-platform view and color extensions

import Foundation

#if canImport(AppKit) && !targetEnvironment(macCatalyst)

    // MARK: - NSView Extensions

    public extension NSView {
        var nsuiBackgroundColor: NSColor? {
            get { layer?.backgroundColor.flatMap { NSColor(cgColor: $0) } }
            set {
                wantsLayer = true
                layer?.backgroundColor = newValue?.cgColor
            }
        }

        var nsuiCornerRadius: CGFloat {
            get { layer?.cornerRadius ?? 0 }
            set {
                wantsLayer = true
                layer?.cornerRadius = newValue
            }
        }

        var nsuiBorderWidth: CGFloat {
            get { layer?.borderWidth ?? 0 }
            set {
                wantsLayer = true
                layer?.borderWidth = newValue
            }
        }

        var nsuiBorderColor: NSColor? {
            get { layer?.borderColor.flatMap { NSColor(cgColor: $0) } }
            set {
                wantsLayer = true
                layer?.borderColor = newValue?.cgColor
            }
        }

        func nsuiAddSubview(_ view: NSView) {
            addSubview(view)
        }

        func nsuiRemoveFromSuperview() {
            removeFromSuperview()
        }
    }

    // MARK: - NSColor Extensions

    public extension NSColor {
        static var nsuiLabel: NSColor {
            .labelColor
        }

        static var nsuiSecondaryLabel: NSColor {
            .secondaryLabelColor
        }

        static var nsuiTertiaryLabel: NSColor {
            .tertiaryLabelColor
        }

        static var nsuiBackground: NSColor {
            .windowBackgroundColor
        }

        static var nsuiSecondaryBackground: NSColor {
            .controlBackgroundColor
        }

        static var nsuiSeparator: NSColor {
            .separatorColor
        }

        static var nsuiAccent: NSColor {
            .controlAccentColor
        }

        convenience init(nsuiRed red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    }

    // MARK: - NSTextField Label Factory

    public extension NSTextField {
        static func nsuiLabel(text: String) -> NSTextField {
            let label = NSTextField(labelWithString: text)
            label.isEditable = false
            label.isSelectable = false
            label.isBordered = false
            label.backgroundColor = .clear
            return label
        }
    }

    // MARK: - NSFont Extensions

    public extension NSFont {
        static func nsuiSystem(size: CGFloat, weight: NSFont.Weight = .regular) -> NSFont {
            .systemFont(ofSize: size, weight: weight)
        }

        static func nsuiMonospaced(size: CGFloat, weight: NSFont.Weight = .regular) -> NSFont {
            .monospacedSystemFont(ofSize: size, weight: weight)
        }
    }

    // MARK: - NSImage Extensions

    public extension NSImage {
        static func nsuiSystemImage(named name: String) -> NSImage? {
            NSImage(systemSymbolName: name, accessibilityDescription: nil)
        }
    }

#elseif canImport(UIKit)

    // MARK: - UIView Extensions

    public extension UIView {
        var nsuiBackgroundColor: UIColor? {
            get { backgroundColor }
            set { backgroundColor = newValue }
        }

        var nsuiCornerRadius: CGFloat {
            get { layer.cornerRadius }
            set { layer.cornerRadius = newValue }
        }

        var nsuiBorderWidth: CGFloat {
            get { layer.borderWidth }
            set { layer.borderWidth = newValue }
        }

        var nsuiBorderColor: UIColor? {
            get { layer.borderColor.flatMap { UIColor(cgColor: $0) } }
            set { layer.borderColor = newValue?.cgColor }
        }

        func nsuiAddSubview(_ view: UIView) {
            addSubview(view)
        }

        func nsuiRemoveFromSuperview() {
            removeFromSuperview()
        }
    }

    // MARK: - UIColor Extensions

    public extension UIColor {
        static var nsuiLabel: UIColor {
            .label
        }

        static var nsuiSecondaryLabel: UIColor {
            .secondaryLabel
        }

        static var nsuiTertiaryLabel: UIColor {
            .tertiaryLabel
        }

        static var nsuiBackground: UIColor {
            .systemBackground
        }

        static var nsuiSecondaryBackground: UIColor {
            .secondarySystemBackground
        }

        static var nsuiSeparator: UIColor {
            .separator
        }

        static var nsuiAccent: UIColor {
            .tintColor
        }

        convenience init(nsuiRed red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    }

    // MARK: - UILabel Factory

    public extension UILabel {
        static func nsuiLabel(text: String) -> UILabel {
            let label = UILabel()
            label.text = text
            return label
        }
    }

    // MARK: - UIFont Extensions

    public extension UIFont {
        static func nsuiSystem(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
            .systemFont(ofSize: size, weight: weight)
        }

        static func nsuiMonospaced(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
            .monospacedSystemFont(ofSize: size, weight: weight)
        }
    }

    // MARK: - UIImage Extensions

    public extension UIImage {
        static func nsuiSystemImage(named name: String) -> UIImage? {
            UIImage(systemName: name)
        }
    }

#endif
