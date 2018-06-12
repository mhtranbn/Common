/**
 @file      NODDefaults.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import CMDefaults
import ObjCRuntimeWrapper

class Defaults: CMDefaults, CMDefaultsTransformValue {

    private let transformedProperties: [String] = ["homeSettings", "homeTabItems", "dataConfig", "homeTabItemsDefault"]

    /// Thông tin của người dùng hiện tại (các thuộc tính của `CurrentUser`)
    @objc dynamic var userData: [String: Any]?
    /// APNS token
    @objc dynamic var apnsToken: String?
    /// APNS token đã được gửi lên server hay chưa
    @objc dynamic var apnsTokenSend: Bool = false
    /// ID
    @objc dynamic var user: [UInt8] = []
    /// Pass
    @objc dynamic var pass: [UInt8] = []
    /// Password
    @objc dynamic var password: [UInt8] = []
    /// Parity
    @objc dynamic var parity: [UInt8] = []
    /// Parity
    @objc dynamic var cookie: Data?
    /// Cấu hình chung cho app
    @objc dynamic var type: String?
    @objc dynamic var clientID: String?
    /// Thông tin cài đặt paging menu
    @objc dynamic var homeSettings: [SettingItem]?
    /// Thông tin data khi load config
    @objc dynamic var dataConfig: LoadConfig?

    @objc dynamic var homeTabItems: [TabItem]?
    @objc dynamic var homeTabItemsDefault: [TabItem]?
    
    //ADBMoible
    @objc dynamic var thisTimeApplicationRunDate: Date?
    @objc dynamic var firstApplicationRunDate: Date?
    @objc dynamic var lastApplicationRunDate: Date?
    @objc dynamic var lastVisit: String?
    @objc dynamic var visitNum: String?

    // check video is purchased
    @objc dynamic var isPurchased: String?
    
    // alert List
    @objc dynamic var isShowAlertHome: Bool = false
    
    //startDate, endDate
    @objc dynamic var fisrtInstallApplication: Bool = true
    @objc dynamic var startDateShowAlertHome: String?
    @objc dynamic var endDateShowAlertHome: String?

    func shouldTransformValue(ofProperty propertyName: String) -> Bool {
        return transformedProperties.contains(propertyName)
    }

    private func transformedValueOfHomeSettings(value: Any, isSaving: Bool) -> Any? {
        if isSaving, let items = value as? [SettingItem] {
            return OBJProperty.dictionaries(from: items, rootClass: nil)
        } else if let data = value as? [[String: Any]] {
            var result = [SettingItem]()
            for dic in data {
                let item = SettingItem()
                OBJProperty.fillData(into: item, from: dic)
                result.append(item)
            }
        }
        return nil
    }

    private func transformedValueOfTabItems(value: Any, isSaving: Bool) -> Any? {
        if isSaving, let items = value as? [TabItem] {
            return OBJProperty.dictionaries(from: items, rootClass: nil)
        } else if let data = value as? [[String: Any]] {
            var result = [TabItem]()
            for dic in data {
                let item = TabItem()
                OBJProperty.fillData(into: item, from: dic)
                result.append(item)
            }
            return result
        }
        return nil
    }
    
    private func transformedValueOfDataConfig(value: Any, isSaving: Bool) -> Any? {
        if isSaving, let item = value as? LoadConfig {
            return OBJProperty.dictionary(from: item, rootClass: nil)
        } else if let data = value as? [String: Any] {
            return OBJProperty.object(from: LoadConfig.classForCoder(), from: data)
        }
        return nil
    }
    
    func transformedValue(_ value: Any, ofOfProperty propertyName: String, isSaving: Bool) -> Any? {
        switch propertyName {
        case transformedProperties[0]:
            return transformedValueOfHomeSettings(value: value, isSaving: isSaving)
        case transformedProperties[1], transformedProperties[3]:
            return transformedValueOfTabItems(value: value, isSaving: isSaving)
        case transformedProperties[2]:
            return transformedValueOfDataConfig(value: value, isSaving: isSaving)
        default:
            return nil
        }
    }
    
    override func authorizeKey(_ key: String) -> String {
        // Các key không cần lưu theo user id
        if key == "userData" { return key }
        return key
    }
    
}
