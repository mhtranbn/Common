/**
 @file      NODPopupSegue.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import UIKit
import CMPopup

class PopupSegue: UIStoryboardSegue {

    override func perform() {
        if let dest = self.destination as? BasePopupViewController {
            dest.popMeUp()
        } else {
            self.source.present(self.destination, animated: true, completion: nil)
        }
    }
    
}
