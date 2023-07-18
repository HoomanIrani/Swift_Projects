import Foundation
import Combine


enum AsyncStatus {
    case initial, loading, loaded, error
}


class MoviesViewModel: ObservableObject{
    
    @Published var movies = [Movie]()
    @Published var status: AsyncStatus = .initial
    
    var cancellable = Set<AnyCancellable>()
    let service: MovieServiceProtocol
    
    init(service: MovieServiceProtocol = MovieService()) {
        self.service = service
    }
    
    func getMovies(_ search: String){
        service.fetchMovies(search)
            .sink{completion in
                switch completion{
                case .finished:
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }receiveValue: { movies in
                self.movies = movies
            }
            .store(in: &cancellable)
    }
    
    
// get
//    @MainActor func getPostsAsyncAwait(){
//        Task{
//            do{
//                let posts: [Post] = try await MovieService.fetchPostsUsingAsyncAwait()
//                self.movies = self.processPosts(posts)
//            }catch{
//                if let error = error as? APIError{
//                    print(error.description)
//                }     else{
//                    print(error.localizedDescription)
//                }       }
//        }
//    }
    
    
    
    //Post
//    func addPost(_ postData:PostData) async throws -> Post{
//        guard let url = URL(string: Constants.baseURL) else{
//            throw APIError.invalidUrl
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = try JSONEncoder().encode(postData)
//        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        guard let resp = (response as? HTTPURLResponse), resp.statusCode == 201 else{
//            throw APIError.serviceUnavailable
//        }
//
//        if let responseString = String(data: data, envoding: .utf8){
//            print("Response: \(responseString)")
//        }
//
//        return try JSONDecoder().devode(Post.self, from: data)
//    }
    
//    func getchPostsAsyncSeait<T: Decodable>() async throws -> T{
//        guard let url = URL(string: Constants.baseURL) else{
//            throw APIError.invalidUrl
//        }
//
//        let (data, response) = try await URLSession.shared.data(from: URL)
//    }
}

