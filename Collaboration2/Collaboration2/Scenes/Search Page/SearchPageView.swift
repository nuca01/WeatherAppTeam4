//
//  SearchPageView.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import SwiftUI
import SwiftData

struct SearchPageView: View {
    //MARK: - Properties
    @ObservedObject var viewModel: SearchPageViewModel
    @Binding var city: City
    @Environment(\.modelContext) var context
    @Query var favoriteCities: [City]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Locations")
                    .font(.system(size: 34, weight: .bold))
                
                Spacer()
            }
            .padding(.horizontal, 10)
            
            CustomSearchBar(isSearching: $viewModel.isSearching, searchText: $viewModel.searchQuery)
            
            ScrollView{
                if viewModel.isSearching && !viewModel.searchQuery.isEmpty {
                    CitiesList(list: viewModel.cities ?? [], cityAdded: {
                        viewModel.isSearching = false
                        viewModel.searchQuery = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    })
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
                weatherCellWith(
                    name: weather.name,
                    temperature: weather.temperature,
                    description: weather.info ?? ""
                )
                .onTapGesture {
                    city = favoriteCities.first(where: { city in
                        city.id == weather.id
                    })!
                    
                    dismiss()
                }
            }
            
            if viewModel.citiesAndWeathers.count != favoriteCities.count {
                ForEach(favoriteCities) {_ in
                    ProgressView()
                        .frame(height: 77)
                }
            }
        }
    }
    
    //MARK: - Method
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


