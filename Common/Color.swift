/**
 @file      NODColor.swift
 @author    Tran Manh Hoang
 @date      2018/06/12

Copyright (c) 2018, Tran Manh Hoang
All rights reserved.

*/

import UIKit

extension UIColor {

    // swiftlint:disable:next function_parameter_count
    private static func makeColor(name: String?, colorSpace: String, red: CGFloat, green: CGFloat, blue: CGFloat, white: CGFloat, alpha: CGFloat) -> UIColor {
        if #available(iOS 11.0, *), let clName = name, let color = UIColor(named: clName) {
            return color
        }
        if #available(iOS 10.0, *), colorSpace == "display-p3" {
            return UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
        }
        if colorSpace == "gray-gamma-22" || colorSpace == "extended-gray" {
            return UIColor(white: white, alpha: alpha)
        }
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    /// Background For Icon Top Home Screen
    /// - universal: srgb #999999 100% "Silver Chalice"
    static var BackgroundForIconTopHomeScreen: UIColor {
        return makeColor(name: "Background For Icon Top Home Screen", colorSpace: "srgb", red: 0.6, green: 0.6, blue: 0.6, white: 0.0, alpha: 1.0)
    }

    /// Chapter Title Selected
    /// - universal: srgb #06A8A9 100% "Persian Green"
    static var ChapterTitleSelected: UIColor {
        return makeColor(name: "Chapter Title Selected", colorSpace: "srgb", red: 0.027, green: 0.659, blue: 0.663, white: 0.0, alpha: 1.0)
    }

    /// Chapter Title Unselected
    /// - universal: srgb #333333 100% "Mine Shaft"
    static var ChapterTitleUnselected: UIColor {
        return makeColor(name: "Chapter Title Unselected", colorSpace: "srgb", red: 0.2, green: 0.2, blue: 0.2, white: 0.0, alpha: 1.0)
    }

    /// Color For Title Header
    /// - universal: srgb #666666 100% "Boulder"
    static var ColorForTitleHeader: UIColor {
        return makeColor(name: "Color For Title Header", colorSpace: "srgb", red: 0.4, green: 0.4, blue: 0.4, white: 0.0, alpha: 1.0)
    }

    /// Dim
    /// - universal: srgb #4B4B4B 100% "Mine Shaft"
    static var Dim: UIColor {
        return makeColor(name: "Dim", colorSpace: "srgb", red: 0.294117647058824, green: 0.294117647058824, blue: 0.294117647058824, white: 0.0, alpha: 1.0)
    }

    /// Division Border
    /// - universal: srgb #CECECE 100% "Alto"
    static var DivisionBorder: UIColor {
        return makeColor(name: "Division Border", colorSpace: "srgb", red: 0.808, green: 0.808, blue: 0.808, white: 0.0, alpha: 1.0)
    }

    /// Division Selected Background
    /// - universal: srgb #666666 100% "Boulder"
    static var DivisionSelectedBackground: UIColor {
        return makeColor(name: "Division Selected Background", colorSpace: "srgb", red: 0.4, green: 0.4, blue: 0.4, white: 0.0, alpha: 1.0)
    }

    /// Favorite Selected
    /// - universal: srgb #FFD500 100% "Gold"
    static var FavoriteSelected: UIColor {
        return makeColor(name: "Favorite Selected", colorSpace: "srgb", red: 1.0, green: 0.835294117647059, blue: 0.0, white: 0.0, alpha: 1.0)
    }

    /// Flush Orange
    /// - universal: srgb #FF8403 100% "Flush Orange"
    static var FlushOrange: UIColor {
        return makeColor(name: "Flush Orange", colorSpace: "srgb", red: 1.0, green: 0.518, blue: 0.012, white: 0.0, alpha: 1.0)
    }

    /// Free Tab
    /// - universal: srgb #7EBD43 100% "Sushi"
    static var FreeTab: UIColor {
        return makeColor(name: "Free Tab", colorSpace: "srgb", red: 0.494117647058824, green: 0.741176470588235, blue: 0.262745098039216, white: 0.0, alpha: 1.0)
    }

    /// Half Backed
    /// - universal: srgb #6FC5C1 100% "Downy"
    static var HalfBacked: UIColor {
        return makeColor(name: "Half Backed", colorSpace: "srgb", red: 0.439, green: 0.773, blue: 0.757, white: 0.0, alpha: 1.0)
    }

    /// Home Menu Background
    /// - universal: srgb #E4E4E4 100% "Mercury"
    static var HomeMenuBackground: UIColor {
        return makeColor(name: "Home Menu Background", colorSpace: "srgb", red: 0.894117647058824, green: 0.894117647058824, blue: 0.894117647058824, white: 0.0, alpha: 1.0)
    }

    /// Home Tab Unselected
    /// - universal: srgb #B2B2B2 100% "Silver Chalice"
    static var HomeTabUnselected: UIColor {
        return makeColor(name: "Home Tab Unselected", colorSpace: "srgb", red: 0.698039215686274, green: 0.698039215686274, blue: 0.698039215686274, white: 0.0, alpha: 1.0)
    }

    /// Image Border
    /// - universal: srgb #CCCCCC 100% "Silver"
    static var ImageBorder: UIColor {
        return makeColor(name: "Image Border", colorSpace: "srgb", red: 0.8, green: 0.8, blue: 0.8, white: 0.0, alpha: 1.0)
    }

    /// Invalid Day Title
    /// - universal: srgb #C7C7C7 100% "Silver"
    static var InvalidDayTitle: UIColor {
        return makeColor(name: "Invalid Day Title", colorSpace: "srgb", red: 0.784, green: 0.784, blue: 0.784, white: 0.0, alpha: 1.0)
    }

    /// Lochmara
    /// - universal: srgb #018AD6 100% "Cerulean"
    static var Lochmara: UIColor {
        return makeColor(name: "Lochmara", colorSpace: "srgb", red: 0.004, green: 0.545, blue: 0.843, white: 0.0, alpha: 1.0)
    }

    /// Main
    /// - universal: srgb #F98800 100% "Pizazz"
    static var Main: UIColor {
        return makeColor(name: "Main", colorSpace: "srgb", red: 0.98, green: 0.537, blue: 0.0, white: 0.0, alpha: 1.0)
    }

    /// New Image Border
    /// - universal: srgb #CCCCCC 100% "Silver"
    static var NewImageBorder: UIColor {
        return makeColor(name: "New Image Border", colorSpace: "srgb", red: 0.8, green: 0.8, blue: 0.8, white: 0.0, alpha: 1.0)
    }

    /// News Title
    /// - universal: srgb #2BA5A5 100% "Keppel"
    static var NewsTitle: UIColor {
        return makeColor(name: "News Title", colorSpace: "srgb", red: 0.171, green: 0.649, blue: 0.65, white: 0.0, alpha: 1.0)
    }

    /// Option Button No Favorite
    /// - universal: srgb #C6C6C6 100% "Silver"
    static var OptionButtonNoFavorite: UIColor {
        return makeColor(name: "Option Button No Favorite", colorSpace: "srgb", red: 0.78, green: 0.78, blue: 0.78, white: 0.0, alpha: 1.0)
    }

    /// Overlay Background
    /// - universal: srgb #E5E5E5 100% "Mercury"
    static var OverlayBackground: UIColor {
        return makeColor(name: "Overlay Background", colorSpace: "srgb", red: 0.898039215686275, green: 0.898039215686275, blue: 0.898039215686275, white: 0.0, alpha: 1.0)
    }

    /// Ranking Genre Background
    /// - universal: srgb #333333 100% "Mine Shaft"
    static var RankingGenreBackground: UIColor {
        return makeColor(name: "Ranking Genre Background", colorSpace: "srgb", red: 0.2, green: 0.2, blue: 0.2, white: 0.0, alpha: 1.0)
    }

    /// Ranking Missed Background
    /// - universal: srgb #F98800 100% "Pizazz"
    static var RankingMissedBackground: UIColor {
        return makeColor(name: "Ranking Missed Background", colorSpace: "srgb", red: 0.98, green: 0.537, blue: 0.0, white: 0.0, alpha: 1.0)
    }

    /// Ranking Missed Title
    /// - universal: srgb #F98801 100% "Pizazz"
    static var RankingMissedTitle: UIColor {
        return makeColor(name: "Ranking Missed Title", colorSpace: "srgb", red: 0.977, green: 0.537, blue: 0.004, white: 0.0, alpha: 1.0)
    }

    /// Ranking Separately Background
    /// - universal: srgb #088BD0 100% "Lochmara"
    static var RankingSeparatelyBackground: UIColor {
        return makeColor(name: "Ranking Separately Background", colorSpace: "srgb", red: 0.035, green: 0.549, blue: 0.816, white: 0.0, alpha: 1.0)
    }

    /// Saturday Title
    /// - universal: srgb #0063FF 100% "Blue Ribbon"
    static var SaturdayTitle: UIColor {
        return makeColor(name: "Saturday Title", colorSpace: "srgb", red: 0.0, green: 0.392, blue: 1.0, white: 0.0, alpha: 1.0)
    }

    /// Selected
    /// - universal: srgb #C35F1B 100% "Orange Roughy"
    static var Selected: UIColor {
        return makeColor(name: "Selected", colorSpace: "srgb", red: 0.765, green: 0.373, blue: 0.106, white: 0.0, alpha: 1.0)
    }

    /// Sunday Title
    /// - universal: srgb #EC0000 100% "Red"
    static var SundayTitle: UIColor {
        return makeColor(name: "Sunday Title", colorSpace: "srgb", red: 0.929, green: 0.0, blue: 0.0, white: 0.0, alpha: 1.0)
    }

    /// UnSelected
    /// - universal: srgb #F88801 100% "Tangerine"
    static var UnSelected: UIColor {
        return makeColor(name: "UnSelected", colorSpace: "srgb", red: 0.976, green: 0.537, blue: 0.004, white: 0.0, alpha: 1.0)
    }

    /// Video Header Unselected Background
    /// - universal: srgb #DCDCDC 100% "Alto"
    static var VideoHeaderUnselectedBackground: UIColor {
        return makeColor(name: "Video Header Unselected Background", colorSpace: "srgb", red: 0.863, green: 0.863, blue: 0.863, white: 0.0, alpha: 1.0)
    }

    /// Video Title Selected
    /// - universal: srgb #FFFFFF 100% "White"
    static var VideoTitleSelected: UIColor {
        return makeColor(name: "Video Title Selected", colorSpace: "srgb", red: 1.0, green: 1.0, blue: 1.0, white: 0.0, alpha: 1.0)
    }

    /// Video Title Unselected
    /// - universal: srgb #000000 100% "Black"
    static var VideoTitleUnselected: UIColor {
        return makeColor(name: "Video Title Unselected", colorSpace: "srgb", red: 0.0, green: 0.0, blue: 0.0, white: 0.0, alpha: 1.0)
    }

}
