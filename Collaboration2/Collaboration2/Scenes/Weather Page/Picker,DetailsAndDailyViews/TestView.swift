//
//  TestView.swift
//  Collaboration2
//
//  Created by Sandro Gelashvili on 13.06.24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    LocationPicker()
                        .offset(x: 140)
                    
                    DetailsInfoForCurrentWeather(viewModel: WeatherPageViewModel())
                    
                    DailyWeatherView(viewModel: WeatherPageViewModel())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(colors: [Color(#colorLiteral(red: 0.1897571981, green: 0.6920755506, blue: 0.8686286211, alpha: 1)), Color(#colorLiteral(red: 0.55633533, green: 0.6781123877, blue: 0.8838557601, alpha: 1))],
                                           startPoint: .top,
                                           endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    TestView()
}
