// This is an important framework when you deal with network APIs
// It is always usable with minor changes

import Foundation
import Combine


class MovieService {
    
    var cancellable = Set<AnyCancellable>()
    let urlString = "https://www.omdbapi.com/?i=tt3896198&apikey=e91f163f&s="
    
    func fetchMovies(_ searchText: String) -> Future<[Movie], Error>{
        return Future{[weak self] promise in
            guard let self = self else{return}
            let finalUrlString = self.urlString + searchText               // leaking memory use guard above
            guard let url = URL(string: finalUrlString) else{return}
            
            URLSession.shared.dataTaskPublisher(for: url)                  // API call
                .map{ $0.data }
                .decode(type: MovieResponse.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink{completion in                                        // Subscribing to events coming from publisher
                    switch completion{
                    case .finished:
                        break
                    case .failure(let err):
                        promise(.failure(err))
                    }
                } receiveValue: { response in
                    promise(.success(response.search))
                }
                .store(in: &self.cancellable)
        }
    }
}
