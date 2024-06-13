import SwiftUI
import SwiftData

struct LocationPicker: View {
    @Binding var selectedOption: City
    @Binding var showSearchPage: Bool
    @Query var selectedCities: [City]
    
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
                .onChange(of: selectedOption, perform: { newValue in
                    if newValue.name == "Select a City"
                    {
                        showSearchPage = true
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
    }
}
