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
            if searchText.isEmpty {
                CityWeatherView(weatherResponse: viewModel.savedCityWeatherResponse)
            } else {
                CitySearchView(weatherResponse: viewModel.searchWeatherResponse) { newSavedCity in
                    viewModel.updateSavedCity(with: newSavedCity)
                    searchText = ""
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search Location")
        .onChange(of: searchText) {
            Task {
                await viewModel.performSearch(searchText: searchText)
            }
        }
    }
}

#Preview {
    WeatherView()
}
