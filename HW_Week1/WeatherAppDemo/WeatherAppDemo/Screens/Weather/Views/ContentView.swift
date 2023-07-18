import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow.opacity(5.0),.blue.opacity(20.0)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            ScrollView(showsIndicators: false){
                
                HeaderView()
                    .padding(10)
                
                HourlyView()
                    .padding(10)
                
                DayView()
                    .padding(10)
                Divider()
                    .overlay(.yellow)
                    .padding(10)
                
                GridView()
                    .padding(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
