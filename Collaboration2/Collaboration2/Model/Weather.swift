//
//  Weather.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import Foundation

struct Weather: Decodable {
    let dt: Int?
    let main: Main?
    let weather: [WeatherInfo]?
    let wind: Wind?
    let rain: Rain?
}

struct Main: Decodable {
    let temp: Double?
    let feelsLike: Double?
    let tempMin: Double?
    let tempMax: Double?
    let humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

struct WeatherInfo: Decodable {
    let main: String?
    let icon: String?
}

struct Wind: Decodable {
    let speed: Double?
}

struct Rain: Decodable {
    let threeHours: Double?
    
    enum CodingKeys: String, CodingKey {
        case threeHours = "3h"
    }
}
