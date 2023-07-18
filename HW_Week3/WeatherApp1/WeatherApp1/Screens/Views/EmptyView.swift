//
//  EmptyView.swift
//  WeatherApp1
//
//  Created by Houman Irani on 6/30/23.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack {
                Text("   Welcome to Weather")
                    .font(.system(.title))
                    .bold()
                    .foregroundColor(.black)
                    .padding()
            }
            HStack{
                Spacer()
                Image(systemName:"cloud.sun.rain.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                    .foregroundColor(.black)
                Spacer()
            }
        }
        .padding()
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
