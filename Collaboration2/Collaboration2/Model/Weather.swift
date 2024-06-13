//
//  Weather.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import Foundation

struct Weather: Decodable {
    let current: Current?
    let hourly: [Hourly]?
    let daily: [Daily]?
}

struct Hourly: Decodable {
    let dt: Int?
    let temp: Double?
    let weather: [WeatherIcon]?
}

struct Current: Decodable {
    let humidity: Int?
    let windSpeed: Double?
    let temp: Double?
    
    enum CodingKeys: String, CodingKey {
        case humidity
        case windSpeed = "wind_speed"
        case temp
    }
}

struct Daily: Decodable {
    let dt: Int?
    let temp: Temp?
    let weather: [WeatherIcon]?
    let rain: Double?
}

struct Temp: Decodable {
    let min: Double?
    let max: Double?
}

struct WeatherIcon: Decodable {
    let icon: String?
}
