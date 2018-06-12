/**
 @file      NODDataManager.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private func getJSONFromUrl(_ resource: String, completion: @escaping (_ data: Data?) -> Void) {
        if let filepath = Bundle.main.path(forResource: resource, ofType: "json") {
            let url = URL(fileURLWithPath: filepath)
            do {
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                completion(data)
            } catch {
                completion(nil)
            }
        }
    }
    
    func getPagingMenu(completion: @escaping (_ data: [SettingItem]) -> Void) {
        getJSONFromUrl("SettingContent") { data in
            var arrItems: [SettingItem] = []
            do {
                if let data = data, let arrDicts = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]] {
                    for dict in arrDicts {
                        let item = SettingItem.parseSettingItem(dict: dict)
                        arrItems.append(item)
                    }
                    completion(arrItems)
                }
            } catch {
                completion(arrItems)
            }
        }
    }
}
