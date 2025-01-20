//
//  NoCitySelectedView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI



struct NoCitySelectedView: View {
    var body: some View {
        VStack(spacing: 8) {
            WeatherTrackerText(text: "No City Selected", size: .large)
            WeatherTrackerText(text: "Please search for a city", size: .small)
        }
    }
}

#Preview {
    NoCitySelectedView()
}
