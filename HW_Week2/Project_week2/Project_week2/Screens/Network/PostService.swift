//
//  PostService.swift
//  Project_week2
//
//  Created by Houman Irani on 6/22/23.
//

import Foundation
import Combine

class PostService {
    
    var cancellable = Set<AnyCancellable>()
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    func fetchPosts() -> Future<[Post], Error> {
        
        return Future { promise in
            
            let finalURLString = self.urlString
            let url = URL(string: finalURLString)!
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map {$0.data}
                .decode(type: [Post].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let err):
                        promise(.failure(err))
                    }
                } receiveValue: { response in
                    promise(.success(response))
                }
                .store(in: &self.cancellable)
        }
    }
}
