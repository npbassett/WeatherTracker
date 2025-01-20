//
//  CitySearchView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct CitySearchView: View {
    var weatherResponse: WeatherResponse?
    var onTap: (String) -> ()
    
    var body: some View {
        if let weatherResponse = weatherResponse {
            CitySearchCard(weatherResponse: weatherResponse)
                .onTapGesture {
                    onTap(weatherResponse.location.name)
                }
        } else {
            Text("")
        }
    }
}

#Preview {
    CitySearchView(weatherResponse: TEST_WEATHER_RESPONSE, onTap: { _ in })
}
