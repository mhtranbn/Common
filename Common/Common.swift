/**
 @file      NODCommon.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import UIKit
import CMPopup
import RSUtils
import SWUtils

//swiftlint:disable file_length
func localString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

func openUrl(_ urlStr: String) -> Bool {
    if let url = URL(string: urlStr), UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
            return true
        } else {
            return UIApplication.shared.openURL(url)
        }
    }
    return false
}

func decimalStrings(_ result: NSNumber) -> String? {
    let numberFormatter: NumberFormatter = NumberFormatter()
    numberFormatter.groupingSeparator = "."
    numberFormatter.groupingSize = 3
    numberFormatter.usesGroupingSeparator = true
    return numberFormatter.string(from: result)
}

func timeWithTimeZoneJP(timeFrom time: String?, withFormat format: String) -> NSDate? {
    return NSDate(timeFrom: time, withFormat: format, calendarType: NSCalendar.Identifier.gregorian.rawValue, timezoneWitSecondsFromGMT: 0, localeIdentifier: "ja_JP")
}

func stringWithTimeZoneJP(date: NSDate, format: String) -> String? {
    return date.string(withFormat: format, calendarType: NSCalendar.Identifier.gregorian.rawValue, timezoneWitSecondsFromGMT: 0, localeIdentifier: "ja_JP")
}

func timeWithNewFormat(time: NSDate, format: String) -> NSDate? {
    if let strDate = time.string(withFormat: format) {
        return timeWithTimeZoneJP(timeFrom: strDate, withFormat: format)
    }
    return nil
}

func timeWithNewFormatByZone(time: NSDate, format: String) -> NSDate? {
    if let strDate = time.string(withFormat: format) {
        return timeWithTimeZoneJPByZone(timeFrom: strDate, withFormat: format)
    }
    return nil
}

func timeWithTimeZoneJPByZone(timeFrom time: String?, withFormat format: String) -> NSDate? {
    return NSDate(timeFrom: time, withFormat: format, calendarType: NSCalendar.Identifier.gregorian.rawValue, timezoneWitSecondsFromGMT: -TimeZone.current.secondsFromGMT(), localeIdentifier: "ja_JP")
}

func getCurrentLocalDate() -> Date {
    var now = Date()
    var nowComponents = DateComponents()
    let calendar = Calendar.current
    nowComponents.year = Calendar.current.component(.year, from: now)
    nowComponents.month = Calendar.current.component(.month, from: now)
    nowComponents.day = Calendar.current.component(.day, from: now)
    nowComponents.hour = Calendar.current.component(.hour, from: now)
    nowComponents.minute = Calendar.current.component(.minute, from: now)
    nowComponents.second = Calendar.current.component(.second, from: now)
    nowComponents.timeZone = TimeZone(abbreviation: "GMT")!
    now = calendar.date(from: nowComponents)!
    return now as Date
}

func dateTimeFormartNotice(datestr: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = Text.DateFormat_yyyy_MM_dd_HH_mm_ss.toString()//"yyyy-MM-dd HH:mm:ss"
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.date(from: datestr) ?? Date()
}

func dayWithOffset(date: Date, offset: Int) -> Date? {
    let dateComponent = DateComponents(day: offset)
    return Calendar.current.date(byAdding: dateComponent, to: date)
}

func thumbnailImageViewSetURL(url: String, thumbnailImageView: UIImageView) {
    thumbnailImageView.sd_setShowActivityIndicatorView(true)
    thumbnailImageView.sd_setIndicatorStyle(.gray)
    thumbnailImageView.sd_setImage(with: URL(string: kDomain.rawValue + url), placeholderImage: #imageLiteral(resourceName: "no-image"))
}

func saveStartDateAndEndDate(startDate: String, endDate: String, startTime: String, endTime: String) {
    Defaults.shared().startDateShowAlertHome = startDate + " " + startTime
    Defaults.shared().endDateShowAlertHome = endDate + " " + endTime
}

func checkPurchasePlanList(status: Code) {
    switch status {
    case .k900:
        showAlertSingleButton(message: .purchasePlanList900, customMesg: nil, title: nil, customTitle: nil, button: .ok, completion: {
            CurrentUser.shared.logoutSimple()
        })
    case .k401:
        showAlertSingleButton(message: .purchasePlanList401, button: .ok, completion: nil)
    case .k402:
        showAlertSingleButton(message: .purchasePlanList402, button: .ok, completion: nil)
    case .k901:
        showAlertSingleButton(message: .purchasePlanList901, button: .ok, completion: nil)
    case .k902:
        showAlertSingleButton(message: .purchasePlanList902, button: .ok, completion: nil)
    case .k999:
        showAlertSingleButton(message: .purchasePlanList999, button: .ok, completion: nil)
    default:
        showAlertSingleButton(message: .purchasePlanList999, button: .ok, completion: nil)
    }
}

func checkApiServiceHLSUrl(code: HLSStatus) {
    switch code {
    case .sectionIDFail:
        showAlertSingleButton(message: .sectionIDFail, button: .ok, completion: {
            CurrentUser.shared.logoutSimple()
        })
    case .loginFail:
        showAlertSingleButton(message: .loginFail, button: .ok, completion: nil)
    case .notPurchased:
        showAlertSingleButton(message: .notPurchased, button: .ok, completion: nil)
    case .configClientFail:
        showAlertSingleButton(message: .configClientFail, button: .ok, completion: nil)
    case .productFail:
        showAlertSingleButton(message: .productFail, button: .ok, completion: nil)
    case .iDProgramFail:
        showAlertSingleButton(message: .iDProgramFail, button: .ok, completion: nil)
    case .ticketFail:
        showAlertSingleButton(message: .ticketFail, button: .ok, completion: nil)
    case .otherError:
        showAlertSingleButton(message: .otherError, button: .ok, completion: nil)
    default:
        showAlertSingleButton(message: .transmissionError, button: .ok, completion: nil)
    }
}

//swiftlint:disable cyclomatic_complexity
func getDateForTypeText(dateStr: String, seq: SeqType) -> String {
    var year: Int?
    var month: Int?
    var date: Int?
    var strDate: String = ""
    var textCenterDate: Substring = ""
    
    let arrayYear = dateStr.split(separator: kYear)
    if let  yearItem = arrayYear.first {
        year = Int(yearItem)
    }
    
    if let  textCenterDateItem = arrayYear.last {
        textCenterDate = textCenterDateItem
    }
    if let monthItem = textCenterDate.split(separator: kMonth).first {
        month = Int(monthItem)
    }
    
    if let textDate = textCenterDate.split(separator: kMonth).last, let dateItem = textDate.split(separator: kDate).first {
        date = Int(dateItem)
    }
    
    switch seq {
    case .miss:
        if let month = month {
            strDate += "\(month)" + Text.textMonth.toString()
        }
        if let date = date {
            strDate += "\(date)" + Text.textDate.toString()
        }
    case .special:
        if let year = year {
            strDate = "\(year)" + Text.textYear.toString()
        }
    default:
        strDate = dateStr
    }
    
    if strDate == "" {
        strDate = dateStr
    }
    return strDate
}

func getDate(dateStr: String, seq: Division) -> String {
    var year: Int?
    var month: Int?
    var date: Int?
    var strDate: String = ""
    
    let arrayYear = dateStr.split(separator: kSplit)
    
    for index in 0..<arrayYear.count {
        if let item = DateType(rawValue: index) {
        switch item {
        case .year:
            year = Int(arrayYear[index])
        case .month:
            month = Int(arrayYear[index])
        default:
            date = Int(arrayYear[index])
         }
        }
    }
    
    switch seq {
    case .miss:
        if let month = month {
            strDate += "\(month)" + Text.textMonth.toString()
        }
        if let date = date {
            strDate += "\(date)" + Text.textDate.toString()
        }
    default:
        if let year = year {
            strDate = "\(year)" + Text.textYear.toString()
        }
    }
    return strDate
}

func formatTimeForSeq(time: String, type: SeqType, formatDate: String?) -> String {
    var timeShow: String = ""
    var timeText: String = ""
    switch type {
    case .miss:
        timeText = getDateForTypeText(dateStr: time, seq: .miss)
    default:
        timeText = getDateForTypeText(dateStr: time, seq: .special)
    }
    if timeText != "" {
        timeShow = timeText
    } else if let date = timeWithTimeZoneJP(timeFrom: timeText, withFormat: Text.DateFormat_yyyyMMddHHmmss.toString()), let timeShowFomart = date.string(withFormat: formatDate ?? Text.LS_DateFormat_Md.toString()) {
        timeShow =  timeShowFomart
    } else {
        timeShow = time
    }
    return timeShow
}

extension Dictionary where Value: Equatable {
    func allKeys(forValue val: Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}

extension Notification.Name {
    static let pagingMenu = Notification.Name("pagingMenu")
}

extension UIImageView {
    func setImageWithPlaceHolder(strUrl: String) {
        self.sd_setImage(with: URL(string: kDomain.rawValue + strUrl), placeholderImage: #imageLiteral(resourceName: "img_placeholder"))
    }
}

extension String {
    func capturedGroups(withRegex pattern: String) -> [String] {
        var results = [String]()
        
        var regex: NSRegularExpression
        do {
            regex = try NSRegularExpression(pattern: pattern, options: [])
        } catch {
            return results
        }
        
        let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        
        guard let match = matches.first else { return results }
        
        let lastRangeIndex = match.numberOfRanges - 1
        guard lastRangeIndex >= 1 else { return results }
        
        for i in 1...lastRangeIndex {
            let capturedGroupIndex = match.range(at: i)
            let matchedString = (self as NSString).substring(with: capturedGroupIndex)
            results.append(matchedString)
        }
        
        return results
    }
    
    func stringByReplacingFirstOccurrenceOfString(
        target: String, withString replaceString: String) -> String {
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }
    
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedStringKey.font: font])
    }
}

extension UIViewController {
    var className: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
    
    func setData() {
        AppDelegate.app.sizeArrayDiction[self.className] = AppDelegate.app.sizeArray
        AppDelegate.app.sizeArray.removeAll()
    }
}

extension Date {
    
    func getDayOfDate() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let day = dateFormatter.string(from: self)
        return Int(day) ?? 0
    }
    
}

extension UIButton {
    
    @objc func set(image anImage: UIImage?, title: String, titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState) {
        imageView?.contentMode = .center
        setImage(anImage, for: state)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        titleLabel?.contentMode = .center
        setTitle(title, for: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode, spacing: CGFloat) {
        let imageRect: CGRect = self.imageRect(forContentRect: frame)
        
        // Use predefined font, otherwise use the default
        let titleFont: UIFont = titleLabel?.font ?? UIFont()
        let titleSize: CGSize = title.size(withAttributes: [NSAttributedStringKey.font: titleFont])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch position {
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageRect.height + titleSize.height + spacing), left: -(imageRect.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageRect.height + titleSize.height + spacing), left: -(imageRect.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageRect.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}

extension NSDictionary {
    func getDoubleValue(key: String) -> Double {
        if let any: Any = self[key] {
            if let number = any as? NSNumber {
                return number.doubleValue
            } else if let str = any as? NSString {
                return str.doubleValue
            }
        }
        return 0
    }
    
    func getStringValue(key: String) -> String {
        if let any: Any = self[key] {
            if let number = any as? NSNumber {
                return number.stringValue
            } else if let str = any as? String {
                return str
            }
        }
        return ""
    }
}

extension String {
    func dropLast(_ number: Int = 1) -> String {
        return String(dropLast(number))
    }
    var dropLast: String {
        return dropLast()
    }
    
    subscript(value: PartialRangeUpTo<Int>) -> Substring {
        get {
            return self[..<index(startIndex, offsetBy: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeThrough<Int>) -> Substring {
        get {
            return self[...index(startIndex, offsetBy: value.upperBound)]
        }
    }
    
    subscript(value: PartialRangeFrom<Int>) -> Substring {
        get {
            return self[index(startIndex, offsetBy: value.lowerBound)...]
        }
    }
}

// get value minisecond, second ...
func getTimeFromStringToSecond(_ firstIndex: Int, _ secondIndex: Int, _ value: String) -> Double {
    let range = String.Index(encodedOffset: firstIndex)..<String.Index(encodedOffset: secondIndex)
    guard let doubleNum = NumberFormatter().number(from: String(value[range])) else {
        return 0
    }
    return doubleNum.doubleValue
}

// get time by second here to player seek to
func getTimeToSeek(_ value: String) -> Double {
    return getTimeFromStringToSecond(6, 8, value) / 1000 + getTimeFromStringToSecond(4, 6, value) + getTimeFromStringToSecond(2, 4, value) * 60 + getTimeFromStringToSecond(0, 2, value) * 3600
}

//comapre date by day
func datesIsEquals(date1: Date, date2: Date) -> Bool {
    var calendar = NSCalendar.current
    calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
    let order = calendar.compare(date1, to: date2, toGranularity: .day)
    return order == .orderedSame
}

//comapre date by day
func comapreDatesByDay(date1: Date, date2: Date) -> ComparisonResult {
    var calendar = NSCalendar.current
    calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
    return calendar.compare(date1, to: date2, toGranularity: .day)
}

// get difference in days.
extension Date {
    func daysBetweenDate(toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    func getNextMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }
    
    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
}

func getDateWithSpecialType(dateStr: String, type: Division) -> String {
    if timeWithTimeZoneJP(timeFrom: dateStr, withFormat: Text.LS_DateFormat_Md.toString()) != nil && type == .miss {
        return dateStr
    }
    
    if timeWithTimeZoneJP(timeFrom: dateStr, withFormat: Text.LS_DateFormat_OnAir_Special.toString()) != nil && type == .special {
        return dateStr
    }
    
    if timeWithTimeZoneJP(timeFrom: dateStr, withFormat: Text.DateFormat_yyyyMMdd.toString()) != nil {
        let date = dateStr.split(separator: "-")
        if date.count == 3 {
            switch type {
            case .miss:
                if let day = Int(date[2]), let month = Int(date[1]) {
                    return String(format: Text.Date_Miss.toString(), month as CVarArg, day as CVarArg)
                }
            case .special:
                return String(format: Text.Date_Special.toString(), date[0] as CVarArg)
            }
            
        }
    }
    
    if timeWithTimeZoneJP(timeFrom: dateStr, withFormat: Text.LS_DateFormat_OnAir_Passed.toString()) != nil {
        let date = dateStr.split(separator: kYear)
        if date.count == 2,
            let year = date.first,
            let dateTime = date.last {
            let dateTimeArr = dateTime.split(separator: kMonth)
            switch type {
            case .miss:
                let monthStr = dateTimeArr[0]
                let dayStr = dateTimeArr[1].split(separator: kDate).first ?? ""
                if let day = Int(dayStr), let month = Int(monthStr) {
                    return String(format: Text.Date_Miss.toString(), month as CVarArg, day as CVarArg)
                }
            case .special:
                return String(format: Text.Date_Special.toString(), year as CVarArg)
            }
        }
    }
    
    return dateStr
}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

extension Array {
    
    //lấy number random element in array
    mutating func subScript(_ number: Int) -> Array {
        let numB = number > count ? count:number
        for i in 0..<numB {
            let randomNumber = arc4random_uniform(UInt32(count - 1 - i))
            let index = Int(randomNumber) + i
            swapAt(i, index)
        }
        return Array(self.prefix(number))
    }
}

func readFile(_ nameFile: String, _ type: String) -> Data {
    var result = Data()
    if let url = Bundle.main.url(forResource: nameFile, withExtension: type) {
        do {
            result = try Data(contentsOf: url)
        } catch {
            CMLog(error)
        }
    }
    return result
}
