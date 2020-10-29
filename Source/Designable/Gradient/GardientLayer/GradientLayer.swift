//
//  GradientLayer.swift
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

/// A layer that draws a color gradient over its background color, filling the shape of the layer (including rounded corners)
open class GradientLayer: CAGradientLayer {
    
    /* The designated initializer. */
    
    public override init(layer: Any) {
        super.init(layer: layer)
    }
    
    /// Returns a GradientLayer
    /// - Parameters:
    ///   - direction: The direction to be applied to the layer.
    ///   - colors: The array of CGColorRef objects defining the color of each gradient stop. Animatable.
    ///   - cornerRadius: The radius to use when drawing rounded corners for the layer’s background.
    ///   Defaults to 0. Animatable.
    ///   - locations: The locations to be applied to the layer. Defaults to nil.
    public init(direction: GradientDirection = .topToBottom, colors: [UIColor], cornerRadius: CGFloat = 0, locations: [NSNumber]? = nil) {
        super.init()
        self.needsDisplayOnBoundsChange = true
        self.colors = colors.map { $0.cgColor as Any }
        self.startPoint = direction.startPoint
        self.endPoint = direction.endPoint
        self.cornerRadius = cornerRadius
        self.locations = locations?.map { $0 }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
