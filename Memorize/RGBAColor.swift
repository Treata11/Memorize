//
//  RGBAColor.swift
//  Memorize
//
//  Created by Treata Norouzi on 7/10/23.
//

import SwiftUI

struct RGBAColor: Codable, Equatable, Hashable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}

struct RGBAGradient: Codable, Equatable, Hashable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    let colors: [RGBAColor]
}

extension RGBAGradient {
    init(rgbaGradient rgba: RGBAGradient) {
//        self.init(.sRGB, red: rgba.red, green: rgba.green, blue: rgba.blue, opacity: rgba.alpha)
        self.init(red: rgba.red, green: rgba.green, blue: rgba.blue, alpha: rgba.alpha, colors: rgba.colors)
    }
}

//extension RGBAGradient {
//    init(color: Color) {
//        var red: CGFloat = 0
//        var green: CGFloat = 0
//        var blue: CGFloat = 0
//        var alpha: CGFloat = 1
//        var colors: [RGBAColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)] = []
//        if let cgColor = color.cgColor {
//            UIColor(cgColor: cgColor).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//        }
//        self.init(
//            red: Double(red),
//            green: Double(green),
//            blue: Double(blue),
//            alpha: Double(alpha),
//            colors: [Color(rgbaColor: colors.first!) ]
//        )
//    }
//}

extension Color {
    init(rgbaColor rgba: RGBAColor) {
        self.init(.sRGB, red: rgba.red, green: rgba.green, blue: rgba.blue, opacity: rgba.alpha)
    }
}

extension RGBAColor {
    init(color: Color) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1
        if let cgColor = color.cgColor {
            UIColor(cgColor: cgColor).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        }
        self.init(red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
    }
}

extension RGBAColor {
    static let blue = RGBAColor(red: 0, green: 0, blue: 1, alpha: 1)
    static let cream = RGBAColor(red: 249/255, green: 223/255, blue: 205/255, alpha: 1)
    static let fuchsia = RGBAColor(red: 1, green: 0, blue: 1, alpha: 1)
    static let green = RGBAColor(red: 0, green: 1, blue: 0, alpha: 1)
    static let orange = RGBAColor(red: 1, green: 165/255, blue: 0, alpha: 1)
    static let pink = RGBAColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
    static let red = RGBAColor(red: 1, green: 0, blue: 0, alpha: 1)
    static let yellow = RGBAColor(red: 1, green: 1, blue: 0, alpha: 1)
}

extension Color {
    static func calculateGradient(with color: RGBAColor) -> [Color] {
        var colors: [Color] = []
//        let maxRGB = max(color.red, color.green, color.blue)
        if color.red > color.green, color.red > color.blue {
            colors = [
                Color(
                    red: 0.8 * color.red,
                    green: 0.9 * color.green,
                    blue: 0.9 * color.blue
                ),
                Color(rgbaColor: color),
                Color(
                    red: max(1.2 * color.red, color.red),
                    green: max(1.1 * color.green, color.green),
                    blue: max(1.1 * color.blue, color.blue)
                )
            ]
        }
        if color.green > color.red, color.green > color.blue {
            colors = [
                Color(
                    red: 0.9 * color.red,
                    green: 0.8 * color.green,
                    blue: 0.9 * color.blue
                ),
                Color(rgbaColor: color),
                Color(
                    red: max(0.9 * color.red, color.red),
                    green: max(1.2 * color.green, color.green),
                    blue: max(0.9 * color.blue, color.blue)
                )
            ]
        }
        if color.blue > color.red, color.blue > color.green {
            colors = [
                Color(
                    red: 1.1 * color.red,
                    green: 1.1 * color.green,
                    blue: 0.8 * color.blue
                ),
                Color(rgbaColor: color),
                Color(
                    red: 0.9 * color.red,
                    green: 0.9 * color.green,
                    blue: max(1.2 * color.blue, color.blue)
                )
            ]
        }
        return colors
    }
}
