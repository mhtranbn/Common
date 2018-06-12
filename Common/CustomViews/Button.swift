/**
 @file      NODButton.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import UIKit

class Button: UIButton {

    func setTitleAndImageEdgeInsert(_ spacing: CGFloat) {
        // Lower the text and push it left so it appears centered below the image
        if let image = self.imageView?.image {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0.0)
        }
        
        // Raise the image and push it right so it appears centered above the text
        if let text = self.titleLabel?.text {
            let titleSize = (text as NSString).size(withAttributes: [NSAttributedStringKey.font: titleLabel!.font])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }

}
