//
//  HourlyWeather.swift
//  Collaboration2
//
//  Created by Akaki Titberidze on 14.06.24.
//

import SwiftUI

struct HourlyWeather: View {
    
    @ObservedObject var viewModel: WeatherPageViewModel
    
    var body: some View {
        VStack{
            
            HStack(alignment: .top){
                Text("Today")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .fontWeight(.heavy)
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
                
                Spacer()
                
                Text(viewModel.getTodayDate())
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
            }
            .padding(.top, 12)
            .padding(.leading, 16)
            .padding(.trailing, 18)
            
            HourlyDetails(viewModel: viewModel)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 217)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
    }
}

struct HourlyImage: View {
    var imageForWeatherIcon: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageForWeatherIcon)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(width: 30, height: 30)
                        .shadow(radius: 20)
                    
                    ProgressView()
                }
            }
        }
    }
}
