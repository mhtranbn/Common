/**
 @file      NODStoryboard.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import Foundation
import UIKit

enum Storyboard: String {
    
    case loginGesture             = "LoginGesture"
    case splash                   = "Splash"
    case gesture                  = "GestureAuthentication"
    case password                 = "PasswordAuthentication"
    case finger                   = "FingerAuthentication"
    case home                     = "Home"
    case menu                     = "RightMenu"
    case myContent                = "MyContent"
    case webView                  = "WebView"
    case detailGoods              = "DetailGoods"
    case ranking                  = "Ranking"
    case newArrivals              = "NewArrivals"
    case news                     = "News"
    case search                   = "Search"
    case genre                    = "Genre"
    case miss                     = "Miss"
    case specialSelection         = "SpecialSelection"
    case tokusetsu                = "Tokusetsu"
    case bannerDetail             = "BannerDetail"
    case other                    = "Other"
    case listAlert              = "ListAlert"
    case free                    = "Free"

    func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    /** Load view controller from storyboard
     
     - Parameters:
     - viewControllerClass: View controller class
     - vcIdentifier: View controller identifier in storyboard
     - Returns: New view contoller
     */
    func loadViewController<T: UIViewController>(viewControllerClass: T.Type, vcIdentifier: String? = nil) -> T {
        let vc: UIViewController?
        let storyboard = self.getStoryboard()
        if let id = vcIdentifier {
            vc = storyboard.instantiateViewController(withIdentifier: id)
        } else if let id = String(T.self), id != "UINavigationController" {
            vc = storyboard.instantiateViewController(withIdentifier: id)
        } else {
            vc = storyboard.instantiateInitialViewController()
        }
        guard let controller = vc as? T else {
            fatalError("Fail to load view controller of type \"\(T.classForCoder())\" from storyboard \"\(self.rawValue)\" with id \"\(vcIdentifier ?? "<initial>")\"")
        }
        return controller
    }
    
}

extension UIViewController {
    
    /** Load view controller from storyboard
     
     - Parameters:
     - storyboard: Storyboard
     - identifier: View controller identifier. Pass nill to load Initial View Controller.
     - Returns: New view controller
     */
    class func loadFromStoryboard(storyboard: Storyboard, identifier: String? = nil) -> Self {
        return storyboard.loadViewController(viewControllerClass: self, vcIdentifier: identifier)
    }
    
}
