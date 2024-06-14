import SwiftUI
import SwiftData

struct LocationPicker: View {
    //MARK: - Properties
    @Binding var selectedOption: City
    @Binding var showSearchPage: Bool
    @Query var selectedCities: [City]
    @Environment(\.modelContext) var context
    
    var body: some View {
        menu
            .onAppear(perform: {
                addDefaultLocation()
            })
    }
    
    private var menu: some View {
        Menu {
            picker
                .onChange(of: selectedOption, { oldValue, newValue in
                    if newValue.name == "Select a City"
                    {
                        showSearchPage = true
                        
                        selectedOption = oldValue
                    }
                })
            
        } label: {
            menuLabel
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
    
    private var menuLabel: some View {
        HStack {
            Image("Map")
            
            Text(selectedOption.name ?? "Select a City")
            
            Image("arrowDown")
        }
    }
    
    private var picker: some View {
        Picker("menu", selection: $selectedOption) {
            ForEach(selectedCities) { city in
                Text(city.name ?? "N/A")
                    .tag(city)
            }
            
            addNewLocationView
                .tag(City(name: "Select a City", latitude: 10, longitude: 10))
        }
    }
    
    private var addNewLocationView: some View {
        HStack {
            Text("Add New Location")
            Image(systemName: "location.fill")
        }
    }
    
    //MARK: - Method
    private func addDefaultLocation() {
        let city: City = City(name: "Tbilisi", latitude: 41.7225, longitude: 44.7925)
        if !selectedCities.contains(where: { favoriteCity in
            favoriteCity.latitude == city.latitude && favoriteCity.longitude == city.longitude
        }) {
            context.insert(city)
        }
    }
}
