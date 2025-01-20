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
                    Text(weatherResponse.location.name)
                        .font(.system(size: 20))
                    Text("\(Int(weatherResponse.current.temp_c)) °")
                        .font(.system(size: 60))
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
