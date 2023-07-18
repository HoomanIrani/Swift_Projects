//
//  WeatherResponse.swift
//  WeatherApp1
//
//  Created by Houman Irani on 6/25/23.
//

import Foundation

struct WeatherResponse: Codable {
    
    let name: String
    let coord: Coord
    let main: Main
    let weather: [Weather]
    let timezone: Int
}

struct Main: Codable {
    
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}

struct Location: Codable {
    
    let name: String
    let country: String
    let state: String
    let lat: Double
    let lon: Double
}

struct Coord: Codable {
    
    let lat: Double
    let lon: Double
}

struct Weather: Codable {
    
    let icon: String
}

