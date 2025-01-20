//
//  WeatherView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            if !searchText.isEmpty {
                CitySearchView(weatherResponse: viewModel.searchWeatherResponse) { newSavedCity in
                    viewModel.updateSavedCity(with: newSavedCity)
                    searchText = ""
                }
            } else if viewModel.isFetchingWeather {
                ProgressView()
            } else if viewModel.isErrorFetchingWeather {
                ErrorView(errorMessage: "Unable to retrieve weather") {
                    viewModel.refreshWeather()
                }
            } else {
                CityWeatherView(weatherResponse: viewModel.savedCityWeatherResponse)
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
    WeatherView(viewModel: WeatherViewModel(weatherProvider: WeatherProviderAPI()))
}
