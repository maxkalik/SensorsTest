//
//  Coordinator.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/1/20.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
