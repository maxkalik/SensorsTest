//
//  CMAltimeter+Shared.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/3/20.
//

import CoreMotion

extension CMAltimeter {
    static var shared = CMAltimeter()
    
    func startAltimeter(complition: @escaping (String, String) -> Void) {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            startRelativeAltitudeUpdates(to: .main) { (data, error) in
                if let error = error { debugPrint(error.localizedDescription )} else {
                    guard let altimeterData = data else { return }
                    let pressure = altimeterData.pressure
                    let altitude = altimeterData.relativeAltitude
                    complition(Helpers.roundToString(pressure), Helpers.roundToString(altitude))
                }
            }
        }
    }
}
