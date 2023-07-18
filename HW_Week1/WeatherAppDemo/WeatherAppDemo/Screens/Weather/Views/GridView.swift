//
//  GridView.swift
//  WeatherAppDemo
//
//  Created by Houman Irani on 6/16/23.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        
        let column: [GridItem] = [
            GridItem(.fixed(175)),
            GridItem(.fixed(175))
        ]
        
        
        LazyVGrid(columns: column){
            ForEach(GridData.mockData) { item in
                VStack(spacing: 20){
                    Label(item.name, systemImage: item.symbol)
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                    Text(item.des)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray.opacity(0.25))
                .foregroundColor(.white)
                .cornerRadius(15)
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
