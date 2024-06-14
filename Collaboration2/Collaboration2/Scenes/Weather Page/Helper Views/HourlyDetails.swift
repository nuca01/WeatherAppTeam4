//
//  HourlyDetails.swift
//  Collaboration2
//
//  Created by Akaki Titberidze on 14.06.24.
//

import SwiftUI

struct HourlyDetails: View {
    @ObservedObject var viewModel: WeatherPageViewModel
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack(spacing: 12){
                ForEach(Array(viewModel.getWeatherHourly()?.enumerated() ?? [].enumerated()), id: \.element.dt) { index, hourly in
                    VStack{
                        Text("\(Int(hourly.temp ?? 0))°C")
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                            .padding(.top, 13)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
                        Spacer()
                        
                        HourlyImage(imageForWeatherIcon: viewModel.getWeatherIconURL(icon: hourly.weather?[0].icon ?? ""))
                            .frame(width: 43, height: 43)
                        
                        Spacer()
                        
                        Text(viewModel.convertUnixTo24HR(unixTime: Double(hourly.dt ?? 0)))
                            .font(.system(size: 18))
                            .foregroundStyle(.white)
                            .padding(.bottom, 20)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 2)
                    }
                    .frame(width: 70, height: 155)
                    .overlay(overlayView(for: index))
                    .background(backgroundView(for: index))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                }
            }
        }
        .padding(.horizontal, 13)
    }
    
    //MARK: overlay gradient
    private func overlayView(for index: Int) -> some View {
        Group {
            if index == 0 {
                AnyView(RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(
                        colors: [
                            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                            Color(#colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1))
                        ],
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    ), lineWidth: 2))
            } else {
                AnyView(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.clear, lineWidth: 2))
            }
        }
    }
    
    //MARK: background gradient
    private func backgroundView(for index: Int) -> some View {
        Group {
            if index == 0 {
                LinearGradient(
                    colors: [
                        Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1994257036)),
                        Color(#colorLiteral(red: 0.5568627451, green: 0.6784313725, blue: 0.8823529412, alpha: 0.2953487169))
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            } else {
                Color.clear
            }
        }
    }
}

#Preview {
    HourlyDetails(viewModel: WeatherPageViewModel())
}
