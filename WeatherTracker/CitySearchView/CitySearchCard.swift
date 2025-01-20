//
//  CitySearchCard.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct CitySearchCard: View {
    var weatherResponse: WeatherResponse
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    WeatherTrackerText(text: weatherResponse.location.name, size: .medium)
                    WeatherTrackerText(text: "\(Int(weatherResponse.current.temp_c)) °", size: .xlarge)
                }
                
                Spacer()
                
                WeatherIconView(iconLocation: weatherResponse.current.condition.icon)
            }
            .padding(16)
            .background(Color.Background)
            .cornerRadius(16)
            
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    CitySearchCard(weatherResponse: TEST_WEATHER_RESPONSE)
}
