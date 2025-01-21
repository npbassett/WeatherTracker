//
//  WeatherTrackerTests.swift
//  WeatherTrackerTests
//
//  Created by Neil Bassett on 1/20/25.
//

import XCTest
@testable import WeatherTracker

final class WeatherTrackerTests: XCTestCase {
    var weatherProvider: WeatherProvider!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let mockNetworkingService = MockWeatherNetworkService()
        weatherProvider = WeatherProviderAPI(networkService: mockNetworkingService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecodeWeatherData() async throws {
        let weather = try await weatherProvider.getCurrentWeather(for: "Denver")
        XCTAssertEqual(weather, TEST_WEATHER_RESPONSE)
    }
}
