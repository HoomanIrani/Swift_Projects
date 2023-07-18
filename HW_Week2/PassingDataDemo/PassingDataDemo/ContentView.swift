//
//  ContentView.swift
//  PassingDataDemo
//
//  Created by Houman Irani on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: PassingDataViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                List(viewModel.persons){ person in
                    HStack(spacing: 5){
                        Text(person.firstName)
                        Text(person.lastName)
                    }
                }
            }
            .navigationTitle("Globe")
            .navigationBarItems(trailing: Button("Refresh", action: {
                viewModel.fetchPerson()
            }))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PassingDataViewModel())
    }
}
