/**
 @file      NODConstants.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import Foundation
import UIKit
import RSUtils
import CMPopup
import APIRequestObject

/// Base API URL
//swiftlint:disable file_length
let kTimeSpalshShow         = 2.00
let kMaxLengthPassCode = 4
let kCountWrongPass         = 3
let kDBVersion: Int32       = 1
let kKeyEncrypte: [UInt8]   = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
let kScreenSize             = UIScreen.main.bounds.size
let kHomeSpecialRowHeight   = kScreenSize.width / 2.3
let kBannerCell: CGFloat    = 124.0
let kFontW3                 = "HiraKakuPro-W3"
let kFontW6                 = "HiraKakuPro-W6"
let kLineHeightMultiple: CGFloat = 1.5
let kLayoutTopGenre: CGFloat = 20
let kLimitItem              = 20
let kSpecialProgram         = "G2008003000MA000"
let kColorMissBanner        = RGB(255, 137, 40)
let kColorSpecialBanner     = RGB(0, 139, 205)
let kFormat                 = "yyyy-MM-dd HH:mm:ss"
let kFormatDateTokusen      = "yyyy/MM/dd"
let kNewsDateFormat         = "yyyyMMdd"
let kcellIdentifierContainerShow         = "ContainerShowTableViewCell"
var kDomain: UrlDomain!
let kcellIdentifierTopContentCell = "TopContentCell"
let kshowAlertHome = "showalerthome"
let kNSURLErrorDomain = "NSURLErrorDomain"
let kNSURLErrorNotConnectedToInternet = -1009
let kLimitMessageErrorPassCode: Int = 3
let kLimitMessageErrorGesture: Int = 3
let kFontHiraMinW3 = "HiraMinProN-W3"
let kMinCountRankGenreShow: Int = 10
let kMaxCountRankShow: Int = 20
let kIDG = "G"
let kImageMiss = "/material/goods/G2008000000MC000/img/G2008000000MC000_l.jpg"
let kImageSpecial = "/material/goods/G2008003000MA000/img/G2008003000MA000_l.jpg"
let kHeightForCellata: CGFloat = 110.0
let kSchemaLogin: String = "://login"
let kHeightForCellBannerBottom: CGFloat = 67

// limitNumber Home
let kLimitOfNumberHistoryProgramHome: Int = 10
let kLimitOfNumberFavoritedProgramHome: Int = 10
let kLimitOfNumberNewArrivalHome: Int = 10
let kLimitOfNumberNewsHome: Int = 10
let kLimitOfNumberSpecialSelectHozitalHome: Int = 10
let kLimitOfNumberRankingHome: Int = 20

//.news, .calendar, .series, .almostFinished, .newArrivals, .almostFinished
// limit Number Miss
let kLimitOfNumberNewsMiss: Int = 10
let kLimitOfNumberCalendarMiss: Int = 10
let kLimitOfNumberSeriesMiss: Int = 10
let kLimitOfNumberNewArrivalsMiss: Int = 10
let kLimitOfNumberAlmostFinishedMiss: Int = 10
let kLimitOfNumberRankingMissedMiss: Int = 20
let kLimitOfNumberGenSpec: Int = 10

let kSubCalenda = -4

// VoiceOver
let kAccessibilityLanguage = "ja-JP"
let kAccessibilityLanguageEn = "en-US"

// date
let kYear: Character = "年"
let kMonth: Character = "月"
let kDate: Character = "日"
let kSplit: Character = "-"

enum SeqType: String {
    case miss = "1"
    case special = "2"
    case nomal = "3"
}

enum ServiceKind: String {
    case packageMiss = "0"
    case packageSpecial = "1"
}

enum Division: String {
    case miss = "1"
    case special = "2"
}

enum ProgramFree: String {
    case free = "4"
    case none
}

enum ServiceMisSepara: String {
    case buyMiss = "1"
    case buySapara = "2"
}

enum IsPurchased: String {
    //swiftlint:disable identifier_name
    case yes
    case no
}

//ADBMobile
let kFirstApplicationRunDate        = "FIRST_APPLICATION_RUN_DATE"
let kLastApplicationRunDate         = "LAST_APPLICATION_RUN_DATE"
let kThisTimeApplicationRunDate     = "THISTIME_APPLICATION_RUN_DATE"
let kApplicationNameVersion         = "APPLICATION_NAME_VERSION"
let kLastVisit                      = "LAST_VISIT"
let kVisitNum                       = "VISIT_NUM"
let kADBMobileAppName               = "iOSアプリ"
let kDateFormatFull                 = "yyyy/MM/dd HH:mm:ss"

enum StatusBuy {
    case ignoring
    case glosbe
    case none
}

enum LockMode {
    case unlocked
    case locked
}

var lockMode: LockMode {
    return Defaults.shared().password.count == 0 ? .unlocked : .locked
}

enum UrlDomain: String {
    case main           = "https://www.nhk-ondemand.jp/"
    case stagemain      = "https://stage.nhk-ondemand.jp/"
    case t1main         = "https://t1-www.nhk-ondemand.jp/"
    case t1stagemain    = "https://t1-stage.nhk-ondemand.jp/"
    case tuimain        = "https://tui-www.nhk-ondemand.jp/"
    case tuistagemain   = "https://tui-stage.nhk-ondemand.jp/"
//    case fauth          = "http://fauth.nhk-ondemand.jp/"

    static func values() -> [UrlDomain] {
        return [.main, .stagemain, .t1main, .t1stagemain, .tuimain, .tuistagemain]
    }
}

enum KManual: String {
    case yes = "1"
    case no = "0"
}

enum Url {

    private static let map: [String: String] = [
        "apiSecurityCheck": "site_security_check",
        "apiRanking": "material/disp/screen/panel/img/A001_rankingList/ranking.xml",
        "apiPromoTop": "material/disp/screen/panel/img/A001_adviseProgram/top/promo_top_app.json",
        "apiDetailGoods": "goods/%@/",
        "apiSingleSaleList": "share/data/resources/csv/singlesalelist.csv",
        "apiRestrictionList": "share/data/resources/csv/restrictionlist.csv",
        "apiAddFavoriteItem": "user/purchasePlanList/entry/",
        "apiShareItem": "share/app/sns2.html?title=%@&id=%@&vid=%@",
        "apiPurchasePlanList": "user/purchasePlanList/view/",
        "apiSearchGoodsById2": "xml2/goods/",
        "apiSearchGoodsById3": "xml3/goods/",
        "apiPurchasePlanListDelete": "user/purchasePlanList/delete/",
        "apiUseHistory": "xml/useHistory/",
        "apiUserAvailableList": "user/availableList/",
        "apiNewArriMissed": "share/static/resources/xml/goods/topminogashinew.xml",
        "apiNewArriSeparately": "share/static/resources/xml/tokusen/lib_new_t.xml",
        "apiNewArPrioritizeMi": "material/disp/screen/panel/img/A001_adviseProgram/top/priority_minogashi_app.json",
        "apiNews": "news/view/",
        "apiShowOrderSpecial": "material/disp/screen/panel/img/A001_adviseProgram/top/display_order_app.json",
        "apiShowSpecial": "material/disp/screen/panel/img/A001_adviseProgram/top/special_app.json",
        "apiBanner": "material/disp/screen/panel/img/A001_adviseProgram/top/banner_app.json",
        "imgUrlFmtNews": "/share/smp/resources/player/news_image/%@.jpg",
        "apiSuggestGoods": "searchkeyword/suggest_goods.json",
        "apiSettingGenre": "share/app/resources/json/genre.json",
        "apiTokusetsu": "share/data/resources/json/tokusetsu.json",
        "apiMenu": "share/app/resources/json/menu.json",
        "apiSiteProgram": "xml2/siteProgram/",
        "apiService": "share/app/resources/xml/service.xml",
        "apiConfig": "share/app/resources/xml/config.xml",
        "apiRegister": "regist/entry/",
        "apiMypage": "share/app/restore.html",
        "apiMypage1": "share/app/mypage2.html",
        "apiForNewbie": "share/app/enjoy2.html",
        "apiRequirement": "share/app/requirement.html",
        "apiCommonQuestion": "share/app/faq2.html",
        "apiInquiry": "inquiry/",
        "apiGuide": "share/app/kiyaku2.html",
        "apiPrice": "share/app/price2.html",
        "apiPrivacy": "share/app/privacy2.html",
        "apiTokusho": "share/app/tokusho2.html",
        "apiAbout": "share/app/howto2.html",
        "apiChapterGoods": "share/data/resources/csv/chaptergoods.csv",
        "apiChapterLists": "share/data/resources/xml/%@.xml",

        //API for play video
        //UUID取得IF
        "apiUUID": "user/resUUID/",
        "apiGetPlayTime": "authap/web/service/service_PlayTimeWebService", //POST

        //HLS再生要求IF（新規）
        "apiServiceHLSUrl": "ios/service_iosPortalWebService/index.html", //GET
        "apiServiceHLSUrlTest": "static/hlstest/service_hlsPortalWebService", //GET
        //再生時間記録IF（既存）
        "apiSetPlayTime": "authap/web/service/SetPlayTime",
//        "apiSetPlayTime": "/authap/web/service", //POST
        "apiSetPlayTimeTest": "static/hlstest/SetPlayTime",
        "apiJsonNotice": "share/app/resources/xml/information.xml",
        "apiXmlAlert": "share/app/resources/xml/urgent_information.xml",
        //API for tokusenPromoTop banner miss
        "apiTokusenPromoTop": "material/disp/screen/panel/img/A001_adviseProgram/tokusen/promo_top_app.json",
        //API for priorityTokusen banner miss
        "apiPriorityTokusen": "material/disp/screen/panel/img/A001_adviseProgram/top/priority_tokusen_app.json",
        //API for tokusen_genre special select
        "apiTokusenGenre": "share/data/resources/json/tokusen_genre.json",
        "apiCancelPackage": "user/cancellation/confirm"
    ]

    case apiSecurityCheck
    /// API webView
    case apiPurchasePlanList
    case apiSearchGoodsById2
    case apiSearchGoodsById3
    case apiPurchasePlanListDelete
    case apiUseHistory
    case apiUserAvailableList
    case imgUrlFmtNews(String)
    case apiSuggestGoods
    case apiSettingGenre
    case apiTokusetsu
    case apiSiteProgram
    case apiRegister

    case apiRanking
    case apiPromoTop
    case apiNewArriMissed
    case apiNewArriSeparately
    case apiNewArPrioritizeMi
    case apiNews
    case apiShowOrderSpecial
    case apiShowSpecial
    case apiBanner
    case apiMenu
    case apiMypage
    case apiMypage1
    case apiForNewbie
    case apiRequirement
    case apiCommonQuestion
    case apiInquiry
    case apiGuide
    case apiPrice
    case apiPrivacy
    case apiTokusho
    case apiAbout
    case apiChapterGoods
    case apiChapterLists(String)

    /// API detail goods
    case apiDetailGoods(String)
    case apiSingleSaleList
    case apiRestrictionList
    case apiAddFavoriteItem
    case apiShareItem(String, String, String)

    ///API Playvideo
    case apiUUID
    case apiGetPlayTime
    case apiServiceHLSUrl
    case apiServiceHLSUrlTest
    case apiSetPlayTime
    case apiSetPlayTimeTest
    case apiJsonNotice
    case apiTokusenPromoTop
    case apiPriorityTokusen
    case apiTokusenGenre
    case apiXmlAlert
    case apiCancelPackage

    // Api kill switch
    case apiService
    case apiConfig

    func toString() -> String {
        var key = "\(self)"
        if let range = key.range(of: "(") {
            key = String(key[..<range.lowerBound])
        }
        let value = Url.map[key] ?? ""
        switch self {
        case .apiDetailGoods(let param):
            return String(format: value, param)
        case .apiShareItem(let title, let goodsid, let vid):
            return String(format: value, title, goodsid, vid)
        case .imgUrlFmtNews (let param), .apiChapterLists (let param):
            return String(format: value, param)
        default:
            return value
        }
    }
}

enum TypePortKillSwift {
    case AriPort
    case HDMI
    case RecordScreen
}

enum TypeItemMenu: Int {
    case listNoticeCell = 3
}

enum ListVideoType: Int {
    case siteProgram = 0
    case relatedGoods
    case ranking
}

enum SubTitleFlag: String {
    case normal = "1"
}
enum BuyType: Int {
    case singleItem = 0
    case unlimitted
}

enum TypeShow: String {
    case missed = "21"
    case separately = "22"
    case special
}

enum Code: String {
    case k000 = "000"
    case k400 = "400"
    case k401 = "401"
    case k402 = "402"
    case k900 = "900"
    case k901 = "901"
    case k902 = "902"
    case k999 = "999"
}

enum SearchOrder: String {
    case newArrival = "11"
    case popularity = "22"
    case programName = "33"
    case cancel = "44"
}

enum SearchDivison: String {
    case all = "11"
    case miss = "22"
    case special = "33"
    case free = "44"
}

enum Divison: String {
    case miss = "1"
    case special = "2"
}

enum Display: String {
    //swiftlint:disable identifier_name
    case yes = "1"
    case no = "0"
}

enum GenreGroup: String {
    case genre
    case group
}

enum HomeCell: String {
    case containerTableViewCell = "ContainerTableViewCell"
    case rankingMissed = "RankingMissed"
    case newArrivalsMissed = "NewArrivalsMissed"
    case rankingSeparately = "RankingSeparately"
    case newArrivalsSeparately = "NewArrivalsSeparately"
    case history = "History"
    case news = "News"
    case special = "Special"
    case favorite = "Favorite"
    case banner = "Banner"
    case genre = "Genre"
    case calendar = "Calendar"
    case series = "Series"
    case almostFinished = "AlmostFinished"
    case newArrivals = "NewArrivals"
    case rankingGenre = "RankingGenre"
}

enum DateType: Int {
    case year = 0
    case month = 1
    case date = 2
}
enum HLSStatus: String {
    case hls001 = "001"
    case hls000 = "000"
    case sectionIDFail = "400"
    case loginFail = "401"
    case notPurchased = "402"
    case configClientFail = "403"
    case productFail = "900"
    case iDProgramFail = "901"
    case ticketFail = "902"
    case otherError = "999"
}

enum SaleForm: String {
    case free = "4"
}

enum PackageBuy: String {
    case missed = "G2008000000MC000"
    case separately = "G2008003000MA000"
}

enum TabMenuContent: String {
    case home = "ホーム"
    case myContent = "マイコンテンツ"
    case miss = "見逃し"
    case news = "ニュース"
    case favorite = "お気に入り"
    case tokusetsu = "tokusetsu"
    case genre = "genre"
    case group
    case specialSelection = "特選ライブラリー"
    case unknown = "unknown"
    case other = "その他"
    case 無料 = "無料"
}

enum MenuApi: String {
    case menu
    case tokusetsu
    case genre
}

enum Save: String {
    case resetData
    case saveData
}

enum ADBMobileTrackId: String {
    case track01 = "track_0001"
    case track02 = "track_0002"
    case track03 = "track_0003"
    case track04 = "track_0004"
    case track05 = "track_0005"
    case track06 = "track_0006"
    case track07 = "track_0007"
    case track08 = "track_0008"
    case track09 = "track_0009"
    case track10 = "track_0010"
    case track11 = "track_0011"
    case track12 = "track_0012"
    case track13 = "track_0013"
    case track14 = "track_0014"
    case track15 = "track_0015"
    case track16 = "track_0016"
    case track17 = "track_0017"
    case track18 = "track_0018"
    case track19 = "track_0019"
    case track20 = "track_0020"
    case track21 = "track_0021"
    case track22 = "track_0022"
    case track23 = "track_0023"
    case track24 = "track_0024"
    case track25 = "track_0025"
    case track26 = "track_0026"
    case track27 = "track_0027"
    case track28 = "track_0028"
    case track29 = "track_0029"
    case track30 = "track_0030"
    case track31 = "track_0031"
    case track32 = "track_0032"
    case track33 = "track_0033"
    case track34 = "track_0034"
    case track35 = "track_0035"
    case track36 = "track_0036"
    case track37 = "track_0037"
    case track38 = "track_0038"
    case track39 = "track_0039"
    case track40 = "track_0040"
    case track41 = "track_0041"
    case track42 = "track_0042"
    case track43 = "track_0043"
    case track44 = "track_0044"
    case track45 = "track_0045"
    case track46 = "track_0046"
    case track47 = "track_0047"
    case track48 = "track_0048"
    case track49 = "track_0049"
    case track50 = "track_0050"
    case track51 = "track_0051"
    case track52 = "track_0052"
    case track53 = "track_0053"
    case track54 = "track_0054"
    case track55 = "track_0055"
    case track56 = "track_0056"
    case track57 = "track_0057"
    case track58 = "track_0058"
}

enum ADBMobileDicKey: String {
    case pageName
    case siteSection
    case siteSection2
}

enum Classes: String {
    case tokusetsu  = "TokusetsuVC"
    case genre      = "GenreVC"
}

enum ShareUrl: String {
    case twitter = "https://twitter.com"
    case facebook = "https://www.facebook.com"
    case google = "https://plus.google.com"
    case help = "https://www.nhk.or.jp"
}
