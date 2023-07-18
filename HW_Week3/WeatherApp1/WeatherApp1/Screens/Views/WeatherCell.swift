//
//  WeatherCell.swift
//  WeatherApp1
//
//  Created by Houman Irani on 6/30/23.
//

import SwiftUI

struct WeatherCell: View {
    
    let weather: WeatherInfo
    
    var body: some View {
        
        VStack(spacing: 35) {
            
            cityWeather
            averageWeather
        }
        .background(Color.clear)
    }
    
    
    var cityWeather: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(weather.name)
                
                    .font(.system(size: 25))
                    .bold()
                    .foregroundColor(.gray)
                Text(weather.time)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            Spacer()
            Text(weather.currentTemp)
                .font(.system(size: 20))
                .bold()
                .foregroundColor(.black)
        }
        .background(Color.clear)
    }
    
    var averageWeather: some View {
        HStack {
            Text(weather.description)
            AsyncImage(url: URL(string: weather.iconURLString)) { image in
                 image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .backgroundStyle(.gray.opacity(0.5))
            } placeholder: {
                Image(systemName:"cloud.sun")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .backgroundStyle(.gray.opacity(0.5))
                    .backgroundStyle(.gray.opacity(0.5))
            }

            Spacer()
            Text("H: \(weather.tempHigh) L: \(weather.tempLow)")
                .font(.system(size: 20))
                .foregroundColor(.black)

        }
        .background(Color.clear)
    }
}

struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(weather: WeatherInfo.mock)
    }
}
