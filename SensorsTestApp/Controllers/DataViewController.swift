//
//  AccelerometerViewController.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/2/20.
//

import UIKit
import CoreMotion

class DataViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var xPositiveLabel: DataLabel!
    @IBOutlet weak var xNegativeLabel: DataLabel!
    @IBOutlet weak var yPositiveLabel: DataLabel!
    @IBOutlet weak var yNegativeLabel: DataLabel!
    @IBOutlet weak var zLabel: DataLabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        zLabel.isHidden = false
        update()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        CMMotionManager.shared.stopAccelerometerUpdates()
    }
    
    func update() {
        if CMMotionManager.shared.isAccelerometerAvailable {
            CMMotionManager.shared.accelerometerUpdateInterval = 0.3
            CMMotionManager.shared.startAccelerometerUpdates(to: .main) { [self] (data, error) in
                if let error = error { debugPrint(error.localizedDescription )} else {
                    guard let data = data else { return }
                    
                    let xValue: Double = data.acceleration.x
                    let yValue: Double = data.acceleration.y
                    let zValue: Double = data.acceleration.z
                    zLabel.text = Helpers.roundToString(zValue)
                    
                    Helpers.showLabels(positive: xPositiveLabel, negative: xNegativeLabel, with: xValue)
                    Helpers.showLabels(positive: yPositiveLabel, negative: yNegativeLabel, with: yValue)
                }
            }
        }
    }
}
