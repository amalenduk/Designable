//
//  DesignableButton.swift
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

@IBDesignable
open class DesignableButton: UIButton {
    
    // MARK: - Properties
    
    // MARK: - DesignableBorder Properties
    
    /* The width of the layer's border, inset from the layer bounds. The
     * border is composited above the layer's content and sublayers and
     * includes the effects of the `cornerRadius' property. Defaults to
     * zero. Animatable. */
    
    @IBInspectable open var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    /* The color of the layer's border. Defaults to opaque black. Colors
     * created from tiled patterns are supported. Animatable. */
    
    @IBInspectable open var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    // MARK: - DesignableShadow Properties
    
    /* The color of the shadow. Defaults to opaque black. Colors created
     * from patterns are currently NOT supported. Animatable. */
    
    /** Shadow properties. **/
    @IBInspectable open var shadowColor: UIColor? {
        get {
            guard let shadowColor = layer.shadowColor else { return nil }
            return UIColor(cgColor: shadowColor)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    /* The opacity of the shadow. Defaults to 0. Specifying a value outside the
     * [0,1] range will give undefined results. Animatable. */
    
    @IBInspectable open var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /* The shadow offset. Defaults to (0, -3). Animatable. */
    
    @IBInspectable open var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /* The blur radius used to create the shadow. Defaults to 3. Animatable. */
    
    @IBInspectable open var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    // MARK: - DesignableCorner Properties
    
    /* When positive, the background of the layer will be drawn with
     * rounded corners. Also effects the mask generated by the
     * `masksToBounds' property. Defaults to zero. Animatable. */
    
    @IBInspectable open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.roundCorners(with: fullyRoundedCorners ? frame.size.height / 2 : newValue)
            // layer.cornerRadius = fullyRoundedCorners ? frame.size.height / 2 : newValue
        }
    }
    
    /* When true, the background of the layer will be drawn with
     * fully rounded corners. Also effects the mask generated by the
     * `masksToBounds' property. Defaults to false. Animatable. */
    
    @IBInspectable open var fullyRoundedCorners: Bool = false {
        didSet {
            cornerRadius = fullyRoundedCorners ? frame.size.height / 2 : cornerRadius
        }
    }

    // MARK: - Additional Helpers

    open func addSpaceBetweenImageAndTitle(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: title(for: state) == nil || attributedTitle(for: state) == nil ? 0 : insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: image(for: state) == nil ? 0 : insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}

// MARK: - DesignableBorder

extension DesignableButton: DesignableBorder { }

// MARK: - DesignableShadow

extension DesignableButton: DesignableShadow { }

// MARK: - DesignableCorner

extension DesignableButton: DesignableCorner { }

extension DesignableButton {
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        if self.borderWidth > 0 {
            updateBorder()
        }
        
        if self.shadowOpacity > 0 {
            drawShadow()
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        if self.borderWidth > 0 {
            updateBorder()
        }
        
        if self.shadowOpacity > 0 {
            drawShadow()
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

        updateCornerRadius()
    }
}
