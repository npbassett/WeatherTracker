//
//  WeatherView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel(weatherProvider: AppAPI())
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            switch viewModel.viewSelection {
            case .noCitySelected:
                NoCitySelectedView()
            case .citySelected:
                CityWeatherView(weatherResponse: TEST_WEATHER_RESPONSE)
            case .searchingForCity:
                ContentView()
            }
        }
        .searchable(text: $searchText, prompt: "Search Location")
    }
}

#Preview {
    WeatherView()
}
