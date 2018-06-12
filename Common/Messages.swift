/**
 @file      NODMessages.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import UIKit
import SWUtils
import CMPopup

enum AlertTitle {
    
    case success
    case error
    case updateVersion
    case logOut
    
    fileprivate func toString() -> String {
        return NSLocalizedString("ALERT_TITLE_\(self)", comment: "")
    }
    
}

// swiftlint:disable identifier_name
enum AlertButton {
    
    case close
    case ok
    case cancel
    case yes
    case no
    case goToSettings
    case logOut
    
    fileprivate func toString() -> String {
        return NSLocalizedString("ALERT_BUTTON_\(self)", comment: "")
    }
    
}
// swiftlint:enable identifier_name

enum AlertMessage {
    
    case setFingerSuccess
    case networkError
    case error
    case warningRestriction
    case warningAirplayHDMIConnected
    case idOrPasswordIsIncorrect
    case logOut
    // error Hander
    case noInternetAccess
    case transmissionError
    //PurcharePlanList
    case purchasePlanList401
    case purchasePlanList402
    case purchasePlanList900
    case purchasePlanList901
    case purchasePlanList902
    case purchasePlanList999
    
    case sectionIDFail
    case loginFail
    case notPurchased
    case configClientFail
    case productFail
    case iDProgramFail
    case ticketFail
    case otherError
    
    case resUUIDErrorOther
    case resUUIDErrorSectionID
    
    func toString() -> String {
        return NSLocalizedString("ALERT_MESG_\(self)", comment: "")
    }
    
}

// swiftlint:disable:next private_over_fileprivate
fileprivate func getAlertContent(message: AlertMessage?, customMesg: String?, title: AlertTitle?,
                                 customTitle: String?) -> (String?, String?) {
    var mesg: String?
    var alertTitle: String?
    if let msg = message {
        mesg = msg.toString()
    } else {
        mesg = customMesg
    }
    if let str = title {
        alertTitle = str.toString()
    } else {
        alertTitle = customTitle
    }
    return (mesg, alertTitle)
}

//swiftlint:disable private_over_fileprivate
fileprivate func getAlertContent(message: String?, customMesg: String?, title: AlertTitle?,
                                 customTitle: String?) -> (String?, String?) {
    var mesg: String?
    var alertTitle: String?
    if let msg = message {
        mesg = msg
    } else {
        mesg = customMesg
    }
    if let str = title {
        alertTitle = str.toString()
    } else {
        alertTitle = customTitle
    }
    return (mesg, alertTitle)
}

func showAlertSingleButton(message: AlertMessage?, customMesg: String? = nil,
                           title: AlertTitle? = nil, customTitle: String? = nil,
                           button: AlertButton = .ok, completion:(() -> Void)? = nil ) {
    let (alertMesg, alertTitle) = getAlertContent(message: message, customMesg: customMesg,
                                                  title: title, customTitle: customTitle)
    let alert = CMAlertView()
    alert.title = alertTitle
    alert.message = alertMesg
    let buttonCap = button.toString()
    alert.cancelButton = buttonCap
    if let action = completion {
        let cancelAction: ((String, Int) -> Void) = { _, _ in
            action()
        }
        alert.buttonActions = [buttonCap: cancelAction]
    }
    alert.show(true)
}
//swiftlint:disable vertical_parameter_alignment
func showAlertSingleButtonString(message: String?, customMesg: String? = nil,
                           title: AlertTitle? = nil, customTitle: String? = nil,
                           button: AlertButton = .cancel, completion:(() -> Void)? = nil ) {
    let (alertMesg, alertTitle) = getAlertContent(message: message, customMesg: customMesg,
                                                  title: title, customTitle: customTitle)
    let alert = CMAlertView()
    alert.title = alertTitle
    alert.message = alertMesg
    let buttonCap = button.toString()
    alert.cancelButton = buttonCap
    if let action = completion {
        let cancelAction: ((String, Int) -> Void) = { _, _ in
            action()
        }
        alert.buttonActions = [buttonCap: cancelAction]
    }
    alert.show(true)
}

func showAlert2Buttons(message: AlertMessage?, customMesg: String? = nil,
                       title: AlertTitle? = nil, customTitle: String? = nil,
                       okButton: AlertButton = .ok, cancelButton: AlertButton = .cancel,
                       okAction: @escaping (() -> Void), cancelAction: (() -> Void)? = nil) {
    let (alertMesg, alertTitle) = getAlertContent(message: message, customMesg: customMesg,
                                                  title: title, customTitle: customTitle)
    let alert = CMAlertView()
    alert.title = alertTitle
    alert.message = alertMesg
    let cancelCap = cancelButton.toString()
    alert.cancelButton = cancelCap
    let okCap = okButton.toString()
    alert.otherButtons = [okCap]
    let okAct: ((String, Int) -> Void) = { _, _ in
        okAction()
    }
    var actions = [okCap: okAct]
    if let action = cancelAction {
        let cancelAct: ((String, Int) -> Void) = { _, _ in
            action()
        }
        actions[cancelCap] = cancelAct
    }
    alert.buttonActions = actions
    alert.show(true)
}

func showActionSheets(message: AlertMessage?, customMesg: String? = nil,
                      title: AlertTitle? = nil, customTitle: String? = nil,
                      cancelButton: AlertButton? = nil, cancelAction: (() -> Void)? = nil,
                      others: [(AlertButton, (() -> Void))]) {
    let (alertMesg, alertTitle) = getAlertContent(message: message, customMesg: customMesg,
                                                  title: title, customTitle: customTitle)
    let alert = CMAlertView(alertStyle: .actionSheet)
    alert.title = alertTitle
    alert.message = alertMesg
    alert.cancelButton = cancelButton?.toString()
    var actions = [String: (String, Int) -> Void]()
    if let caption = cancelButton?.toString(), let action = cancelAction {
        actions[caption] = {(_, _) in
            action()
        }
    }
    var othersButton = [String]()
    for (caption, action) in others {
        let cap = caption.toString()
        othersButton.append(cap)
        actions[cap] = {(_, _) in
            action()
        }
    }
    alert.otherButtons = othersButton
    alert.buttonActions = actions
    alert.show(true)
}

func showToast(_ message: AlertMessage) {
    CMToast.show(message.toString())
}

/**
 Hiển thị hộp thoại thông báo 1 nút bấm với tiêu đề "Lỗi"
 
 - Parameters:
 - message: Nội dung thông báo
 - completion: Hành động khi nhấn nút
 */
func showErrorAlert(message: String?, completion:(() -> Void)? = nil) {
    showAlertSingleButton(message: nil, customMesg: message, completion: completion)
}

//swiftlint:disable vertical_parameter_alignment
func showAlertNoButton(message: AlertMessage?, customMesg: String? = nil,
                                 title: AlertTitle? = nil, customTitle: String? = nil) {
    let (alertMesg, alertTitle) = getAlertContent(message: message, customMesg: customMesg,
                                                  title: title, customTitle: customTitle)
    let alert = CMAlertView()
    alert.title = alertTitle
    alert.message = alertMesg
    alert.show(true)
}
