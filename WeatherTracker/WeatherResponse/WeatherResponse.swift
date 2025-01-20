//
//  WeatherResponse.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import Foundation

struct WeatherResponse: Codable {
    let location: WeatherLocation
    let current: CurrentWeather
}

struct WeatherLocation: Codable {
    let name: String
}

struct CurrentWeather: Codable {
    let temp_c: Float
    let feelslike_c: Float
    let humidity: Int
    let uv: Float
    let condition: Condition
}

struct Condition: Codable {
    let text: String
    let icon: String
}
