import Foundation
import Combine

class MovieViewModel: ObservableObject {
    
    @Published var movies = [Movie]()
    var cancellable = Set<AnyCancellable>()
    let servie = MovieService()
    
    func getMovies (_ search: String) {
        
        servie.fetchMovies(search)
            .sink { completion in
                switch completion {
                case .finished:
                     break
                case .failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { movies in  // leaking memory
                self.movies = movies
            }
            .store(in: &cancellable)
    }
}
