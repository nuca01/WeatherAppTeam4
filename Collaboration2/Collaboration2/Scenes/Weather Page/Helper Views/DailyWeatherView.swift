//
//  DailyWeatherView.swift
//  Collaboration2
//
//  Created by Sandro Gelashvili on 12.06.24.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var viewModel: WeatherPageViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let daily = viewModel.weather?.daily, !daily.isEmpty {
                ForEach(viewModel.getDailyWeather().prefix(8), id: \.dt) { daily in
                    WeeklyWeatherCell(
                        imageURL: viewModel.getWeatherIconURL(icon: daily.weather?.first?.icon ?? "N/A"),
                        maxTemp: daily.temp?.max ?? 0,
                        minTemp: daily.temp?.min ?? 0,
                        date: Date(timeIntervalSince1970: TimeInterval(daily.dt ?? 0)))
                    .frame(height: 60)
                }
            } else {
                ForEach(0..<8) { _ in
                    loaderView
                }
            }
            
        }
        .background(.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 20,
                                         style: .continuous))
        .padding()
    }
    
    private var loaderView: some View {
        HStack {
            Spacer()
            
            ProgressView()
                .frame(height: 60)
            
            Spacer()
        }
    }
    
    private struct WeeklyWeatherCell: View {
        var imageURL: URL?
        var maxTemp: Double
        var minTemp: Double
        let date: Date
        
        var body: some View {
            HStack () {
                Text(dayOfWeek(from: date))
                    .frame(width: 97, alignment: .leading)
                
                Spacer()
                
               AsyncImageForIcon(width: 60,
                                 height: 60,
                                 imageURL: imageURL)
                
                Spacer()
                
                celciusGenerator(with: Int(maxTemp))
                
                celciusGenerator(with: Int(minTemp))
                    .foregroundStyle(Color(.systemGray5).opacity(0.4))
            }
            .font(.system(size: 18, weight: .medium))
            .foregroundStyle(.white)
            .padding(.horizontal)
        }
        
        private func celciusGenerator(with number: Int) -> some View {
            HStack(alignment: .top, spacing: 1) {
                Text("\(Int(number))")
                    .font(.system(size: 18, weight: .medium))
                
                Text("°C")
                    .font(.system(size: 9, weight: .medium))
            }
        }
        
        private func dayOfWeek(from date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        }
    }
    
    private struct AsyncImageForIcon: View {
        var width: CGFloat
        var height: CGFloat
        var imageURL: URL?
        
        var body: some View {
            AsyncImage(url: imageURL) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: height)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
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
}



#Preview {
    DailyWeatherView(viewModel: WeatherPageViewModel())
}
