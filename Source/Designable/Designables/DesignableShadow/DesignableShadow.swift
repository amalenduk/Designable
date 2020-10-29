//
//  DesignableShadow.swift
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

import UIKit

/// `DesignableShadow`
public protocol DesignableShadow: Designable {
    
    /// The color of the layer’s shadow. Animatable.
    var shadowColor: UIColor? { get set }
    
    /// The opacity of the layer’s shadow. Animatable.
    var shadowOpacity: Float { get set }
    
    /// The offset (in points) of the layer’s shadow. Animatable.
    var shadowOffset: CGSize { get set }
    
    /// The blur radius (in points) used to render the layer’s shadow. Animatable.
    var shadowRadius: CGFloat { get set }
    
    func drawShadow()
}

public extension DesignableShadow where Self: UIView {
    
    /// Adds a shadow to this view.
    func drawShadow() {
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}

public extension DesignableShadow where Self: UIButton {
    
    /// Adds a shadow to this button.
    func drawShadow() {
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}

public extension DesignableShadow where Self: UIImageView {
    
    /// Adds a shadow to this image view.
    func drawShadow() {
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}
