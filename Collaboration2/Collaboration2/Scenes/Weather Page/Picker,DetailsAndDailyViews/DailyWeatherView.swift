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
        VStack(alignment: .leading) {
            ForEach(DaysOfWeek.allCases, id: \.self) { day in
                WeeklyWeatherCell(imageForWeatherIcon: "image",
                                  maxTemp: 20,
                                  minTemp: 15,
                                  day: day)
            }
        }
        .background(.ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 20,
                                         style: .continuous))
        .padding()
    }
    
    private struct WeeklyWeatherCell: View {
        var imageForWeatherIcon: String
        var maxTemp: Int
        var minTemp: Int
        let day: DaysOfWeek
        
        var body: some View {
            HStack () {
                Text(day.rawValue)
                    .frame(width: 97,alignment: .leading)
                
                Spacer()
                
                AsyncImageForIcon(imageForWeatherIcon: imageForWeatherIcon)
                
                Spacer()
                
                Text("\(maxTemp)°C")
                Text("\(minTemp)°C")
                    .foregroundStyle(Color(.systemGray5))
            }
            .font(.system(size: 18, weight: .medium))
            .foregroundStyle(.white)
            .padding()
        }
    }
    
    private struct AsyncImageForIcon: View {
        var imageForWeatherIcon: String
        
        var body: some View {
            AsyncImage(url: URL(string: imageForWeatherIcon)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
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
    
    enum DaysOfWeek: String, CaseIterable {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
        case saturday = "Saturday"
        case sunday = "Sunday"
    }
}



#Preview {
    DailyWeatherView(viewModel: WeatherPageViewModel())
}
