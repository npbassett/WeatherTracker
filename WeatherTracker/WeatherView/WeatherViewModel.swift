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
    @Published var weatherResponse: WeatherResponse?
    @Published var viewSelection: ViewSelection
    @Published var isFetchingWeather = false
    
    static let USER_DEFAULTS_KEY = "SAVED_CITY"
    
    init(weatherProvider: WeatherProvider) {
//        self.savedCity = UserDefaults.standard.string(forKey: Self.USER_DEFAULTS_KEY)
        self.savedCity = "Denver"
        self.weatherProvider = weatherProvider
        guard let savedCity = savedCity else {
            self.viewSelection = .noCitySelected
            return
        }
        self.viewSelection = .citySelected
        self.isFetchingWeather = true
        Task {
            self.weatherResponse = try? await weatherProvider.getCurrentWeather(for: savedCity)
            self.isFetchingWeather = false
        }
    }
}
