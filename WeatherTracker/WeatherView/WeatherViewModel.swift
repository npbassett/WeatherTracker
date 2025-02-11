//
//  WeatherViewModel.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import Foundation

enum ViewSelection {
    case noCitySelected
    case citySelected
    case searchingForCity
}

protocol WeatherProvider {
    func getCurrentWeather(for city: String) async throws -> WeatherResponse?
}

@MainActor
class WeatherViewModel: ObservableObject {
    private var savedCity: String?
    private var weatherProvider: WeatherProvider
    @Published var savedCityWeatherResponse: WeatherResponse?
    @Published var searchWeatherResponse: WeatherResponse?
    @Published var isFetchingWeather = false
    @Published var isErrorFetchingWeather = false
    
    static let USER_DEFAULTS_KEY = "SAVED_CITY"
    
    init(weatherProvider: WeatherProvider) {
        self.savedCity = UserDefaults.standard.string(forKey: Self.USER_DEFAULTS_KEY)
        self.weatherProvider = weatherProvider
        Task {
            await fetchWeatherForSavedCity()
        }
    }
    
    private func getWeatherFromProvider(for city: String) async -> WeatherResponse? {
        self.isFetchingWeather = true
        self.isErrorFetchingWeather = false
        do {
            let currentWeather = try await weatherProvider.getCurrentWeather(for: city)
            self.isFetchingWeather = false
            return currentWeather
        } catch {
            if let networkError = error as? NetworkError {
                print("Error retrieving weather: \(networkError.rawValue)")
            } else {
                print("Error retrieving weather: \(error.localizedDescription)")
            }
            self.isFetchingWeather = false
            self.isErrorFetchingWeather = true
            return nil
        }
    }
    
    private func fetchWeatherForSavedCity() async {
        guard let savedCity = self.savedCity else {
            return
        }
        
        self.savedCityWeatherResponse = await getWeatherFromProvider(for: savedCity)
    }
    
    func performSearch(searchText: String) async {
        self.searchWeatherResponse = await getWeatherFromProvider(for: searchText)
    }
    
    func updateSavedCity(with newSavedCity: String) {
        self.savedCity = newSavedCity
        UserDefaults.standard.setValue(newSavedCity, forKey: Self.USER_DEFAULTS_KEY)
        refreshWeather()
    }
    
    func refreshWeather() {
        Task {
            await fetchWeatherForSavedCity()
        }
    }
}
