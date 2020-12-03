//
//  CMMotionActivityManager+Shared.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/2/20.
//

import CoreMotion

extension CMMotionActivityManager {
    static var shared = CMMotionActivityManager()
    
    func startMotionActivity(complition: @escaping (String) -> Void) {
        if CMMotionActivityManager.isActivityAvailable() {
            startActivityUpdates(to: .main) { (data) in
                guard let activityData = data else { return }
                var activity: String
                
                if activityData.walking {
                    activity = "Walking"
                } else if activityData.running {
                    activity = "Running"
                } else if activityData.cycling {
                    activity = "Cycling"
                } else if activityData.automotive {
                    activity = "In the car"
                } else {
                    activity = "Standing"
                }
                complition(activity)
            }
        }
    }
}
