//
//  DetailsInfoForCurrentWeather.swift
//  Collaboration2
//
//  Created by Sandro Gelashvili on 12.06.24.
//

import SwiftUI

struct DetailsInfoForCurrentWeather: View {
    @ObservedObject var viewModel: WeatherPageViewModel
    
    var body: some View {
        HStack {
            rainView
            
            Spacer()
            
            thermoView
            
            Spacer()
            
            windView
        }
        .foregroundStyle(.white)
        .padding(10)
        .padding(.horizontal, 10)
        .background(.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 20,
                                         style: .continuous)
        )
    }
    
    private var rainView: some View {
        cellForDetails(
            weather: "Rain",
            description: "\(viewModel.getRain())%"
        )
    }
    
    private var thermoView: some View {
        cellForDetails(
            weather: "Thermo",
            description: "\(viewModel.getHumidity())%"
        )
    }
    
    private var windView: some View {
        cellForDetails(
            weather: "Wind",
            description: "\(viewModel.getWindSpeed())km/h"
        )
    }
    
    private func cellForDetails(weather: String, description: String ) -> some View {
        HStack {
            Image(weather)
            Text(description)
        }
    }
}

