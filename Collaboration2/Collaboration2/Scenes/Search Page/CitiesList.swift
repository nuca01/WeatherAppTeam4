//
//  CitiesList.swift
//  Collaboration2
//
//  Created by nuca on 12.06.24.
//

import SwiftUI

struct CitiesList: View {
    var list: [City]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(list) { city in
                HStack {
                    Text(city.name ?? "city name unavailable")
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    
                    Spacer()
                }
            }
        }
    }
}
