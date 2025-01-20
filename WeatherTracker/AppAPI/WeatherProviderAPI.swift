//
//  WeatherProviderAPI.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import Foundation
import Combine

class WeatherProviderAPI: WeatherProvider {
    static let key = "fbd4b585504e436d9dc182137252001"
    static let baseURL = "https://api.weatherapi.com/v1/current.json"
    
    static func constructRequestURL(city: String) -> URL? {
        return URL(string: "\(baseURL)?key=\(key)&q=\(city)&aqi=no")
    }
    
    func getCurrentWeather(for city: String) async throws -> WeatherResponse? {
        guard let requestURL = Self.constructRequestURL(city: city) else {
            throw NetworkError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: requestURL)
        guard let decodedData = try? JSONDecoder().decode(WeatherResponse.self, from: data) else {
            throw NetworkError.failedToDecodeData
        }
        return decodedData
    }
}
