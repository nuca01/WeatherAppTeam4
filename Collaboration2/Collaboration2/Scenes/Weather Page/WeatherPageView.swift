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
    var body: some View {
        VStack {
            
//            AllAnimationView(weather: "13n")
            
            ScrollView {
                LocationPicker(selectedOption: $city)
                
                DetailsInfoForCurrentWeather(viewModel: viewModel)
                
                DailyWeatherView(viewModel: viewModel)
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
