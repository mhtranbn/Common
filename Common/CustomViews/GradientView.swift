/**
 @file      NODGradientView.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import UIKit
import CoreGraphics

enum GradientColor {
    case horizontaly, vertical
}

class GradientView: UIView {
    
    // Default Colors
    var colors: [UIColor] = [.red, .black]
    
    var gradientColor = GradientColor.horizontaly
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setGradient(color1: colors[0], color2: colors[1])
    }
    
    private func setGradient(color1: UIColor, color2: UIColor) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [color1.cgColor, color2.cgColor] as CFArray, locations: [0, 1]) else { return }
        
        // Draw Path
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        context.saveGState()
        path.addClip()
        
        if gradientColor == GradientColor.horizontaly {
            
            context.drawLinearGradient(gradient, start: CGPoint(x: 0, y: frame.height), end: CGPoint(x: frame.width, y: frame.height), options: CGGradientDrawingOptions.drawsBeforeStartLocation)
            
        } else {
            context.drawLinearGradient(gradient, start: CGPoint(x: frame.width/2, y: 0), end: CGPoint(x: frame.width/2, y: frame.height), options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        }
        
        context.restoreGState()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.clear
    }
    
}
