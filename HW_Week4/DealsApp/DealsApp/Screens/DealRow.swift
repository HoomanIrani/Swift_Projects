import SwiftUI

struct DealRow: View {
    let deal: Deal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                AsyncImage(url: URL(string: deal.product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(deal.title)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    
                    Text("Price: $\(deal.price)")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
            }
            
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

