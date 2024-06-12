//
//  SearchPageView.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import SwiftUI

struct SearchPageView: View {
    @ObservedObject var viewModel: SearchPageViewModel
    @Binding var city: City
    
    var body: some View {
        VStack {
            Text("Locations")
            
            CustomSearchBar(isSearching: $viewModel.isSearching, searchText: $viewModel.searchQuery)
            
            ScrollView{
                CitiesList(list: viewModel.cities ?? [])
            }
        }
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        @State var city: City = City(name: "Tbilisi", latitude: 41.6934591, longitude: 44.8014495)
        
        SearchPageView(viewModel: SearchPageViewModel(), city: $city)
    }
}
