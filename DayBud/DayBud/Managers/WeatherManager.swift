//
//  WeatherManager.swift
//  Weather
//
//  Created by Jonathan Mascarenhas on 11/13/23.
//

import Foundation
import CoreLocation

// MARK: - WeatherManager Class
class WeatherManager {
    
    // MARK: Public Methods
    
    /// Fetches the current weather data for a given location using OpenWeatherMap API
    /// - Parameters:
    ///   - latitude: The latitude of the location.
    ///   - longitude: The longitude of the location.
    /// - Returns: An instance of ResponseBody representing the current weather data.
    /// - Throws: An error if there's an issue with the API request or decoding the response.
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        
        // Construct the API URL using the provided latitude and longitude
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("78a0a7d5a7c166e768bde31283d9330c")&units=metric") else {
            fatalError("Missing URL")
        }
        
        // Create a URLRequest with the constructed URL
        let urlRequest = URLRequest(url: url)
        
        // Perform the asynchronous data request using URLSession.shared
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // Check if the response status code is 200 (OK)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        // Decode the received JSON data into an instance of ResponseBody
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        // Return the decoded weather data
        return decodedData
    }
}


// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}


