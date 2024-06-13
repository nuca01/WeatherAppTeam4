//
//  WeatherPageViewModel.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import Foundation
import NetworkingService

class WeatherPageViewModel: ObservableObject {
    //MARK: - Properties
    @Published var weather: Weather?
    @Published var city: City = City(name: "Tbilisi", latitude: 41.6934591, longitude: 44.8014495)
    
    private var url: String {
        let firstPart = "https://openweathermap.org/data/2.5/onecall?lat="
        let lanLon = "\(city.latitude ?? 51.5085)" + "&lon=" + "\(city.longitude ?? -0.1257)"
        let appID = "&units=metric&appid=439d4b804bc8187953eb36d2a8c26a02"
        
        return firstPart + lanLon + appID
    }
    
    init() {
        fetch()
    }
    
    //MARK: - Methods
    func fetch() {
        NetworkService.networkService.getData(urlString: url) { (result: Result<Weather, Error>) in
            switch result {
            case .success(let data):
                self.weather = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func imageURL(url: String) -> URL? {
        URL(string: url)
    }
    
    func getHumidity() -> Int {
        guard let weather = weather?.current?.humidity else { return 0 }
        return weather
    } 
    
    func getWindSpeed() -> Int {
        guard let weather = weather?.current?.windSpeed else { return 0 }
        return Int(weather)
    }
    
    func getRain() -> Int {
        guard let weather = weather?.daily?.first(where: { daily in
            daily.rain != nil
        }) else { return 0 }
        
        switch weather.rain! {
            case 0.0:
                return 0
            case 0.1...1.0:
                return 10
            case 1.1...2.0:
                return 20
            case 2.1...5.0:
                return 50
            case 5.1...10.0:
                return 80
            default:
                return 100
            }
    }
    
    func getCurrentWeatherIcon() -> String {
        if let weatherIcon = weather?.current?.weather?[0].icon
        {
            weatherIcon
        } else {
            ""
        }
    }
}
