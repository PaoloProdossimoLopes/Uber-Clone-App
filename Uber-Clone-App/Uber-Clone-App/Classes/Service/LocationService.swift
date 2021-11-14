//
//  LocationService.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 10/11/21.
//

import MapKit

typealias LocationServiceInheritanceTA = (NSObject & LocationServiceProtocol & CLLocationManagerDelegate)

protocol LocationServiceProtocol {
    func enableLocationManager()
}

final class LocationService: LocationServiceInheritanceTA {
    
    private let locationManager = CLLocationManager()
    
    func enableLocationManager() {
        
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                print("DEBUG: notDetermined")
                locationManager.requestWhenInUseAuthorization()
                
            case .restricted:
                print("DEBUG: restricted")
            
            case .denied:
                print("DEBUG: denied")
                
            case .authorizedAlways:
                print("DEBUG: authorizedAlways")
                locationManager.startUpdatingLocation()
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                
            case .authorizedWhenInUse:
                print("DEBUG: authorizedWhenInUse")
                locationManager.requestAlwaysAuthorization()
                
            @unknown default:
                break
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
}
