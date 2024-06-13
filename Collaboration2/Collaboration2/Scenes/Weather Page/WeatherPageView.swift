//
//  WeatherPageView.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import SwiftUI
import SpriteKit

struct WeatherPageView: View {
    @ObservedObject var viewModel: WeatherPageViewModel
    @State var city: City = City(name: "Tbilisi", latitude: 41.6, longitude: 44.8)
    @State var showSearchPage: Bool = false
    @Environment(\.modelContext) var context
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                AllAnimationView(weather: "13n")
                
                VStack {
                    ScrollView {
                        LocationPicker(selectedOption: $city, showSearchPage: $showSearchPage)
//                            .frame(width: 100, height: 100)
                        
                        DetailsInfoForCurrentWeather(viewModel: viewModel)
                        
                        DailyWeatherView(viewModel: viewModel)
                    }
                }
            }
            .onChange(of: city) { oldValue, newValue in
                viewModel.city = city
                viewModel.fetch()
            }
            .navigationDestination(isPresented: $showSearchPage) {
                SearchPageView(viewModel: SearchPageViewModel(modelContext: context),
                               city: $city)
            }
        }
    }
    
    init(viewModel: WeatherPageViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    WeatherPageView(viewModel: WeatherPageViewModel())
}
