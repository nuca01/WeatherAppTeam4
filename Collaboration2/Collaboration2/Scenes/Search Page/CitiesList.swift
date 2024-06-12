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
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(list) { city in
                HStack {
                    Text(city.name ?? "city name unavailable")
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                        .onTapGesture {
                            if !favoriteCities.contains(where: { favoriteCity in
                                favoriteCity.name == city.name
                            }) {
                                context.insert(city)
                            }
                            
                            print(favoriteCities.count)
                        }
                    
                    Spacer()
                }
            }
        }
    }
    
    init(list: [City]) {
        self.list = list
    }
}

