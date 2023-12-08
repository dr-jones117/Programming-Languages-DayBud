//
//  ContentView.swift
//  Weather
//
//  Created by Jonathan Mascarenhas on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            // if we have a location display it
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                
                else {
                    LoadingView()
                        .task {
                            // try catch block to see if we can get weather from the manager
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }
                            // in case of error
                            catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }
             else {
                // while we are loading, display the loading page
                if locationManager.isLoading {
                    LoadingView()
                }
                 // display the welcome page otherwise
                else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
             }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .colorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
