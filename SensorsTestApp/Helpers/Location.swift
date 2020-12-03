//
//  Location.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/3/20.
//

import CoreLocation

class Location {
    
    static func lookUpCurrentLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completionHandler: @escaping (CLPlacemark?) -> Void ) {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude), completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    completionHandler(firstLocation)
                } else {
                    completionHandler(nil)
                }
            })
        }
        
    static func getAddress(from placemark: CLPlacemark?) -> String {
        let country = placemark?.country ?? "Unknown"
        let city = placemark?.locality ?? "Unknown"
        let area = placemark?.administrativeArea ?? "Unknown"
        let street = placemark?.thoroughfare ?? "Unknown"
        let building = placemark?.subThoroughfare ?? "Unknown"
        return "Country: \(country)\nArea: \(area)\nCity: \(city)\nStreet: \(street)\nBuilding: \(building)"
    }
}
