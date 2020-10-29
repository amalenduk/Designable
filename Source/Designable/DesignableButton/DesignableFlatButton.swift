//
//  DesignableFlatButton.swift
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
open class DesignableFlatButton: DesignableButton {
    
    // MARK: - Properties
    
    // MARK: - BackgroundColor for Different States Properties
    
    /// Sets the backgroundColor to use for the normal state.
    @IBInspectable open var color: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// Sets the backgroundColor to use for the highlighted state.
    @IBInspectable open var highlightedColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// Sets the backgroundColor to use for the selected state.
    @IBInspectable open var selectedColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /// Sets the backgroundColor to use for the disabled state.
    @IBInspectable open var disabledColor: UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Title for Different States Properties
    
    /// Sets the title to use for the normal state.
    @IBInspectable open var title: String? {
        get { return title(for: .normal) }
        set { setTitle(newValue, for: .normal) }
    }
    
    /// Sets the title to use for the highlighted state.
    @IBInspectable open var highlightedTitle: String? {
        get { return title(for: .highlighted) }
        set { setTitle(newValue, for: .highlighted) }
    }
    
    /// Sets the title to use for the selected state.
    @IBInspectable open var selectedTitle: String? {
        get { return title(for: .selected) }
        set { setTitle(newValue, for: .selected) }
    }
    
    /// Sets the title to use for the disabled state.
    @IBInspectable open var disabledTitle: String? {
        get { return title(for: .disabled) }
        set { setTitle(newValue, for: .disabled) }
    }
    
    // MARK: - TitleColor for Different States Properties
    
    /// Sets the color of the title to use for the normal state.
    @IBInspectable open var titleColor: UIColor? {
        get { return titleColor(for: .normal)}
        set { setTitleColor(newValue, for: .normal) }
    }
    
    /// Sets the color of the title to use for the highlighted state.
    @IBInspectable open var highlightedTitleColor: UIColor? {
        get { return titleColor(for: .highlighted)}
        set { setTitleColor(newValue, for: .highlighted) }
    }
    
    /// Sets the color of the title to use for the selected state.
    @IBInspectable open var selectedTitleColor: UIColor? {
        get { return titleColor(for: .selected)}
        set { setTitleColor(newValue, for: .selected) }
    }
    
    /// Sets the color of the title to use for the disabled state.
    @IBInspectable open var disabledTitleColor: UIColor? {
        get { return titleColor(for: .disabled)}
        set { setTitleColor(newValue, for: .disabled) }
    }
    
    // MARK: - Image for Different States Properties
    
    /// Sets the image to use for the normal state.
    @IBInspectable open var image: UIImage? {
        get { return image(for: .normal)}
        set { setImage(newValue, for: .normal) }
    }
    
    /// Sets the image to use for the highlighted state.
    @IBInspectable open var highlightedImage: UIImage? {
        get { return image(for: .highlighted)}
        set { setImage(newValue, for: .highlighted) }
    }
    
    /// Sets the image to use for the selected state.
    @IBInspectable open var selectedImage: UIImage? {
        get { return image(for: .selected)}
        set { setImage(newValue, for: .selected) }
    }
    
    /// Sets the image to use for the disabled state.
    @IBInspectable open var disabledImage: UIImage? {
        get { return image(for: .disabled)}
        set { setImage(newValue, for: .disabled) }
    }
    
    // MARK: - UIButton
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setNeedsDisplay()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        setNeedsDisplay()
    }
    
    override open func draw(_ rect: CGRect) {
        updateBackgroundImages()
        super.draw(rect)
    }
    
    // MARK: - Internal methods
    
    fileprivate func configure() {
        adjustsImageWhenDisabled = false
        adjustsImageWhenHighlighted = false
    }
    
    fileprivate func updateBackgroundImages() {
        
        if let color = color {
            let normalImage = Utils.image(color: color, size: frame.size, cornerRadius: cornerRadius)
            setBackgroundImage(normalImage, for: .normal)
        }
        
        if let highlightedColor = highlightedColor {
            let highlightedImage = Utils.image(color: highlightedColor, size: frame.size, cornerRadius: cornerRadius)
            setBackgroundImage(highlightedImage, for: .highlighted)
        }
        
        if let selectedColor = selectedColor {
            let selectedImage = Utils.image(color: selectedColor, size: frame.size, cornerRadius: cornerRadius)
            setBackgroundImage(selectedImage, for: .selected)
        }
        
        if let disabledColor = disabledColor {
            let disabledImage = Utils.image(color: disabledColor, size: frame.size, cornerRadius: cornerRadius)
            setBackgroundImage(disabledImage, for: .disabled)
        }
    }
}
