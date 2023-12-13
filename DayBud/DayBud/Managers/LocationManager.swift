//
//  LocationManager.swift
//  Weather
//
//  Created by Jonathan Mascarenhas on 11/13/23.
//

import Foundation
import CoreLocation

// MARK: - LocationManager Class
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // MARK: Properties
    
    // Core Location Manager instance
    let manager = CLLocationManager()
    
    // Published properties to observe changes in location and loading status
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    // MARK: Initialization
    
    override init () {
        super.init()
        // Set delegate to self to receive location updates
        manager.delegate = self
    }
    
    // MARK: Public Methods
    
    /// Request the current device location
    func requestLocation() {
        // Set loading status to true before requesting location
        isLoading = true
        manager.requestLocation()
    }
    
    // MARK: CLLocationManagerDelegate Methods
    
    /// Called when the location manager receives updated locations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Update the location with the first coordinate from the received locations
        location = locations.first?.coordinate
        // Set loading status to false as location update is complete
        isLoading = false
    }
    
    /// Called when the location manager encounters an error while retrieving location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Log an error message when there is an issue getting the location
        print("Error getting location", error)
    }
}
