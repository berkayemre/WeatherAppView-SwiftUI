//
//  ContentView.swift
//  WeatherApp-SwiftUI
//
//  Created by Berkay Emre Aslan on 23.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
         ZStack {
            BackgroundView(isNight: $isNight)
            VStack
            {
                CityTextView(cityName: "Maltepe, IST")
                MainWeatherStatusView(imageName: isNight ? "moon.fill" : "cloud.sun.fill",
                                      temperature: 35)
                
                HStack(spacing: 20){
                    
                        WeatherDayView(dayOfWeek: "TUE", 
                                       imageName: "cloud.sun.fill",
                                       temperature: 36)
                   
                        WeatherDayView(dayOfWeek: "WED", 
                                       imageName: "sun.max.fill",
                                       temperature: 38)
                   
                        WeatherDayView(dayOfWeek: "THU", 
                                       imageName: "wind",
                                       temperature: 33)
                   
                        WeatherDayView(dayOfWeek: "FRI", 
                                       imageName: "sunset.fill",
                                       temperature: 35)
                    
                        WeatherDayView(dayOfWeek: "SAT", 
                                       imageName: "moon.stars.fill",
                                       temperature: 29)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors:[isNight ? .black : .blue,isNight ? .gray : Color.teal],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10)
        {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


