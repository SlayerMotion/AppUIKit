//  AppUIKit.Fonts.swift
//  AppUIKit
//
//  Font helpers that read the same on both platforms. `NSFont` and `UIFont` already share most of their
//  factory API, so this is thin: the one helper imperative UI code reaches for repeatedly is a
//  monospaced-digit font for numeric readouts (a dial's degrees, a coordinate field) that must not jitter
//  as digits change width.

public extension AppUIKit {
    /// Font accessors shared across AppKit and UIKit.
    enum Fonts {
        /// A monospaced-digit system font, so a changing number does not shift the readout's width.
        public static func monospacedDigit(size: CGFloat, weight: NSUIFont.Weight = .semibold) -> NSUIFont {
            NSUIFont.monospacedDigitSystemFont(ofSize: size, weight: weight)
        }
    }
}
