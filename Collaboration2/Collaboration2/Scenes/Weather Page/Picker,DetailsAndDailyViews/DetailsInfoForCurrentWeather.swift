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
                Image("Rain")
                Text("\(viewModel.getRain())%")
                
                Spacer()
                
                Image("Thermo")
                Text("\(viewModel.getHumidity())%")
                
                Spacer()
                
                Image("Wind")
                Text("\(viewModel.getWindSpeed())km/h")
            }
            .foregroundStyle(.white)
            .padding(10)
            .padding(.horizontal, 10)
            .background(.ultraThinMaterial,
                        in: RoundedRectangle(cornerRadius: 20,
                                             style: .continuous)
            )
            .padding()
    }
}

//#Preview {
//    DetailsInfoForCurrentWeather()
//}
