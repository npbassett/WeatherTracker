//
//  WeatherTrackerApp.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

@main
struct WeatherTrackerApp: App {
    @StateObject private var weatherViewModel = WeatherViewModel(weatherProvider: WeatherProviderAPI())
    
    var body: some Scene {
        WindowGroup {
            WeatherView(viewModel: weatherViewModel)
        }
    }
}
