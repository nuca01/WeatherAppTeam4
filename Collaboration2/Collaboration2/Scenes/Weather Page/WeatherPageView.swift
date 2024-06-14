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
    @State var city: City = City(name: "Tbilisi", latitude: 41.6, longitude: 44.8)
    @State var showSearchPage: Bool = false
    @Environment(\.modelContext) var context
    
    init(viewModel: WeatherPageViewModel) {
        self.viewModel = viewModel
        disableTextOfNavigationBackButton()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                AllAnimationView(weather: "50n")
                ScrollView {
                    VStack(spacing: 22) {
                        HStack {
                            Spacer()
                            
                            LocationPicker(selectedOption: $city, showSearchPage: $showSearchPage)
                                .padding(EdgeInsets(top: 60, leading: 0, bottom: 35, trailing: 0))
                                .offset(x: 64)
                        }
                        
                        CurrentWeatherView(viewModel: viewModel)
                        
                        DetailsInfoForCurrentWeather(viewModel: viewModel)
                        
                        HourlyWeather(viewModel: viewModel)
                        
                        DailyWeatherView(viewModel: viewModel)
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 45, trailing: 16))
                }
                
            }
            .onChange(of: city) { oldValue, newValue in
                viewModel.city = city
                viewModel.fetch()
            }
            .navigationDestination(isPresented: $showSearchPage) {
                if showSearchPage {
                    SearchPageView(viewModel: SearchPageViewModel(modelContext: context), city: $city)
                }
            }
            .ignoresSafeArea()
        }
        .accentColor(.black)
    }
    
    private func disableTextOfNavigationBackButton() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backButtonAppearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
}

#Preview {
    WeatherPageView(viewModel: WeatherPageViewModel())
}
