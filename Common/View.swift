/**
 @file      NODView.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import UIKit

extension UIView {
    
    func addVoiceOver(_ text: String) {
//        self.accessibilityLanguage = kAccessibilityLanguage
        self.accessibilityLabel = text
        self.accessibilityTraits = UIAccessibilityTraitNone
    }
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for index in views.enumerated() {
            let key = "v\(index.offset)"
            viewsDictionary[key] = index.element
            index.element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
