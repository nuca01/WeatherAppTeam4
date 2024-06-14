//
//  CitiesList.swift
//  Collaboration2
//
//  Created by nuca on 12.06.24.
//

import SwiftUI
import SwiftData

struct CitiesList: View {
    private var list: [City]
    @Environment(\.modelContext) var context
    @Query var favoriteCities: [City]
    @State private var tappedCity: City?
    private var cityAdded: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(list) { city in
                HStack {
                    Text(city.name ?? "city name unavailable")
                        .frame(alignment: .leading)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    
                    Spacer()
                }
                .background(tappedCity == city ? Color.black.opacity(0.2) : Color.clear)
                .onTapGesture {
                    tappedCity = city
                    if !favoriteCities.contains(where: { favoriteCity in
                        favoriteCity.latitude == city.latitude && favoriteCity.longitude == city.longitude
                    }) {
                        context.insert(city)
                    }
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        tappedCity = nil
                    }
                    
                    cityAdded()
                }
            }
        }
    }
    
    init(list: [City], cityAdded: @escaping () -> Void) {
        self.list = list
        self.cityAdded = cityAdded
    }
}

