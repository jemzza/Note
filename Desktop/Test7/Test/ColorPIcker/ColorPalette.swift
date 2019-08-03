//
//  ColorPalette.swift
//  Test
//
//  Created by Alexander on 02/08/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

//public protocol ColorPaletteDelegate: class {
//    func colorPickerWillBeginDragging(_ colorPicker: ColorPalette)
//}

class ColorPalette: UIView {
//    let color1 = UIColor(red: 255 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
//    let color2 = UIColor(red: 255 / 255, green: 255 / 255, blue: 0 / 255, alpha: 1.0).cgColor
//    let color3 = UIColor(red: 0 / 255, green: 255 / 255, blue: 0 / 255, alpha: 1.0).cgColor
//    let color4 = UIColor(red: 0 / 255, green: 191 / 255, blue: 255 / 255, alpha: 1.0).cgColor
//    let color5 = UIColor(red: 0 / 255, green: 0 / 255, blue: 255 / 255, alpha: 1.0).cgColor
//    let color6 = UIColor(red: 255 / 255, green: 20 / 255, blue: 147 / 255, alpha: 1.0).cgColor
//    let color7 = UIColor(red: 255 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
//    let colorWhite1 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1.0).cgColor
//    let colorWhite2 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.0).cgColor
//    let colorBlack = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
    

    var color1 = UIColor(red: 255 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
    var color2 = UIColor(red: 255 / 255, green: 255 / 255, blue: 0 / 255, alpha: 1.0).cgColor
    var color3 = UIColor(red: 0 / 255, green: 255 / 255, blue: 0 / 255, alpha: 1.0).cgColor
    var color4 = UIColor(red: 0 / 255, green: 191 / 255, blue: 255 / 255, alpha: 1.0).cgColor
    var color5 = UIColor(red: 0 / 255, green: 0 / 255, blue: 255 / 255, alpha: 1.0).cgColor
    var color6 = UIColor(red: 255 / 255, green: 20 / 255, blue: 147 / 255, alpha: 1.0).cgColor
    var color7 = UIColor(red: 255 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
    var colorWhite1 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1.0).cgColor
    var colorBlack = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
    

    
    let colorWhite2 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.0).cgColor
    let gradientLayer = CAGradientLayer()
    let gradientLayerVertical = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [color1, color2, color3, color4, color5, color6, color7]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        gradientLayerVertical.frame = self.bounds
        gradientLayerVertical.colors = [colorWhite1, colorWhite2]
        gradientLayerVertical.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayerVertical.endPoint = CGPoint(x: 0.0, y: 0.2)
        self.layer.insertSublayer(gradientLayerVertical, at: 1)
        
        
    }
    
    public func updateBrightness(alpha: CGFloat) {
        color1 = UIColor(red: 255 / 255, green: 0 / 255, blue: 0 / 255, alpha: alpha).cgColor
        color2 = UIColor(red: 255 / 255, green: 255 / 255, blue: 0 / 255, alpha: alpha).cgColor
        color3 = UIColor(red: 0 / 255, green: 255 / 255, blue: 0 / 255, alpha: alpha).cgColor
        color4 = UIColor(red: 0 / 255, green: 191 / 255, blue: 255 / 255, alpha: alpha).cgColor
        color5 = UIColor(red: 0 / 255, green: 0 / 255, blue: 255 / 255, alpha: alpha).cgColor
        color6 = UIColor(red: 255 / 255, green: 20 / 255, blue: 147 / 255, alpha: alpha).cgColor
        color7 = UIColor(red: 255 / 255, green: 0 / 255, blue: 0 / 255, alpha: alpha).cgColor
        colorWhite1 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: alpha).cgColor
        colorBlack = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: alpha).cgColor
    }
    
    
//    func brightness(_ input: ColorPalette,amount: Float) -> ColorPalette? {
//        return ColorPalette
//    }
    
    
}





/*
import UIKit

internal protocol HSBColorPickerDelegate : NSObjectProtocol {
    func HSBColorColorPickerTouched(sender:HSBColorPicker, color:UIColor, point:CGPoint, state:UIGestureRecognizer.State)
}

@IBDesignable
class HSBColorPicker : UIView {
    
    weak internal var delegate: HSBColorPickerDelegate?
    let saturationExponentTop:Float = 2.0
    let saturationExponentBottom:Float = 1.3
    
    @IBInspectable var elementSize: CGFloat = 1.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private func initialize() {
        self.clipsToBounds = true
        let touchGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.touchedColor(gestureRecognizer:)))
        touchGesture.minimumPressDuration = 0
        touchGesture.allowableMovement = CGFloat.greatestFiniteMagnitude
        self.addGestureRecognizer(touchGesture)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        for y : CGFloat in stride(from: 0.0 ,to: rect.height, by: elementSize) {
            var saturation = y < rect.height / 2.0 ? CGFloat(2 * y) / rect.height : 2.0 * CGFloat(rect.height - y) / rect.height
            saturation = CGFloat(powf(Float(saturation), y < rect.height / 2.0 ? saturationExponentTop : saturationExponentBottom))
            let brightness = y < rect.height / 2.0 ? CGFloat(1.0) : 2.0 * CGFloat(rect.height - y) / rect.height
            for x : CGFloat in stride(from: 0.0 ,to: rect.width, by: elementSize) {
                let hue = x / rect.width
                let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
                context!.setFillColor(color.cgColor)
                context!.fill(CGRect(x:x, y:y, width:elementSize,height:elementSize))
            }
        }
    }
    
    func getColorAtPoint(point:CGPoint) -> UIColor {
        let roundedPoint = CGPoint(x:elementSize * CGFloat(Int(point.x / elementSize)),
                                   y:elementSize * CGFloat(Int(point.y / elementSize)))
        var saturation = roundedPoint.y < self.bounds.height / 2.0 ? CGFloat(2 * roundedPoint.y) / self.bounds.height
            : 2.0 * CGFloat(self.bounds.height - roundedPoint.y) / self.bounds.height
        saturation = CGFloat(powf(Float(saturation), roundedPoint.y < self.bounds.height / 2.0 ? saturationExponentTop : saturationExponentBottom))
        let brightness = roundedPoint.y < self.bounds.height / 2.0 ? CGFloat(1.0) : 2.0 * CGFloat(self.bounds.height - roundedPoint.y) / self.bounds.height
        let hue = roundedPoint.x / self.bounds.width
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
    func getPointForColor(color:UIColor) -> CGPoint {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil);
        
        var yPos:CGFloat = 0
        let halfHeight = (self.bounds.height / 2)
        if (brightness >= 0.99) {
            let percentageY = powf(Float(saturation), 1.0 / saturationExponentTop)
            yPos = CGFloat(percentageY) * halfHeight
        } else {
            //use brightness to get Y
            yPos = halfHeight + halfHeight * (1.0 - brightness)
        }
        let xPos = hue * self.bounds.width
        return CGPoint(x: xPos, y: yPos)
    }
    
    @objc func touchedColor(gestureRecognizer: UILongPressGestureRecognizer) {
        if (gestureRecognizer.state == UIGestureRecognizer.State.began) {
            let point = gestureRecognizer.location(in: self)
            let color = getColorAtPoint(point: point)
            self.delegate?.HSBColorColorPickerTouched(sender: self, color: color, point: point, state:gestureRecognizer.state)
        }
    }
}
*/
