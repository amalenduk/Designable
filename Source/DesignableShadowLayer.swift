//
//  DesignableShadowLayer.swift
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

public class DesignableShadowLayer: CAShapeLayer {

    // MARK: - Properties

    /* The color of the shadow. Defaults to opaque black. Colors created
     * from patterns are currently NOT supported. Animatable. */

    override public var shadowColor: CGColor? {
        didSet {
            setNeedsLayout()
        }
    }

    /* The opacity of the shadow. Defaults to 0. Specifying a value outside the
     * [0,1] range will give undefined results. Animatable. */

    override public var shadowOpacity: Float {
        didSet {
            setNeedsLayout()
        }
    }

    /* The shadow offset. Defaults to (0, -3). Animatable. */

    override public var shadowOffset: CGSize {
        didSet {
            setNeedsLayout()
        }
    }

    /* The blur radius used to create the shadow. Defaults to 3. Animatable. */

    override public var shadowRadius: CGFloat {
        didSet {
            setNeedsLayout()
        }
    }

    /* Called when the layer requires layout. The default implementation
     * calls the layout manager if one exists and it implements the
     * -layoutSublayersOfLayer: method. Subclasses can override this to
     * provide their own layout algorithm, which should set the frame of
     * each sublayer. */

    public override func layoutSublayers() {
        super.layoutSublayers()

        masksToBounds = true
        shouldRasterize = true

        fillRule = CAShapeLayerFillRule.evenOdd
        borderColor = UIColor.clear.cgColor

        generateShadowPath()
    }

    func generateShadowPath() {
        let path = CGMutablePath()
        let bezier: UIBezierPath = {
            if cornerRadius > 0 {
                return UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            } else {
                return UIBezierPath(rect: bounds)
            }
        }()
        path.addPath(bezier.cgPath)
        path.addRect(bounds)
        path.closeSubpath()
        self.path = path
    }
}
