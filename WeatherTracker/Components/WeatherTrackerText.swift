//
//  WeatherTrackerText.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import SwiftUI

enum WeatherTrackerTextSize: CGFloat {
    case small = 16
    case medium = 20
    case large = 30
    case xlarge = 60
    case xxlarge = 70
}

struct WeatherTrackerText: View {
    var text: String
    var size: WeatherTrackerTextSize
    
    var body: some View {
        Text(text).font(.custom("Poppins-Regular", size: size.rawValue))
    }
}

#Preview {
    WeatherTrackerText(text: "Test", size: .large)
}
