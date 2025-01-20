//
//  ErrorView.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

struct ErrorView: View {
    var errorMessage: String
    var refresh: (() -> ())?
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle")
            WeatherTrackerText(text: errorMessage, size: .small)
            
            if let refresh = refresh {
                Button(action: refresh) {
                    WeatherTrackerText(text: "Refresh", size: .small)
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    ErrorView(errorMessage: "Unable to retrieve weather", refresh: nil)
}
