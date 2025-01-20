//
//  WeatherValueStack.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct WeatherValueStack: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .foregroundStyle(Color.CityWeatherSubviewTitleText)
            Text(value)
                .foregroundStyle(Color.CityWeatherSubviewValueText)
        }
    }
}

#Preview {
    WeatherValueStack(title: "Humidity", value: "20%")
}
