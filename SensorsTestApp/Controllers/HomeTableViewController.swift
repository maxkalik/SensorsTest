//
//  HomeTableViewController.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/1/20.
//

import UIKit

class HomeTableViewController: UITableViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    var list = ["Accelerometer", "Device Motion", "Gyroscope"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
    }
}

// MARK: - UITableViewDelegate

extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let cell = tableView.cellForRow(at: indexPath)
        coordinator?.toAccelerometer()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell {
            cell.textLabel?.text = list[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}


