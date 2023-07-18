import XCTest
import Combine
@testable import MoviesDemo2

// Goal here - test fetch call
// get the response (mock)
// test the objects values to see if the decoding worked correctly

// fetch call (success, failure)

enum FileName: String {
    
    case searchMovieSuccess
    case searchMovieFailure
}

final class MoviesViewModelTests: XCTestCase {
    
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        cancellables = []
    }
    
    func test_getMovies_success_returns_movies() {
        let exp = XCTestExpectation(description: "testing movies success")   // API by Apple to test your code agains Async code
        let viewModel = MoviesViewModel(service: MockMoviesService(fileName: .searchMovieSuccess))
        
        viewModel.getMovies("titanic")
        
        viewModel.$movies                 // published
            .sink { movies in
                let movie = movies.first!
                XCTAssertEqual(movie.title, "Titanic")
                exp.fulfill()
            }
            .store(in: &cancellables)
                                        
        wait(for: [exp], timeout: 5.0)
    }
    
    
    
    func test_getMovies_failure() {
        let exp = XCTestExpectation(description: "testing movies failure")
        let viewModel = MoviesViewModel(service: MockMoviesService(fileName: .searchMovieFailure))
        
        viewModel.getMovies("titanic")
        
        viewModel.$status
            .sink { state in
                XCTAssertEqual(state, .error)
                exp.fulfill()
                }
            .store(in: &cancellables)
        wait(for: [exp], timeout: 5.0)
    }
}

     

class MockMoviesService: MovieServiceProtocol {
    
    let fileName: FileName     // Dependency injection
    
    init(fileName: FileName) {
        self.fileName = fileName              // Dependency injection
    }
    
    private func loadMockData(_ file: String) -> URL? {
        return Bundle(for: type(of: self)).url(forResource: file, withExtension: "json")
    }
    
    func fetchMovies(_ searchText: String) -> Future<[MoviesDemo2.Movie], Error> {
        
        return Future {[weak self] promise in
            
            guard let self = self, let url = self.loadMockData(self.fileName.rawValue) else { return }
            
            let data = try! Data(contentsOf: url)    // unwrapping is not a good practice for production code but it is fine for testing
            
            do {
                let result =  try JSONDecoder().decode(MovieResponse.self, from: data)
                promise(.success(result.search))
            } catch {
                promise(.failure(APIError.decodingError))
            }
        }
    }
    
}
