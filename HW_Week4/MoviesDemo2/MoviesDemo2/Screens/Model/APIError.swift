//
//  APIError.swift
//  MoviesDemo2
//
//  Created by Houman Irani on 7/14/23.
//

import Foundation

enum APIError: Error {
    
    case decodingError, invalidUrl
    
    var description: String {
        
        switch self {
        case .decodingError:
            return "Decoding Error"
        case .invalidUrl:
            return "Invalid URL"
        }
    }
}
