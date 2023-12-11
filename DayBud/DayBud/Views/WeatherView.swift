//
//  WeatherView.swift
//  Weather
//
//  Created by Jonathan Mascarenhas on 11/13/23.
//

import SwiftUI

struct WeatherView: View {
    var weather :ResponseBody
    @EnvironmentObject var dayViewModel: DayViewModel

    var body: some View {
            ZStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(weather.name)
                            .bold().font(.title)
                        
                        Text("Weather for \(dayViewModel.selectedDate.formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack (spacing: 20){
                                Image(systemName: "sun.max")
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
                        
                        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2018/03/02/17/19/paris-3193674_1280.jpg")) {
                            image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 350)
                            
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Spacer()
                
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather ").bold()
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
