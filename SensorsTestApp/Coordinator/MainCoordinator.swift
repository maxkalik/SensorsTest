//
//  MainCoordinator.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/1/20.
//

enum ViewControllerType: String, CaseIterable {
    case accelerometer = "Accelerometer"
    case gyroscope = "Gyroscope"
    case deviceMotion = "Device Motion"
    case magnetometer = "Magnetometer"
    case motionActivity = "Motion Activity"
    case pedometer = "Pedometer"
    case altimeter = "Altimeter"
}

import UIKit

class MainCoordinator: Coordinator {
    
    private var dataList: [String] = ViewControllerType.allCases.map { $0.rawValue }
    
    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeTableViewController.instantiate()
        viewController.coordinator = self
        viewController.dataList = dataList
        navigationController.pushViewController(viewController, animated: false)
    }
    
    
    func navigateToViewController(from index: Int) {
        var viewController: DataViewController
        viewController = DataViewController.instantiate()
        
        switch index {
        case 0: viewController.dataType = .accelerometer
        case 1: viewController.dataType = .gyroscope
        case 2: viewController.dataType = .deviceMotion
        case 3: viewController.dataType = .magnetometer
        case 4: viewController.dataType = .motionActivity
        case 5: viewController.dataType = .pedometer
        case 6: viewController.dataType = .altimeter
        default: return
        }
        
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}
