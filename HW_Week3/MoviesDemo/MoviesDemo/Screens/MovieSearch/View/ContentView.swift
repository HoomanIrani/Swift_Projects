import SwiftUI

struct ContentView: View {
    
    @State var searchText = "titanic"
    @StateObject var viewModel = MovieViewModel()
    
   // let datasourse: [Movie] = [Movie.mock]
    
    var body: some View {
        NavigationView{
            VStack{
                searchField
                listView()
                    .onAppear {
                    viewModel.getMovies(searchText)
                }
            }
            
            .navigationTitle("Movies")
        }
    }
    
    
    private func listView() -> some View {
        
        List(viewModel.movies, id: \.self){ movie in
            
            NavigationLink {
                Text(movie.title)
            } label: {
                MovieCell(movie: movie)
            }
        }
    }
    
    
    private var searchField: some View {
        
        TextField("Search for movie", text: $searchText)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(15)
            .padding(.horizontal, 16)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
