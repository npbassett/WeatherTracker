//
//  CitySearchView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct CitySearchView: View {
    var weatherResponse: WeatherResponse?
    
    var body: some View {
        if let weatherResponse = weatherResponse {
            CitySearchCard(weatherResponse: weatherResponse)
        } else {
            Text("")
        }
    }
}

#Preview {
    CitySearchView(weatherResponse: TEST_WEATHER_RESPONSE)
}
