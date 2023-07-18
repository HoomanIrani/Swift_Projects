//
//  ContentView.swift
//  AsyncAwaitDemo
//
//  Created by Houman Irani on 6/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model: FlightBookingManager = FlightBookingManager()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
