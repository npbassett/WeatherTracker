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
        HStack {
            VStack {
                Text(weatherResponse.location.name)
                Text("\(Int(weatherResponse.current.temp_c)) °")
            }
            
            WeatherIconView(iconLocation: weatherResponse.current.condition.icon)
        }
    }
}

#Preview {
    CitySearchCard(weatherResponse: TEST_WEATHER_RESPONSE)
}
