//
//  DesignableBorder.swift
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

/// `DesignableBorder`
public protocol DesignableBorder: Designable {
    
    /// The width of the layer’s border. Animatable.
    var borderWidth: CGFloat { get set }
    
    /// The color of the receiver’s border when the receiver is a custom box with a simple line border.
    var borderColor: UIColor? { get set }
    
    func updateBorder()
}

public extension DesignableBorder where Self: UIView {
    
    /// Update border of the view
    func updateBorder() {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
}

public extension DesignableBorder where Self: UIButton {
    
    /// Update border of the button
    func updateBorder() {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
}

public extension DesignableBorder where Self: UIImageView {
    
    /// Update border of the image view
    func updateBorder() {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
}
