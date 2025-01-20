//
//  Color+Extensions.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import Foundation
import SwiftUI

public extension Color {
    static func fromHex(_ hexString: String) -> Color {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        return Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}

public extension Color {
    static let Background = Color.fromHex("#F2F2F2")
    static let CityWeatherSubviewTitleText = Color.fromHex("#C4C4C4")
    static let CityWeatherSubviewValueText = Color.fromHex("#9A9A9A")
}
