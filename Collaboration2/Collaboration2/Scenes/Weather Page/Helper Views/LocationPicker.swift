import SwiftUI
import SwiftData

struct LocationPicker: View {
    @Binding var selectedOption: City
    @Binding var showSearchPage: Bool
    @Query var selectedCities: [City]
    @Environment(\.modelContext) var context
    
    var body: some View {
        VStack {
            Menu {
                Picker("menu", selection: $selectedOption) {
                    ForEach(selectedCities) { city in
                        Text(city.name ?? "N/A")
                            .tag(city)
                    }
                    HStack {
                        Text("Add New Location")
                        Image(systemName: "location.fill")
                    }
                    .tag(City(name: "Select a City", latitude: 10, longitude: 10))
                }
                .onChange(of: selectedOption, { oldValue, newValue in
                    if newValue.name == "Select a City"
                    {
                        showSearchPage = true
                        
                            selectedOption = oldValue
                    }
                })
                
            } label: {
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
            .padding(.trailing)
            .padding()
        }
        .onAppear(perform: {
            var city: City = City(name: "Tbilisi", latitude: 41.6, longitude: 44.8)
            if !selectedCities.contains(where: { favoriteCity in
                favoriteCity.latitude == city.latitude && favoriteCity.longitude == city.longitude
            }) {
                context.insert(city)
            }
        })
    }
}
