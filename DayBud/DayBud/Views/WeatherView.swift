//
//  WeatherView.swift
//  Weather
//
//  Created by Jonathan Mascarenhas on 11/13/23.
//

import SwiftUI

struct WeatherView: View {
    var weather :ResponseBody

    // Helper function to determine the weather icon based on feelsLikeTemperature
    private func determineWeatherIcon() -> String {
        switch weather.main.feels_like {
        case ..<0:
            return "thermometer.snowflake"
        case 0..<10:
            return "thermometer.low"
        case 10..<20:
            return "thermometer.medium"
        case 20..<30:
            return "thermometer.high"
        default:
            return "sun.max"
        }
    }


    var body: some View {
            ZStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(weather.name)
                            .bold().font(.title)
                        
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack (spacing: 20){
                                Image(systemName: determineWeatherIcon())
                                                .font(.system(size: 40))
                                
                                Text(weather.weather[0].main)
                            }
                            .frame(width: 150, alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDouble() + "°")
                                .font(.system(size: 100))
                                .fontWeight(.bold)
                                .padding()
                        }
                        
                        Spacer()
                            .frame(height: 40)
                        
                        Image("rapidcity")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)

                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Spacer()
                
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now").bold()
                            .padding((.bottom))
                        HStack {
                            WeatherRow(logo: "thermometer.low", name: "Min temp",
                                       value: (weather.main.tempMin.roundDouble() + "°"))
                            
                            Spacer()
                            WeatherRow(logo: "thermometer.low", name: "Max temp",
                                       value: (weather.main.tempMax.roundDouble() + "°"))
                            .padding(.trailing, 20)
                        }
                        HStack {
                            WeatherRow(logo: "wind", name: "Wind Speed",
                                       value: (weather.wind.speed.roundDouble() + "m/s"))
                            
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity",
                                       value: (weather.main.humidity.roundDouble() + "%"))
                            .padding(.trailing, 20)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                                    .background(.white)
                                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .colorScheme(.dark)
        }
        
    }

#Preview {
    WeatherView(weather: previewWeather)
}

