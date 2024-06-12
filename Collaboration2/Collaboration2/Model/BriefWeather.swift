//
//  BriefWeather.swift
//  Collaboration2
//
//  Created by nuca on 13.06.24.
//

import Foundation

struct BriefWeather: Decodable {
    let current: BriefCurrent?
}

struct BriefCurrent: Decodable {
    let temp: Double?
    let weather: [BriefWeatherInfo]?
}

struct BriefWeatherInfo: Decodable {
    let description: String?
}
