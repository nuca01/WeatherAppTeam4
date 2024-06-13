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
    @State var city: City?
    
    var body: some View {
        ZStack {
            AllAnimationView(weather: viewModel.getCurrentWeatherIcon())
            
            ScrollView{
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
