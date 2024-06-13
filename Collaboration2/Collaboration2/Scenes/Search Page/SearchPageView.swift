//
//  SearchPageView.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import SwiftUI
import SwiftData

struct SearchPageView: View {
    @ObservedObject var viewModel: SearchPageViewModel
    @Binding var city: City
    @Environment(\.modelContext) var context
    
    var body: some View {
        VStack {
            Text("Locations")
            
            CustomSearchBar(isSearching: $viewModel.isSearching, searchText: $viewModel.searchQuery)
            
            ScrollView{
                if viewModel.isSearching {
                    CitiesList(list: viewModel.cities ?? [])
                        .modelContext(context)
                } else {
                    weatherList
                        .padding(.horizontal)
                        .onAppear(perform: {
                            self.viewModel.fetchFromContext()
                        })
                }
            }
        }
    }
    
    private var weatherList: some View {
        VStack(spacing: 15) {
            ForEach(viewModel.citiesAndWeathers) { weather in
                weatherCellWith(name: weather.name, temperature: weather.temperature, description: weather.info ?? "")
            }
        }
    }
    
    private func weatherCellWith(name: String?, temperature: Double?, description: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(name ?? "name unavailable")
                    .font(.system(size: 25))
                
                Text(description)
                    .font(.system(size: 10))
                
            }
            
            Spacer()
            
            Text("\(Int(temperature ?? 700))°")
                .font(.system(size: 53))
                .fontWeight(.regular)
        }
        .foregroundStyle(Color.white)
        .fontWeight(.bold)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 46/255, green: 176/255, blue: 221/255, opacity: 1),
                Color(red: 142/255, green: 173/255, blue: 225/255, opacity: 1)
            ]),
            startPoint: .top,
            endPoint: .bottom
        ))
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
}

#Preview {
    var config = ModelConfiguration(isStoredInMemoryOnly: true)
    var container = try! ModelContainer(for: City.self, configurations: config)

    @State var city: City = City(name: "Tbilisi", latitude: 41.6934591, longitude: 44.8014495)

    return SearchPageView(viewModel: SearchPageViewModel(modelContext: container.mainContext), city: $city)
        .modelContainer(container)
}
