
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [.green, .pink, .yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            
            VStack{
                Text("Friday, June 9")
                    .font(.system(size: 30).bold())
                    .foregroundColor(.white)
                Text("5:16")
                    .font(.system(size: 100).bold())
                    .foregroundColor(.white)
                Spacer()
                
                
                HStack{
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.gray.opacity(0.2))
                            .frame(width: 60, height: 60)
                        Button{
                            print("FlashLight button tapped")
                        }label: {
                            Image(systemName: "flashlight.off.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            
                        }
                    }
                    
                    Spacer()
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.gray.opacity(0.2))
                            .frame(width: 65, height: 65)
                        Button{
                            print("Camera button tapped")
                        }label: {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            
                        }
                    }
                    .padding()
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
