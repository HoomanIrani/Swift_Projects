//
//  DayView.swift
//  WeatherAppDemo
//
//  Created by Houman Irani on 6/11/23.
//

import SwiftUI

struct DayView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 10){
                Label("5-DAY FORECAST", systemImage: "calendar")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                
                VStack(spacing: 15){
                    ForEach(DayData.mockData){ day in
                        HStack(spacing: 15){
                            Text(day.day)
                                .font(.system(size: 18))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                                .padding(10)
                            
                            Image(systemName: day.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.primary)
                                .padding(10)
                            
                            Text(day.highTemp)
                                .font(.system(size: 18))
                                .foregroundColor(.orange)
                                .padding(10)
                            
                            Text(day.lowTemp)
                                .font(.system(size: 18))
                                .foregroundColor(.green)
                                .padding(10)
                            
                        }
                    }
                }
                
                
            }
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
