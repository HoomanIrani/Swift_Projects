//
//  ContentView.swift
//  WeatherApp1
//
//  Created by Houman Irani on 6/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.white, .blue, .yellow, .orange, .pink, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                    
                VStack {
                 switch viewModel.state {
                    case .initial:
                        EmptyView()
                    case .loading:
                        Text("Loading Data...")
                    case .loaded:
                        VStack {
                            ForEach(viewModel.weatherList) { weather in
                                WeatherCell(weather: weather)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        Spacer()
                     
                 case .error:
                     Text("Error")
                 case .noResults:
                     Text("No results")
                 }
                    
                }
                .padding()
                
                
                .navigationTitle(Text("Weather"))
                .onAppear {
                    viewModel.shouldGetDefaultCityWeather()
                }
                
            }
        }
        .searchable(text: $searchText, prompt: "Search for a city/state in USA")
        
        .onChange(of: searchText, perform: { newValue in
            if newValue.isEmpty || viewModel.state == .noResults {
                viewModel.state = .initial
            }
        })
        .onSubmit(of: .search) {
            viewModel.getWeather(searchText)
        }
            
    }
        
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

