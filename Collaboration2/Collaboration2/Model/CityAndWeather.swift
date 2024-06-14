//
//  CityAndWeather.swift
//  Collaboration2
//
//  Created by nuca on 13.06.24.
//

import Foundation
import SwiftData

struct CityAndWeather: Identifiable {
    var name: String?
    var temperature: Double?
    var info: String?
    var id: PersistentIdentifier
}
