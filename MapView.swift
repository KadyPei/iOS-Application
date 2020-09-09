//
//  MapView.swift
//  Eater
//
//  Created by Charmaine Chan on 3/12/2019.
//  Copyright © 2019 nyu.edu. All rights reserved.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    
    let marker : GMSMarker = GMSMarker()
     @ObservedObject var locationManager = LocationManager()
    
    var lat: Double
    var long: Double

//        var userLatitude: Double {
//            return (locationManager.lastLocation?.coordinate.latitude ?? 0)
//        }
//
//        var userLongitude: Double {
//            return (locationManager.lastLocation?.coordinate.longitude ?? 0)
//        }
    
//    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
//      let geocoder = GMSGeocoder()
//        geocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: userLatitude, longitude: userLongitude)) {             response, error in
//          guard let address = response?.firstResult(), let lines = address.lines else {
//            return
//          }
//            let label = UILabel(frame: CGRect(x:0, y:0, width: 410, height: 30))
//            label.text = lines.joined(separator: "\n")
//            label.backgroundColor = .white
//            label.textAlignment = .center
//            mapView.addSubview(label)
//        }
//    }
    
    
    /// Creates a `UIView` instance to be presented.
    func makeUIView(context: Self.Context) -> GMSMapView {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinates at a specific zoom level
//        let camera = GMSCameraPosition.camera(withLatitude: userLatitude, longitude: userLongitude, zoom: 15.0)
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 15.0)
        
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    
    /// Updates the presented `UIView` (and coordinator) to the latest configuration.
    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
        // Creates a marker in the center of the map.
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: lat, longitude: long)) { response, error in
          guard let address = response?.firstResult(), let lines = address.lines else {
            return
          }
//            let label = UILabel(frame: CGRect(x:0, y:0, width: 410, height: 30))
//            label.text = lines.joined(separator: "\n")
//            label.backgroundColor = .white
//            label.textAlignment = .center
//            mapView.addSubview(label)
            self.marker.snippet = lines.joined(separator: "\n")
          }
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.map = mapView
        mapView.isMyLocationEnabled = true;
        mapView.settings.myLocationButton = true;
    }

}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(lat: self.lat, long: self.long)
//    }
//}

