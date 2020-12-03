//
//  CMMotionManager.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/1/20.
//

import CoreMotion

extension CMMotionManager {
    static var shared = CMMotionManager()
    
    func startAccelerometer(complition: @escaping (CMAcceleration) -> Void) {
        if isAccelerometerAvailable {
            accelerometerUpdateInterval = 0.3
            startAccelerometerUpdates(to: .main) { (data, error) in
                if let error = error { debugPrint(error.localizedDescription )} else {
                    guard let rate = data?.acceleration else { return }
                    complition(rate)
                }
            }
        }
    }
    
    func startGyros(complition: @escaping (CMRotationRate) -> Void) {
        if isGyroAvailable {
            gyroUpdateInterval = 0.3
            startGyroUpdates(to: .main) { (data, error) in
                if let error = error { debugPrint(error.localizedDescription )} else {
                    guard let rate = data?.rotationRate else { return }
                    complition(rate)
                }
            }
        }
    }
    
    func startDeviceMotion(complition: @escaping (CMAcceleration) -> Void) {
        if isDeviceMotionAvailable {
            deviceMotionUpdateInterval = 0.3
            startDeviceMotionUpdates(to: .main) { (data, error) in
                if let error = error { debugPrint(error.localizedDescription )} else {
                    guard let rate = data?.gravity else { return }
                    complition(rate)
                }
            }
        }
    }
    
    func startMagnetometer(complition: @escaping (CMMagneticField) -> Void) {
        if isMagnetometerAvailable {
            magnetometerUpdateInterval = 0.3
            startMagnetometerUpdates(to: .main) { (data, error) in
                if let error = error { debugPrint(error.localizedDescription )} else {
                    guard let rate = data?.magneticField else { return }
                    complition(rate)
                }
            }
        }
    }
}
