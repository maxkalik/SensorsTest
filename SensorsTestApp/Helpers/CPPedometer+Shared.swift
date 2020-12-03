//
//  CPPedometer+Shared.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/2/20.
//

import CoreMotion

extension CMPedometer {
    static var shared = CMPedometer()
    
    func startPedometer(complition: @escaping (String) -> Void) {
        if CMPedometer.isStepCountingAvailable() {
            startUpdates(from: Date()) { (data, error) in
                if let error = error { debugPrint(error.localizedDescription )} else {
                    guard let numberOfSteps = data?.numberOfSteps else { return }
                    let steps = Int(truncating: numberOfSteps)
                    DispatchQueue.main.async {
                        complition("\(steps) steps")
                    }
                }
            }
        }
    }
}
