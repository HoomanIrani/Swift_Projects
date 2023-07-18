//
//  HourlyView.swift
//  WeatherAppDemo
//
//  Created by Houman Irani on 6/10/23.
//

import SwiftUI

struct HourlyView: View {
    var body: some View {
        VStack(spacing: 10){
            Text("Sunny conditions will continue all day.")
                .font(.system(size: 15))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(2)
            
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack(spacing: 15){
                ForEach(HourlyData.mockData){ hour in
                    VStack(spacing: 10){
                        
                        Text(hour.time)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        Image(systemName: hour.image)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.primary)
                        Text(hour.tempreture)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                    .padding(10)
                }
              }
            }
        }
    }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView()
    }
}
