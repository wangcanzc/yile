//
//  FFLocationManager.swift
//  FindFriend
//
//  Created by coramo on 16/8/11.
//  Copyright © 2016年 mrdocan. All rights reserved.
//

import UIKit
import CoreLocation

public typealias FFLocationDidUpdateWhen = (location: CLLocation) -> Void

final class FFLocationManager: NSObject, CLLocationManagerDelegate{
    static let shareLocationManager :FFLocationManager = FFLocationManager()
    
    var locationDidUpdateWhen: FFLocationDidUpdateWhen = {(location) in }
    
    var location: CLLocation = CLLocation(latitude: -1, longitude: -1)
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    var locationGetEnabled: Bool {
        get {
            if CLLocationManager.locationServicesEnabled() && CLLocationManager.authorizationStatus() == .AuthorizedAlways && CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
                return true
            }
            return false
        }
        set {}
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
    }
        
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func startUpdatingLocation( whenBackBlock: FFLocationDidUpdateWhen ) {
        locationManager.startUpdatingLocation()
        locationDidUpdateWhen = whenBackBlock
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        location = newLocation
        locationDidUpdateWhen(location: newLocation)
        locationManager.stopUpdatingLocation()
    }
}
