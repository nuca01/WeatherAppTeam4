//
//  SearchPageView.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import SwiftUI

struct SearchPageView: View {
    @ObservedObject var viewModel: WeatherPageViewModel
    @Binding var city: City
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        @State var city: City = City(name: "Tbilisi", latitude: 41.6934591, longitude: 44.8014495)
        
        SearchPageView(viewModel: WeatherPageViewModel(), city: $city)
    }
}
