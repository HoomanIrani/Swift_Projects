//
//  WeatherService.swift
//  WeatherApp1
//
//  Created by Houman Irani on 6/25/23.
//

import Foundation
import Combine


enum NetworkError: Error {
    case invalidURL(_ urlString: String)
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        }
    }
}

protocol WeatherServiceProtocol {
    
    func fetchWeather(search: String) -> Future<WeatherResponse, Error>
    func fetchWeather(lat: Double, lon: Double) -> Future<WeatherResponse, Error>
}


final class WeatherService: WeatherServiceProtocol {
    
    struct Constants {
        static let geoBaseURL = "https://api.openweathermap.org/geo/1.0/direct"
        static let weatherBaseURL = "https://api.openweathermap.org/data/2.5/weather"
        
    }
    
        
    private var cancellable = Set<AnyCancellable>()
    var location: Location?
    
    func fetchWeather(lat: Double, lon: Double) -> Future<WeatherResponse, Error> {
        return Future { promise in
            
            let weatherURLString = "\(Constants.weatherBaseURL)?lat=\(lat)&lon=\(lon)&appid=\(myConstants.apiKey)"
            guard let weatherURL = URL(string: weatherURLString) else {
                promise(.failure(NetworkError.invalidURL(weatherURLString)))
                return
            }
            
            URLSession.shared.dataTaskPublisher(for: weatherURL)
                .map { $0.data}
                .decode(type: WeatherResponse.self, decoder: JSONDecoder())
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let err):
                        promise(.failure(err))
                    }
                } receiveValue: { WeatherResponse in
                    promise(.success(WeatherResponse))
                    
                }
                .store(in: &self.cancellable)
        }
    }
    
    
    private func fetchGeoLocation(_ search : String) -> Future<Location, Error> {
        return Future { promise in
            
            let encodedSearch = search.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let geoURLString = "\(Constants.geoBaseURL)?q=\(encodedSearch)&limit=1&appid=\(myConstants.apiKey)"
            guard let geoURL = URL(string: geoURLString) else {
                promise(.failure(NetworkError.invalidURL(geoURLString)))
                return
            }
            
            URLSession.shared.dataTaskPublisher(for: geoURL)
                .map { $0.data }
                .decode(type: [Location].self, decoder: JSONDecoder())
                .compactMap { $0.first }
                .sink { [weak self] completion in
                    switch completion {
                        
                    case .failure(let err):
                        promise(.failure(err))
                    case .finished:
                        if self?.location == nil {
                            promise(.failure(NetworkError.invalidURL("Invalid Location")))
                        }
                            break
                        }
                    } receiveValue: { [weak self] location in
                        self?.location = location
                        promise(.success(location))
                        
                    }
                    .store(in: &self.cancellable)
                }
           }
    
    
    func fetchWeather(search: String) -> Future<WeatherResponse, Error> {
        
        location = nil
        return Future { [weak self] promise in
            guard let self = self else { return }
            self.fetchGeoLocation(search)               //API call
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let err):
                        promise(.failure(err))
                    }
                } receiveValue: { location in
                    self.fetchWeather(lat: location.lat, lon: location.lon)        //API call
                        .sink { completion in
                            switch completion {
                            case .finished:
                                if self.location == nil {
                                    promise(.failure(NetworkError.invalidURL("Invalid Location")))
                                }
                                break
                            case .failure(let err):
                                promise(.failure(err))
                            }
                        } receiveValue: { weatherResponse in
                            promise(.success(weatherResponse))
                        }
                        .store(in: &self.cancellable)
                }
                .store(in: &self.cancellable)
        }
    }
}
