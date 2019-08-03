//
//  CheckedFieldView.swift
//  Test
//
//  Created by Alexander on 01/08/2019.
//  Copyright © 2019 test. All rights reserved.
//
import UIKit

@IBDesignable
class CheckedFieldView: UIView {
    let checkFieldView = CheckFieldView()
    @IBInspectable var isChecked: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        checkFieldView.isHidden = !isChecked
    }
    
    private func commonInit() {
        checkFieldView.backgroundColor = UIColor.clear
        addSubview(checkFieldView)
        setAutoLayout()
        
        
        
    }
    
    private func setAutoLayout(){
        checkFieldView.translatesAutoresizingMaskIntoConstraints = false
        checkFieldView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        checkFieldView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        checkFieldView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        checkFieldView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
