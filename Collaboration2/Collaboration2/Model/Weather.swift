//
//  Weather.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import Foundation

//MARK: - Weather
struct Weather: Decodable {
    let current: Current?
    let hourly: [Hourly]?
    let daily: [Daily]?
}

//MARK: - Hourly
struct Hourly: Decodable {
    let dt: Int?
    let temp: Double?
    let weather: [WeatherIcon]?
}

//MARK: - Current
struct Current: Decodable {
    let humidity: Int?
    let windSpeed: Double?
    let temp: Double?
    let weather: [WeatherIcon]?
    
    enum CodingKeys: String, CodingKey {
        case humidity
        case windSpeed = "wind_speed"
        case temp
        case weather
    }
}

//MARK: - Daily
struct Daily: Decodable {
    let dt: Int?
    let temp: Temp?
    let weather: [WeatherIcon]?
    let rain: Double?
}

//MARK: - Temp
struct Temp: Decodable {
    let min: Double?
    let max: Double?
}

//MARK: - WeatherIcon
struct WeatherIcon: Decodable {
    let icon: String?
}
