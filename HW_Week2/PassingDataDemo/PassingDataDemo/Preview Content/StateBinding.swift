//
//  StateBinding.swift
//  PassingDataDemo
//
//  Created by Houman Irani on 6/11/23.
//

import SwiftUI

struct StateBinding: View {
    
    @State private var change = false;
    
    var body: some View {
        NavigationView{
            VStack{
                GlobeView(change: $change)
            }
            .navigationTitle("Globe")
        }
    }
}

struct GlobeView: View {
    
    @Binding var change: Bool
    
    var body: some View{
        
        VStack {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 200, height: 200)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    change.toggle()
                }
                .preferredColorScheme(change ? .dark : .light)
        }
        .padding()
        
    }
}


struct StateBinding_Previews: PreviewProvider {
    static var previews: some View {
        StateBinding()
    }
}
