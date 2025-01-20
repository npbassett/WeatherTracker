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

let TEST_WEATHER_RESPONSE = WeatherResponse(location: WeatherLocation(name: "Hyderabad"), current: CurrentWeather(temp_c: 31, feelslike_c: 38, humidity: 20, uv: 4, condition: Condition(text: "Partly cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png")))
