//
//  PickerAndWeeklyWeatherView.swift
//  Collaboration2
//
//  Created by Sandro Gelashvili on 12.06.24.
//

import SwiftUI

struct DailyWeatherView: View {
    
    var body: some View {
        ZStack {
            VStack {
                DetailsInfoForCurrentWeather(rainPercent: 20,
                                             humidityPercent: 20,
                                             windSpeed: 20)
                
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
                                             style: .continuous)
            )
            .padding()
        }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [Color(#colorLiteral(red: 0.1897571981, green: 0.6920755506, blue: 0.8686286211, alpha: 1)), Color(#colorLiteral(red: 0.55633533, green: 0.6781123877, blue: 0.8838557601, alpha: 1))],
                                   startPoint: .top,
                                   endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
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
    }
}

struct DetailsInfoForCurrentWeather: View {
    var rainPercent: Int
    var humidityPercent: Int
    var windSpeed: Int
    
    var body: some View {
            HStack {
                Image("Rain")
                Text("\(rainPercent)%")
                
                Spacer()
                
                Image("Thermo")
                Text("\(humidityPercent)%")
                
                Spacer()
                
                Image("Wind")
                Text("\(windSpeed)km/h")
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

#Preview {
    WeeklyWeatherView()
}
