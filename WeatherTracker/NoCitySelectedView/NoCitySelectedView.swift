//
//  NoCitySelectedView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI



struct NoCitySelectedView: View {
    var body: some View {
        VStack {
            Text("No City Selected").font(.title)
            Text("Please search for a city")
        }
    }
}

#Preview {
    NoCitySelectedView()
}
