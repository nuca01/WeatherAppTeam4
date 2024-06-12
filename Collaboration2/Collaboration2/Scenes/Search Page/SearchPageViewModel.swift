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
    var isSearching: Bool = false
    @Published var cities: [City]?
    private var cancellables = Set<AnyCancellable>()
    
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
    
    private func url(with name: String) -> String {
        let firstPart = "https://api.api-ninjas.com/v1/city?x-api-key=VOEXrxYcGtySvZ0i1p8qU3q3EMW212hCTdotHR7s&name="
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
    
    init() {
        addSubscribers()
    }
}
