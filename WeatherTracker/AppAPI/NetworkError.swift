//
//  NetworkError.swift
//  WeatherTracker
//
//  Created by Neil Bassett on 1/20/25.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case failedToFetchData = "Failed to fetch data"
    case failedToDecodeData = "Failed to decode response data"
}
