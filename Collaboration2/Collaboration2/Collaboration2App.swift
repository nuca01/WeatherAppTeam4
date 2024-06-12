//
//  Collaboration2App.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import SwiftUI
import SwiftData

@main
struct Collaboration2App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            City.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    @State var city: City = City(name: "Tbilisi", latitude: 41.6934591, longitude: 44.8014495)
    
    var body: some Scene {
        WindowGroup {
//            WeatherPageView(viewModel: WeatherPageViewModel())
            SearchPageView(viewModel: SearchPageViewModel(modelContext: sharedModelContainer.mainContext), city: $city)
        }
        .modelContainer(sharedModelContainer)
    }
}
