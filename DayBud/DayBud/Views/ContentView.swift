//
//  ContentView.swift
//  Weather
//
//  Created by Jonathan Mascarenhas on 11/13/23.
//

import SwiftUI

// Define the ContentView SwiftUI view
struct ContentView: View {
    // Create a StateObject for LocationManager to manage location updates
    @StateObject var locationManager = LocationManager()
    
    // Create an instance of WeatherManager to fetch weather data
    var weatherManager = WeatherManager()
    
    // State variable to hold weather data received from the API
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            // Check if we have a location
            if let location = locationManager.location {
                // Check if weather data is available
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    // Display a loading view while fetching weather data
                    LoadingView()
                        .task {
                            // Use async/await to fetch weather data
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                // While loading, display the loading page
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    // Display the welcome page when no location is available
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        // Set the background color and color scheme for the entire view
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .colorScheme(.dark)
    }
}

// Provide a preview for the ContentView
#Preview {
    ContentView()
}
