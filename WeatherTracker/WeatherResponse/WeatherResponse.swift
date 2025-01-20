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

let TEST_WEATHER_RESPONSE = WeatherResponse(location: WeatherLocation(name: "Denver"), current: CurrentWeather(temp_c: 0, feelslike_c: 0, humidity: 50, uv: 1.0, condition: Condition(text: "Partly cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png")))
