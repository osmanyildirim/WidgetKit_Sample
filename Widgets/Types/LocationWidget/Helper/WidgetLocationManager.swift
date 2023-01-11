//
//  LocationManager.swift
//  IntentExtension
//
//  Created by Osman Yıldırım
//

import Foundation
import CoreLocation

/// Location Manager for LocationWidget to request updates about the device's location or listen for changes in the device's location.
final class WidgetLocationManager: NSObject, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager?
    private var handler: ((CLLocation) -> Void)?

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager!.delegate = self

        if locationManager?.authorizationStatus == .notDetermined {
            locationManager?.requestWhenInUseAuthorization()
        }
    }

    /// Get current location
    func getLocation(handler: @escaping (CLLocation) -> Void) {
        self.handler = handler
        locationManager?.requestLocation()
    }

    /// Location updates delegate method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        handler?(location)
    }

    /// Failed when get current location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
