import SwiftUI

struct ContentView: View {
    @State var searchText = "titanic"
//    let datasource:[Movie] = [Movie.mock]
    @StateObject var viewModel = MoviesViewModel()
    var body: some View {
        NavigationView{
            VStack{
                searchField
                    .onChange(of: searchText){newValue in
                        viewModel.getMovies(newValue)
                    }
                listView()
                
            }
            .navigationTitle("Movies")
            .onAppear{
                viewModel.getMovies(searchText)
            }
            
        }
    }
    //http://www.omdbapi.com/?i=tt3896198&apikey=e91f163f
    private func listView()->some View{
        List(viewModel.movies, id:\.self){movie in
            NavigationLink{
                Text(movie.title)
            }label: {
                MovieCell(movie: movie)
            }
            
        }
    }
    
    
    private var searchField: some View{
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
