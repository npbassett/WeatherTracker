//
//  CitySelectedView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct CityWeatherView: View {
    var weatherResponse: WeatherResponse
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https:"+weatherResponse.current.condition.icon))
            
            Text("\(weatherResponse.location.name) \(Image(systemName: "location.fill"))")
            Text(String(Int(weatherResponse.current.temp_c)) + " °")
            
            HStack {
                VStack {
                    Text("Humidity")
                    Text(String(weatherResponse.current.humidity) + "%")
                }
                
                VStack {
                    Text("UV")
                    Text(String(weatherResponse.current.uv))
                }
                
                VStack {
                    Text("Feels Like")
                    Text(String(weatherResponse.current.feelslike_c) + " °")
                }
            }
        }
    }
}

#Preview {
    CityWeatherView(weatherResponse: TEST_WEATHER_RESPONSE)
}
