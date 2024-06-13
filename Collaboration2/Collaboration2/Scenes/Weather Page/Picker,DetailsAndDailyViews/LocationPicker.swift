import SwiftUI
import SwiftData

struct LocationPicker: View {
    @Binding var selectedOption: City
    @State private var showSearchPage = false
    @Environment(\.modelContext) var context
    @Query var selectedCities: [City]
    
    var body: some View {
        NavigationStack {
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
            .navigationDestination(isPresented: $showSearchPage) {
                SearchPageView(viewModel: SearchPageViewModel(modelContext: context),
                               city: $selectedOption)
            }
        }
    }
}
