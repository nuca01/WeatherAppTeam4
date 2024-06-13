//
//  SearchPageViewModel.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import Foundation
import NetworkingService
import Combine
import SwiftData

class SearchPageViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var isSearching: Bool = false
    @Published var cities: [City]?
    private var cancellables = Set<AnyCancellable>()
    @Published var citiesAndWeathers: [CityAndWeather] = []
    private var modelContext: ModelContext
    
    func fetch(with name: String) {
        NetworkService.networkService.getData(urlString: url(with: name)) { (result: Result<[City], Error>) in
            switch result {
            case .success(let data):
                self.cities = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetch(with city: City) {
        NetworkService.networkService.getData(urlString: url(with: city)) { (result: Result<BriefWeather, Error>) in
            switch result {
            case .success(let data):
                self.citiesAndWeathers.append(CityAndWeather(
                    name: city.name,
                    temperature: data.current?.temp,
                    info: data.current?.weather?[0].description, 
                    id: city.id
                ))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchFromContext() {
        citiesAndWeathers = []
        let fetchDescriptor: FetchDescriptor<City> = FetchDescriptor()
        let favoritedCities = (try? (modelContext.fetch(fetchDescriptor))) ?? []
        for city in favoritedCities {
            fetch(with: city)
        }
    }
    
    private func url(with city: City) -> String {
        let firstPart = "https://openweathermap.org/data/2.5/onecall?lat="
        let lanLon = "\(city.latitude ?? 51.5085)" + "&lon=" + "\(city.longitude ?? -0.1257)"
        let appID = "&units=metric&appid=439d4b804bc8187953eb36d2a8c26a02"
        
        return firstPart + lanLon + appID
    }
    
    private func url(with name: String) -> String {
        let firstPart = "https://api.api-ninjas.com/v1/city?x-api-key=5r92WDXLYrJS6M41n4uASadX9qa8HDl7p3iDjGwD&name="
        let name = name
        let limit = "&limit=30"
        
        return firstPart + name + limit
    }
    
    private func addSubscribers() {
        $searchQuery
            .sink(receiveValue: { searchText in
                self.fetch(with: searchText)
            })
            .store(in: &cancellables)
    }
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        addSubscribers()
    }
}
