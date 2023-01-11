//
//  CLLocation+Extensions.swift
//  WidgetsExtension
//
//  Created by Osman Yıldırım
//

import MapKit

extension CLLocation {
    /// Current location will convert to Image.
    func toImage(size: CGSize, callback: @escaping (UIImage?) -> Void) {
        let options = MKMapSnapshotter.Options()
        options.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 4046, longitudinalMeters: 4046)
        options.size = size
        
        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start { snapshot, _ in
            guard let snapshot else {
                callback(nil)
                return
            }
            callback(snapshot.image)
        }
    }
}
