//
//  CheckFieldView.swift
//  Test
//
//  Created by Alexander on 30/07/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class CheckFieldView: UIView {
    
    override func draw(_ rect: CGRect) {
        _ = getCirclePath(in: rect)
        _ = getCheckPath(in: rect)
    }
    
    private var curPath: UIBezierPath?
    private func getCheckPath(in rect: CGRect) -> UIBezierPath {

        let path = UIBezierPath()

        path.lineWidth = 2
        path.move(to: CGPoint(x: rect.minX + 7, y: rect.midY + 3))
        path.addLine(to: CGPoint(x: rect.midX + 1, y: rect.maxY - 5))
        path.addLine(to: CGPoint(x: rect.maxX - 7, y: rect.minY + 7))
        path.stroke()
        return path
    }

    private func getCirclePath(in rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath(ovalIn: CGRect(x: rect.midX - 10, y: rect.minY + 3, width: rect.width - 5, height: rect.height - 5))
        path.lineWidth = 4
        UIColor.white.setFill()
        path.stroke()
        path.fill()
        return path
    }
}
