//
//  LocationPicker.swift
//  Collaboration2
//
//  Created by Sandro Gelashvili on 12.06.24.
//

import SwiftUI

struct LocationPicker: View {
    @State private var buttonIsClicked: Bool = false
    @State private var selectedOption: City? = City(name: "Tbilisi", latitude: 44.45, longitude: 44.45)
    
    let mockData = [
        City(name: "Tbilisi", latitude: 44.45, longitude: 44.45),
        City(name: "Batumi", latitude: 44.45, longitude: 44.45),
        City(name: "Gori", latitude: 44.45, longitude: 44.45),
        City(name: "Paris", latitude: 44.45, longitude: 44.45),
    ]
    
    var body: some View {
            HStack {
                Menu {
                    ForEach(mockData) { city in
                        Button(action: {
                            self.selectedOption = city
                            self.buttonIsClicked.toggle()
                        }) {
                            Text(city.name ?? "N/A")
                        }
                    }
                } label: {
                    ZStack {
                        HStack {
                            Image("Map")
                            Text(selectedOption?.name ?? "Select a City")
                            Image("arrowDown")
                        }
                        .foregroundStyle(.white)
                        .padding(5)
                        .padding(.horizontal, 10)
                        .padding(.trailing, 10)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
            }
        }
}
#Preview {
    LocationPicker()
}
