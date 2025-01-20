//
//  ContentView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onTapGesture {
            Task {
                let weatherResponse = try await AppAPI.getCurrentWeather(for: "Denver")
                print("Denver temp = \(weatherResponse?.current.temp_c)")
            }
        }
    }
}

#Preview {
    ContentView()
}
