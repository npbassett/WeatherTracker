//
//  CitySelectedView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

extension Color {
    static let test = Color.fromHex
}

struct CityWeatherView: View {
    var weatherResponse: WeatherResponse?
    
    var body: some View {
        if let weatherResponse = weatherResponse {
            VStack {
                Spacer()
                
                VStack(spacing: 24) {
                    WeatherIconView(iconLocation: weatherResponse.current.condition.icon)
                    Text("\(weatherResponse.location.name) \(Image(systemName: "location.fill"))").font(.custom("Poppins-Regular", size: 30))
                    WeatherTrackerText(text: "\(Int(weatherResponse.current.temp_c))°", size: .xxlarge)
                }
                .padding(16)
                
                HStack(spacing: 56) {
                    WeatherValueStack(title: "Humidity", value: String(weatherResponse.current.humidity) + "%")
                    
                    WeatherValueStack(title: "UV", value: String(weatherResponse.current.uv))
                    
                    WeatherValueStack(title: "Feels Like", value: "\(weatherResponse.current.feelslike_c)°")
                }
                .padding(16)
                .background(Color.Background)
                .cornerRadius(16)
                
                Spacer()
                Spacer()
            }
        } else {
            NoCitySelectedView()
        }
    }
}

#Preview {
    CityWeatherView(weatherResponse: TEST_WEATHER_RESPONSE)
}
