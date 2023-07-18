//
//  HeaderView.swift
//  WeatherAppDemo
//
//  Created by Houman Irani on 6/10/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
            VStack{
                Text("Cupertino")
                    .font(.system(size: 45).bold())
                    .foregroundColor(.white)
                
                Text("70°")
                    .font(.system(size: 80).bold())
                    .foregroundColor(.white)
                                    
                Text("Sunny")
                    .font(.system(size: 25).bold())
                    .foregroundColor(.white)
                
                Text("H:76°  L:51°")
                    .font(.system(size: 20).bold())
                    .foregroundColor(.white)
                
            }
            Spacer()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
