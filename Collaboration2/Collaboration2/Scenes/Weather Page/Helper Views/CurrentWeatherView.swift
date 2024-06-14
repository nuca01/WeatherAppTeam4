//
//  CurrentWeatherView.swift
//  Collaboration2
//
//  Created by nuca on 14.06.24.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject var viewModel: WeatherPageViewModel
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 3){
                Text("\(viewModel.getCurrentTemperature())º")
                    .foregroundStyle(.white)
                    .font(.system(size: 64))
                Text("Precipitations")
                    .foregroundStyle(.white)
                    .font(.system(size: 18))

                HStack {
                    Text("Max.: \(viewModel.getTodayMinMaxTemperature(min: false))º")
                    Text("Min.: \(viewModel.getTodayMinMaxTemperature(min: true))º")
                }
                .foregroundStyle(.white)
                .font(.system(size: 18))
                .padding(.bottom, 16)
            }
            Spacer()
        }
        .background(.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 20,
                                         style: .continuous)
        )
    }
}
