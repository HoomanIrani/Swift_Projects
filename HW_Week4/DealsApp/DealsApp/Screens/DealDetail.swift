import SwiftUI

struct DealDetail: View {
    let deal: Deal
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: deal.product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(16)
            } placeholder: {
                Image(systemName: "photo")
            }
            .padding(.top, 16)
            .padding(.horizontal, 32)
            
            Text(deal.title)
                .font(.title)
                .bold()
                .foregroundColor(.black)
            
            Text("Price: $\(deal.price)")
                .font(.system(size: 25))
                .foregroundColor(.green)
                .padding(.top, 8)
            
            Text(deal.product.description)
                .font(.body)
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Likes: \(deal.likes.count)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                
                Text("Dislikes: \(deal.dislikes.count)")
                    .font(.subheadline)
                    .foregroundColor(.red)
                
                Text("Comments: \(deal.comments.count)")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                
                
                
                Button(action: {
                    
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                .padding(.top, 16)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Deal Detail")
    }
}

