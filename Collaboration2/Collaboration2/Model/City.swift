//
//  City.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import Foundation
import SwiftData

@Model
final class City {
    //MARK: - Properties
    let name: String?
    let latitude: Double?
    let longitude: Double?
    
    //MARK: - Enum
    enum CodingKeys: CodingKey {
        case name
        case latitude
        case longitude
    }
    
    //MARK: - Initializers
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String?.self, forKey: .name)
        self.latitude = try container.decode(Double?.self, forKey: .latitude)
        self.longitude = try container.decode(Double?.self, forKey: .longitude)
    }
}
