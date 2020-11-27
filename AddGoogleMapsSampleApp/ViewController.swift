//
//  ViewController.swift
//  AddGoogleMapsSampleApp
//
//  Created by Hamid Hoseini on 11/26/20.
//

import UIKit
import CoreLocation
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        GMSServices.provideAPIKey("key should be here...")
        
        print(" License: \n\n\(GMSServices.openSourceLicenseInfo())")
    }
    
    //func locationManager(_ manager: CLLocationManager,
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        let coordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 1)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = coordinate
        marker.title = "California"
        marker.snippet = "US"
        marker.map = mapView
    }
}

