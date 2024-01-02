//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Sami Ahmed on 02/01/2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject,ObservableObject,CLLocationManagerDelegate{
    //MARK: - Variables
    let manager = CLLocationManager()
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    // MARK: - Initialization
    override init() {
        super.init()
        manager.delegate = self
    }
    
    // MARK: - Function
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while getting Location",error.localizedDescription)
        isLoading = false
    }
    
    
}
