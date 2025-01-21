//
//  WeatherResponse.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import Foundation

struct WeatherResponse: Codable, Equatable {
    let location: WeatherLocation
    let current: CurrentWeather
}

struct WeatherLocation: Codable, Equatable {
    let name: String
}

struct CurrentWeather: Codable, Equatable {
    let temp_c: Float
    let feelslike_c: Float
    let humidity: Int
    let uv: Float
    let condition: Condition
}

struct Condition: Codable, Equatable {
    let text: String
    let icon: String
}

let TEST_WEATHER_RESPONSE = WeatherResponse(location: WeatherLocation(name: "Denver"), current: CurrentWeather(temp_c: -8.3, feelslike_c: -13.1, humidity: 35, uv: 0.7, condition: Condition(text: "Partly cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png")))
