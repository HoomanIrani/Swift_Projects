//
//  ContentView.swift
//  GridDemo
//
//  Created by Houman Irani on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    
    let data = (1...100).map {"Item \($0)"}
    
    var body: some View {
        let column: [GridItem] = [
            GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 10, alignment: .center)]
        
        NavigationView{
            
            ScrollView{
                LazyVGrid(columns: column){
                    ForEach(data, id: \.self){ item in
                        NavigationLink(destination: Text(item)){
                            VStack{
                                Text("The Due Point is 47°F now")
                                Text(item)
                            }
                            .padding()
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                        }
                    }
                }
            }
            .navigationTitle("Grids")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
