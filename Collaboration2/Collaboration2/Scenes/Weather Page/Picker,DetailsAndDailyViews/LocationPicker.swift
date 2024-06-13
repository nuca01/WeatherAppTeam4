//
//  LocationPicker.swift
//  Collaboration2
//
//  Created by Sandro Gelashvili on 12.06.24.
//

import SwiftUI
 
struct LocationPicker: View {
    @State private var buttonIsClicked: Bool = false
    @State private var selectedOption: City = City(name: "Tbilisi",
                                                    latitude: 44.45,
                                                    longitude: 44.45)
    @State private var showSearchPage = false
    @Environment(\.modelContext) var context
    
    let mockData = [
        City(name: "Tbilisi", latitude: 44.45, longitude: 44.45),
        City(name: "Batumi", latitude: 44.45, longitude: 44.45),
        City(name: "Gori", latitude: 44.45, longitude: 44.45),
        City(name: "Paris", latitude: 44.45, longitude: 44.45),
    ]
    
    var body: some View {
        NavigationStack {
           
                HStack {
                    Menu {
                        ForEach(mockData) { city in
                            Button(action: {
                                self.selectedOption = city
                                self.buttonIsClicked.toggle()
                            }) {
                                HStack {
                                    Image(systemName: "checkmark")
                                    if selectedOption.name == city.name {
                                    }
                                    Text(city.name ?? "N/A")
                                }
                            }
                        }
                        
                        Button(action: {
                            showSearchPage.toggle()
                        }) {
                            HStack(){
                                Text("Add New Location")
                                Image(systemName: "location.fill")
                            }
                        }
                        
                    } label: {
                        ZStack {
                            HStack {
                                Image("Map")
                                Text(selectedOption.name ?? "Select a City")
                                Image("arrowDown")
                            }
                            .foregroundStyle(.white)
                            .padding(5)
                            .padding(.horizontal, 10)
                            .padding(.trailing, 10)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
                .navigationDestination(isPresented: $showSearchPage) {
                    SearchPageView(viewModel: SearchPageViewModel(modelContext: context), city: $selectedOption )
                }
            .padding()
        }
    }
}
#Preview {
    LocationPicker()
}
