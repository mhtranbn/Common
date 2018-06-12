/**
 @file      NODCookieHelper.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import UIKit
import CMDefaults

class CookieHelper: NSObject {
    
    class func arrayOfCookies() -> [Any] {
        let aStorage = HTTPCookieStorage.shared
        let cookies = aStorage.cookies
        return cookies ?? [Any]()
    }
    
    class func clearCookie(withDomain domain: String) {
        let aStorage = HTTPCookieStorage.shared
        guard let cookies = aStorage.cookies else {return}
        for aCookie: HTTPCookie in cookies {
            var prop = aCookie.properties
            //swiftlint:disable colon
            guard let cookieDomain = prop?[.domain] as? String, var pro = prop, let newCookie = HTTPCookie(properties: prop ?? [HTTPCookiePropertyKey : Any]()), cookieDomain == domain else {return}
            pro[.value] = ""
            pro[.expires] = Date(timeIntervalSinceNow: -3600)
            aStorage.deleteCookie(aCookie)
            aStorage.setCookie(newCookie)
        }
    }
    
    class func clearCookie() {
        let storage = HTTPCookieStorage.shared
        guard let cookies = storage.cookies else {return}
        for i in 0..<cookies.count {
            let cookie = cookies[i]
            storage.deleteCookie(cookie)
        }
    }
    
    class func deleteCookie() {
        Defaults.shared().cookie = nil
    }
    
    class func loadCookie() {
        var cookies = HTTPCookieStorage.shared.cookies!
        var tempCookies = cookies
        for cookie: HTTPCookie in cookies {
            if cookie.name == "EnvSwitch" || cookie.name == "clientid" {
                if cookie.name == "clientid", Defaults.shared().clientID == nil {
                    Defaults.shared().clientID = cookie.value
                }
                _ = tempCookies.remove(cookie)
            }
        }
        cookies = tempCookies
        cookies.append(setCookieEnvSwitch())
        if Defaults.shared().clientID != nil {
            cookies.append(setCookieClientID())
        }
        if let data = Defaults.shared().cookie, let cookiess = NSKeyedUnarchiver.unarchiveObject(with: data) as? [HTTPCookie] {
            for cookie: HTTPCookie in cookiess {
                cookies.append(cookie)
            }
        }
//        clearCookie()
        for cookie: HTTPCookie in cookies {
            HTTPCookieStorage.shared.setCookie(cookie)
        }
    }
    
    class func saveCookie() {
        Defaults.shared().cookie = NSKeyedArchiver.archivedData(withRootObject: HTTPCookieStorage.shared.cookies ?? [HTTPCookie]())
    }
    
    class func setCookieEnvSwitch() -> HTTPCookie {
        let domain = kDomain.rawValue
        let path = "/"
        let cookieExpiresInterval = 30.0 * 24.0 * 60.0 * 60.0
        let expiresDate = NSDate(timeIntervalSinceNow: cookieExpiresInterval)
        let expires = expiresDate.string(withFormat: kFormat)
        var properties = [HTTPCookiePropertyKey: Any]()
        properties[.value] = "_app"
        properties[.name] = "EnvSwitch"
        properties[.domain] = domain
        properties[.expires] = expires
        properties[.path] = path
        return HTTPCookie(properties: properties)!
    }
    
    class func setCookieClientID() -> HTTPCookie {
        let domain = kDomain.rawValue
        let path = "/"
        let cookieExpiresInterval = 30.0 * 24.0 * 60.0 * 60.0
        let expiresDate = NSDate(timeIntervalSinceNow: cookieExpiresInterval)
        let expires = expiresDate.string(withFormat: kFormat)
        var properties = [HTTPCookiePropertyKey: Any]()
        properties[.value] = Defaults.shared().clientID
        properties[.name] = "clientid"
        properties[.domain] = domain
        properties[.expires] = expires
        properties[.path] = path
        return HTTPCookie(properties: properties)!
    }

}
