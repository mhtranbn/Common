/**
 @file      NODText.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import UIKit

enum Text {
    
    case raw(Any?)
    
    // swiftlint:disable identifier_name
    case errorCountCharacter
    case errorConfirmPass
    
    case favoriteID
    case recentlyWatchedID
    case purchasedID
    case favoriteName
    case recentlyWatchedName
    case purchasedName
    
    case showListMyContentVC
    
    case titleGoodsDetail
    case titleGoodsDetailSpecial
    case subTitleFlag
    case programTimeView
    case viewPeriod
    case viewLimit
    case shareTitle
    case 配信期間
    case 視聴期限
    case まで

    case delete
    case missed
    case separately
    
    case errorMessageCode
    case rankingMissed
    case rankingSeparately
    
    case newArrivalsMissed
    case newArrivalsSeparately
    
    case newsFooterString1
    case newsFooterString2
    case newsFooterString3
    
    case titleSectionRanking
    case scheduleTitle
    
    case textMessageClearDataPassCode
    case textMessageClearDataGesture
    case textMessageFailDataGesture
    case textMessageFailDataPassCode
    case textMessageLoginFailGesture
    case textMessageLoginFailPassCode
    case textMessageLoginGestureSuccess
    case textMessageLoginPassCodeSuccess
    case textMessageGestureNotAvaliable
    case textMessagePassCodeNotAvaliable
    
    case textTitleRegisLoginFinger
    case txtTitleLoginPassCode
    case textTitleRegisLoginFaceID
    case textTileLoginSimpleFaceID
    case textTileButtonSimpleFaceID
    case textReason
    
    case textYear
    case textMonth
    case textDate

    case textCloseChapter
    case textOpenChapter

    case ホーム
    case 特設（オリンピック）
    case 見逃し
    case 特選
    case 特選ライブラリー
    case ドラマ
    case エンタメ
    case ドキュメンタリー
    case ニュース
    case 教養
    case キッズ／アニメ
    case 趣味／実用
    case 報道／スポーツ
    case 無料
    case 大河ドラマ
    case 連続テレビ小説
    case NHKスペシャル
    case お気に入り
    case お知らせ
    case その他
    case マイコンテンツ
    case のお知らせ
    case more
    case カレンダー
    case シリーズ番組
    case おもな番組・特集ジャンル
    case もうすぐ終了
    case 新着
    case ドキュメンタリー／教養
    case メニュー設定
    
    //other
    case マイページ
    case 初めての方へ
    case 推奨環境
    case よくある質問
    case お問い合わせ
    case 利用規約
    case 基準料金表
    case 個人情報保護について
    case 特定商取引に関する法律
    case ログアウト
     case AppVerSion
    case 使い方
    
    //Gesture Pass
    case gesture_err
    case gesture_err1
    case gesture_success
    case textTypeLoginTouchID
    case textTypeLoginFaceID

    // common: format of date string (mainly used for calendar, news, program information)
    case LS_DateFormat_Limit_yyyyMMddhhmm
    case LS_DateFormat_hmm
    case LS_DateFormat_Md
    case LS_DateFormat_MdEEE
    case LS_DateFormat_EEE
    case LS_DateFormat_MdEEEhmm
    case LS_DateFormat_OnAir_Passed
    case LS_DateFormat_OnAir_Special
    case LS_DateFormat_Period_yyyyMMdd
    case DateFormat_yyyyMMdd
    case DateFormat_yyyyMMdd2
    case DateFormat_yyyyMMddHHmmss
    case DateFormat_yyyyMMddHH
    case DateFormat_yyyy年MM月
    case DateFormat_yyyy_MM_dd_HH_mm_ss
    case DateFormat_MM月dd日
    case DateFormat_MM月dd日2
    case LS_DateFormat_yyyy年
    case DateFormat_yyyyMMdd1
    case DateFormat_custom
    case DateFormat_custom1
    case Date_Miss
    case Date_Special
    // Home
    case EditorPickUp
    
    case 最近視聴した番組
    case 見逃しランキング
    case 特選ランキング
    case 見逃し新着
    case 特選新着

    case 位20位
    case 本
    case 位
    // Authen
    
    case ジェスチャーを
    case 確認のため
    case 会員登録画面
    
    // Chapter
    case noIcon
    case audioIcon
    case icon
    case audio
    case emptyString
    case インフォメーション
    case サブジャンル
    case ランキング
    case あと
    case 日
    case カテゴリー

    case 字幕
    case all
    case shareOpenAlert

    //VoiceOver
    case logo
    case iconSearch
    case menu
    case loginLogo
    case closeButtonNotificationPopup
    case checkImagePopup
    case favoriteButton
    case shareButton
    case playNew
    case checkBoxVoice
    case messageClearLogin
    case otherVoice
    case showChapter
    case パスワードを登録
    case ジェスチャーを登録
    
    //ADBMobile
    case firstVisit
    case sameDay
    case new
    case repeatS
    case loyal
    case 以前
    
    case rankingButtonDetailGoodMiss
    case rankingButtonDetailGoodSpecial
    case 購入日時
    case 試聴期限
    case 解約済み
    case 見放題パック
    case genreRank
    case multilogin
    
    private func castToString(_ any: Any?) -> String {
        if let obj = any {
            return "\(obj)"
        }
        return ""
    }
    
    private func localizeMe() -> String {
        var key = "\(self)"
        if let range = key.range(of: "(") {
            key = String(key[..<range.lowerBound])
        }
        return NSLocalizedString(key, comment: "")
    }
    
    func toString() -> String {
        let localMe = localizeMe()
        switch self {
        case .raw(let param):
            return castToString(param)
        default:
            return localMe
        }
    }
    
}

extension UILabel {
    func setCCText(_ text: Text) {
        self.text = text.toString()
    }
}

extension UIButton {
    func setUCTitle(_ title: Text, for state: UIControlState) {
        self.setTitle(title.toString(), for: state)
    }
}
