//
//  DeviceMotionViewController.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/2/20.
//

import UIKit

class DeviceMotionViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("device motion")
    }
}
