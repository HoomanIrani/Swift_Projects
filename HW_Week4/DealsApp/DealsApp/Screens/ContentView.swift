import SwiftUI
    

struct ContentView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                if viewModel.dealsData.isEmpty {
                    ProgressView()
                } else {
                    List(viewModel.dealsData) { deal in
                        NavigationLink(destination: DealDetail(deal: deal)) {
                            DealRow(deal: deal)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Deals")
            .onAppear {
                viewModel.getDeals()
            }
        }
        .accentColor(.black)
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

