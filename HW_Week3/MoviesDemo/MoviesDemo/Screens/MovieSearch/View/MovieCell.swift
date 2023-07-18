import Foundation
import SwiftUI

struct MovieCell: View{
    let movie: Movie
    
    var body: some View{
        HStack{
            AsyncImage(url: URL(string: movie.poster)){ image in
                image
                    .resizable()
                    .frame(width:120, height: 150)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }placeholder: {
                Image(systemName: "photo")
            }
            HStack{
                VStack(spacing: 10){
                    Text(movie.title)
                    Text(movie.year)
                }
                Spacer()
                Text(movie.type)
            }
        }
    }
}

struct MovieCell_Previews: PreviewProvider{
    static var previews: some View{
        MovieCell(movie:Movie.mock)
    }
}
