//
//  MainCoordinator.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/1/20.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let viewController = HomeTableViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func toAccelerometer() {
        let viewController = AccelerometerViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
