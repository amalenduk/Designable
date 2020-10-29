//
//  DesignableGradientDirection.swift
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

/// `GradientDirection`
public enum GradientDirection {
    case topToBottom
    case bottomToTop
    case leftToRight
    case rightToLeft
    case topLeftToBottomRight
    case topRightToBottomLeft
    case bottomLeftToTopRight
    case bottomRightToTopLeft
    case custom(degree: CGFloat)
}

public extension GradientDirection {
    var startPoint: CGPoint {
        switch self {
        case .topToBottom:
            return CGPoint(x: 0.5, y: 0.0)
        case .bottomToTop:
            return CGPoint(x: 0.5, y: 1.0)
        case .leftToRight:
            return CGPoint(x: 0.0, y: 0.5)
        case .rightToLeft:
            return CGPoint(x: 1.0, y: 0.5)
        case .topLeftToBottomRight:
            return CGPoint.zero
        case .topRightToBottomLeft:
            return CGPoint(x: 1.0, y: 0.0)
        case .bottomLeftToTopRight:
            return CGPoint(x: 0.0, y: 1.0)
        case .bottomRightToTopLeft:
            return CGPoint(x: 1.0, y: 1.0)
        case .custom(degree: let degree):
            let radian = degree * .pi / 180
            return CGPoint(x: 0.5 * (cos(radian) + 1), y: 0.5 * (1 - sin(radian)))
        }
    }
    
    var endPoint: CGPoint {
        switch self {
        case .topToBottom:
            return CGPoint(x: 0.5, y: 1.0)
        case .bottomToTop:
            return CGPoint(x: 0.5, y: 0.0)
        case .leftToRight:
            return CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            return CGPoint(x: 0.0, y: 0.5)
        case .topLeftToBottomRight:
            return CGPoint(x: 1.0, y: 1.0)
        case .topRightToBottomLeft:
            return CGPoint(x: 0.0, y: 1.0)
        case .bottomLeftToTopRight:
            return CGPoint(x: 1.0, y: 0.0)
        case .bottomRightToTopLeft:
            return CGPoint(x: 0.0, y: 0.0)
        case .custom(degree: let degree):
            let radian = degree * .pi / 180
            return CGPoint(x: 0.5 * (cos(radian + .pi) + 1), y: 0.5 * (1 + sin(radian)))
        }
    }
}
