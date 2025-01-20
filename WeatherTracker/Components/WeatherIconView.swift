//
//  WeatherIconView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct WeatherIconView: View {
    var iconLocation: String
    
    var url: URL? {
        return URL(string: "https:" + iconLocation)
    }
    
    var body: some View {
        AsyncImage(url: url)
    }
}

#Preview {
    WeatherIconView(iconLocation: TEST_WEATHER_RESPONSE.current.condition.icon)
}
