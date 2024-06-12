//
//  SearchPageViewModel.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import Foundation
import NetworkingService
import Combine

class SearchPageViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    var isSearching: Bool = false
    var cities: [City]?
    private var cancellables = Set<AnyCancellable>()
    
    private var url: String {
        let firstPart = "https://api.api-ninjas.com/v1/city?x-api-key=2Nj0rQe9WrqqjyTC495lglvc3lXqBKDqKWe6Wd2l&name="
        let name = searchQuery
        let limit = "&limit=30"
        
        return firstPart + name + limit
    }
    
    private func fetch() {
        NetworkService.networkService.getData(urlString: url) { (result: Result<[City], Error>) in
            switch result {
            case .success(let data):
                self.cities = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func addSubscribers() {
        $searchQuery
            .sink(receiveValue: { _ in
                self.fetch()
            })
            .store(in: &cancellables)
    }
    
    init() {
        addSubscribers()
    }
}
