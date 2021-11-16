//
//  LocationService.swift
//  Uber-Clone-App
//
//  Created by Paolo Prodossimo Lopes on 10/11/21.
//

import MapKit
import CoreLocation

typealias LocationServiceInheritanceTA = (NSObject & LocationServiceProtocol & CLLocationManagerDelegate)

protocol LocationServiceProtocol {
    func enableLocationManager()
    var mapView: MKMapView { get set }
}

final class LocationService: LocationServiceInheritanceTA {
    
    private let locationManager = CLLocationManager()
    var mapView: MKMapView = .init()
    
    func enableLocationManager() {
        
        locationManager.delegate = self
        
        self.locationManager.requestWhenInUseAuthorization()

            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }

            mapView.delegate = self
            mapView.mapType = .standard
            mapView.isZoomEnabled = true
            mapView.isScrollEnabled = true

            if let coor = mapView.userLocation.location?.coordinate{
                mapView.setCenter(coor, animated: true)
            }
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            DEBUGMessage("notDetermined")
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            DEBUGMessage("restricted")
            
        case .denied:
            DEBUGMessage("denied")
            
        case .authorizedAlways:
            DEBUGMessage("authorizedAlways")
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
        case .authorizedWhenInUse:
            DEBUGMessage("authorizedWhenInUse")
            locationManager.requestAlwaysAuthorization()
            
        @unknown default:
            break
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
        
        let locValue:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 23.5874, longitude: 46.6576)

        mapView.mapType = MKMapType.standard

        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "Javed Multani"
        annotation.subtitle = "current location"
        mapView.addAnnotation(annotation)
    }
    
}

extension LocationService: MKMapViewDelegate {
    
}
