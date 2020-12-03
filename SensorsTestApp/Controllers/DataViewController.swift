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
    
    var dataType: ViewControllerType? {
        didSet { title = dataType?.rawValue }
    }
    
    @IBOutlet var titleLablesCollection: [TitleLabel]!
    @IBOutlet weak var xPositiveLabel: DataLabel!
    @IBOutlet weak var xNegativeLabel: DataLabel!
    @IBOutlet weak var yPositiveLabel: DataLabel!
    @IBOutlet weak var yNegativeLabel: DataLabel!
    @IBOutlet weak var zLabel: DataLabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        update()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        CMMotionManager.shared.stopAccelerometerUpdates()
    }
    
    private func update() {
        switch dataType {
        case .accelerometer:    startAccelerometer()
        case .gyroscope:        startGyros()
        case .deviceMotion:     startGyros()
        case .magnetometer:     startMagnetometer()
        case .motionActivity:   startMotionActivity()
        case .pedometer:        startPedometr()
        case .altimeter:        startAltimeter()
        default: return
        }
    }
    
    func updateLabels(x: Double, y: Double, z: Double) {
        Helpers.showLabel(zLabel, with: z)
        Helpers.showLabels(positive: xPositiveLabel, negative: xNegativeLabel, with: x)
        Helpers.showLabels(positive: yPositiveLabel, negative: yNegativeLabel, with: y)
    }
    
    private func startAccelerometer() {
        Helpers.showLabels(titleLablesCollection)
        Helpers.showHidedLabel(zLabel)
        CMMotionManager.shared.startAccelerometer { data in
            self.updateLabels(x: data.x, y: data.y, z: data.z)
        }
    }
    
    private func startGyros() {
        Helpers.showLabels(titleLablesCollection)
        Helpers.showHidedLabel(zLabel)
        CMMotionManager.shared.startGyros() { data in
            self.updateLabels(x: data.x, y: data.y, z: data.z)
        }
    }
    
    private func startMagnetometer() {
        Helpers.showLabels(titleLablesCollection)
        Helpers.showHidedLabel(zLabel)
        CMMotionManager.shared.startMagnetometer() { data in
            self.updateLabels(x: data.x, y: data.y, z: data.z)
        }
    }
    
    private func startMotionActivity() {
        Helpers.showLabel(zLabel, with: "Standing")
        CMMotionActivityManager.shared.startMotionActivity { (data) in
            self.zLabel.text = data
        }
    }
    
    private func startPedometr() {
        Helpers.showLabel(zLabel, with: "0 steps")
        CMPedometer.shared.startPedometer { steps in
            self.zLabel.text = steps
        }
    }
    
    private func startAltimeter() {
        Helpers.showLabel(self.zLabel, with: "Altitude\n0.000")
        Helpers.showLabel(self.yNegativeLabel, with: "100.000\nPressure")
        CMAltimeter.shared.startAltimeter { (pressure, altitude) in
            Helpers.showLabel(self.zLabel, with: "Altitude\n\(altitude)")
            Helpers.showLabel(self.yNegativeLabel, with: "\(pressure)\nPressure")
        }
    }
}
