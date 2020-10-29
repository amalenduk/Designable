//
//  Font.swift
//
//  Copyright (c) 2020 Amalendu Kar
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import UIKit

public protocol FontRepresentable {
    var fontName: String { get }
}

public protocol DynamicTypeSizes {
    var largeTitle: CGFloat { get }
    var title1: CGFloat { get }
    var title2: CGFloat { get }
    var title3: CGFloat { get }
    var headline: CGFloat { get }
    var body: CGFloat { get }
    var callout: CGFloat { get }
    var subheadline: CGFloat { get }
    var footnote: CGFloat { get }
    var caption1: CGFloat { get }
    var caption2: CGFloat { get }
}

public struct FontSize: DynamicTypeSizes, Hashable, Equatable {
    
    public let largeTitle: CGFloat
    
    public let title1: CGFloat
    
    public let title2: CGFloat
    
    public let title3: CGFloat
    
    public let headline: CGFloat
    
    public let body: CGFloat
    
    public let callout: CGFloat
    
    public let subheadline: CGFloat
    
    public let footnote: CGFloat
    
    public let caption1: CGFloat
    
    public let caption2: CGFloat
    
    public init(largeTitle: CGFloat,
                title1: CGFloat,
                title2: CGFloat,
                title3: CGFloat,
                headline: CGFloat,
                body: CGFloat,
                callout: CGFloat,
                subheadline: CGFloat,
                footnote: CGFloat,
                caption1: CGFloat,
                caption2: CGFloat) {
        self.largeTitle = largeTitle
        self.title1 = title1
        self.title2 = title2
        self.title3 = title3
        self.headline = headline
        self.body = body
        self.callout = callout
        self.subheadline = subheadline
        self.footnote = footnote
        self.caption1 = caption1
        self.caption2 = caption2
    }
}

public typealias Font = UIFont

extension Font {
    
    // https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/
    public struct Sizes {
        
        public static let `default`: DynamicTypeSizes = Sizes.large
        
        public static let xSmall: DynamicTypeSizes  = FontSize(largeTitle: 31,
                                                               title1: 25,
                                                               title2: 19,
                                                               title3: 17,
                                                               headline: 14,
                                                               body: 14,
                                                               callout: 13,
                                                               subheadline: 12,
                                                               footnote: 12,
                                                               caption1: 11,
                                                               caption2: 11)
        
        public static let small: DynamicTypeSizes  = FontSize(largeTitle: 32,
                                                              title1: 26,
                                                              title2: 20,
                                                              title3: 18,
                                                              headline: 15,
                                                              body: 15,
                                                              callout: 14,
                                                              subheadline: 13,
                                                              footnote: 12,
                                                              caption1: 11,
                                                              caption2: 11)
        
        public static let medium: DynamicTypeSizes  = FontSize(largeTitle: 33,
                                                               title1: 27,
                                                               title2: 21,
                                                               title3: 19,
                                                               headline: 16,
                                                               body: 16,
                                                               callout: 15,
                                                               subheadline: 14,
                                                               footnote: 12,
                                                               caption1: 11,
                                                               caption2: 11)
        
        public static let large: DynamicTypeSizes  = FontSize(largeTitle: 34,
                                                              title1: 28,
                                                              title2: 22,
                                                              title3: 20,
                                                              headline: 17,
                                                              body: 17,
                                                              callout: 16,
                                                              subheadline: 15,
                                                              footnote: 13,
                                                              caption1: 12,
                                                              caption2: 11)
        
        public static let xLarge: DynamicTypeSizes  = FontSize(largeTitle: 36,
                                                               title1: 30,
                                                               title2: 24,
                                                               title3: 22,
                                                               headline: 19,
                                                               body: 18,
                                                               callout: 17,
                                                               subheadline: 15,
                                                               footnote: 15,
                                                               caption1: 14,
                                                               caption2: 13)
        
        public static let xxxLarge: DynamicTypeSizes  = FontSize(largeTitle: 40,
                                                                 title1: 34,
                                                                 title2: 28,
                                                                 title3: 26,
                                                                 headline: 23,
                                                                 body: 23,
                                                                 callout: 22,
                                                                 subheadline: 21,
                                                                 footnote: 19,
                                                                 caption1: 18,
                                                                 caption2: 17)
        
    }
    
    open class func font(style: FontRepresentable, size: CGFloat = UIFont.labelFontSize) -> Font {
        font(name: style.fontName, size: size)
    }
    
    open class func font(name: String, size: CGFloat) -> Font {
        
        guard let customFont = UIFont(name: name, size: size) else {
            fatalError("""
                Failed to load the \(name) font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    open func scaled(with fontMetrics: UIFontMetrics = .default) -> Font {
        return fontMetrics.scaledFont(for: self)
    }
    
    open func scaled(maximumPointSize: CGFloat, with fontMetrics: UIFontMetrics = .default) -> Font {
        return fontMetrics.scaledFont(for: self, maximumPointSize: maximumPointSize)
    }
    
    open func scaled(compatibleWith traitCollection: UITraitCollection?, with fontMetrics: UIFontMetrics = .default) -> Font {
        return fontMetrics.scaledFont(for: self, compatibleWith: traitCollection)
    }
    
    open func scaled(maximumPointSize: CGFloat, compatibleWith traitCollection: UITraitCollection?, with fontMetrics: UIFontMetrics = .default) -> Font {
        return fontMetrics.scaledFont(for: self, maximumPointSize: maximumPointSize, compatibleWith: traitCollection)
    }
}
