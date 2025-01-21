//
//  WeatherProviderAPI.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import Foundation
import Combine

class WeatherProviderAPI: WeatherProvider {
    var networkService: NetworkServiceProtocol
    
    static let key = "fbd4b585504e436d9dc182137252001"
    static let baseURL = "https://api.weatherapi.com/v1/current.json"
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getCurrentWeather(for city: String) async throws -> WeatherResponse? {
        guard let requestURL = constructRequestURL(city: city) else {
            throw NetworkError.invalidURL
        }
        let data = try await networkService.fetchData(url: requestURL)
        return try decodeWeatherData(data)
    }
    
    private func constructRequestURL(city: String) -> URL? {
        return URL(string: "\(Self.baseURL)?key=\(Self.key)&q=\(city)&aqi=no")
    }
    
    private func decodeWeatherData(_ data: Data) throws -> WeatherResponse? {
        guard let decodedData = try? JSONDecoder().decode(WeatherResponse.self, from: data) else {
            throw NetworkError.failedToDecodeData
        }
        return decodedData
    }
}
