//
//  DesignableCorner.swift
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

/// `DesignableCorner`
public protocol DesignableCorner: Designable {
    
    /// The radius to use when drawing rounded corners for the layer’s background. Animatable.
    var cornerRadius: CGFloat { get set }
    
    /// When positive, the background of the layer will be drawn with fully rounded corners.
    var fullyRoundedCorners: Bool { get set }
}

public extension DesignableCorner where Self: UIView {
    
    /// Update cornerRadius of the  view
    func updateCornerRadius() {
        layoutIfNeeded()
        self.layer.roundCorners(with: fullyRoundedCorners ? frame.height / 2 : cornerRadius)
        // self.layer.cornerRadius = fullyRoundedCorners ? frame.height / 2 : cornerRadius
    }
}

public extension DesignableCorner where Self: UIButton {
    
    /// Update cornerRadius of the  button
    func updateCornerRadius() {
        self.layer.roundCorners(with: fullyRoundedCorners ? frame.height / 2 : cornerRadius)
        // self.layer.cornerRadius = fullyRoundedCorners ? frame.height / 2 : cornerRadius
    }
}

public extension DesignableCorner where Self: UIImageView {
    
    /// Updates cornerRadius of  the image view
    func updateCornerRadius() {
        self.layer.roundCorners(with: fullyRoundedCorners ? frame.height / 2 : cornerRadius)
        // self.layer.cornerRadius = fullyRoundedCorners ? frame.height / 2 : cornerRadius
    }
}
