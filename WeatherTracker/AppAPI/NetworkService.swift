//
//  NetworkService.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/21/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(url: URL) async throws -> Data
}

class NetworkService: NetworkServiceProtocol {
    func fetchData(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw NetworkError.failedToFetchData
        }
    }
}

// This mock networking class will be used as a substitute
// in order to perform unit tests
class MockWeatherNetworkService: NetworkServiceProtocol {
    func fetchData(url: URL) async throws -> Data {
        return MOCK_WEATHER_JSON.data(using: .utf8)!
    }
}

let MOCK_WEATHER_JSON = """
{
    "location": {
        "name": "Denver",
        "region": "Colorado",
        "country": "United States of America",
        "lat": 39.7392,
        "lon": -104.9842,
        "tz_id": "America/Denver",
        "localtime_epoch": 1737475902,
        "localtime": "2025-01-21 09:11"
    },
    "current": {
        "last_updated_epoch": 1737475200,
        "last_updated": "2025-01-21 09:00",
        "temp_c": -8.3,
        "temp_f": 17.1,
        "is_day": 1,
        "condition": {
            "text": "Partly cloudy",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
            "code": 1003
        },
        "wind_mph": 6.0,
        "wind_kph": 9.7,
        "wind_degree": 207,
        "wind_dir": "SSW",
        "pressure_mb": 1018.0,
        "pressure_in": 30.06,
        "precip_mm": 0.0,
        "precip_in": 0.0,
        "humidity": 35,
        "cloud": 25,
        "feelslike_c": -13.1,
        "feelslike_f": 8.4,
        "windchill_c": -15.6,
        "windchill_f": 3.8,
        "heatindex_c": -9.8,
        "heatindex_f": 14.3,
        "dewpoint_c": -22.1,
        "dewpoint_f": -7.8,
        "vis_km": 16.0,
        "vis_miles": 9.0,
        "uv": 0.7,
        "gust_mph": 12.7,
        "gust_kph": 20.4
    }
}
"""
