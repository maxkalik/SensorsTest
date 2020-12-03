//
//  Helpers.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/2/20.
//

import UIKit

class Helpers {
    
    static func roundToString(_ value: Double) -> String {
        return String(format: "%.3f", value)
    }
    
    static func roundToString(_ value: NSNumber) -> String {
        return String(format: "%.3f", value.doubleValue)
    }
    
    static func showLabel(_ label: UILabel) {
        if label.isHidden { label.isHidden = false }
    }
    
    static func showLabel(_ label: UILabel, with value: String) {
        label.text = value
        showLabel(label)
    }
    
    static func showLabel(_ label: UILabel, with value: Double) {
        label.text = roundToString(value)
        showLabel(label)
    }
    
    static func showLabels(positive: UILabel, negative: UILabel, with value: Double) {
        if value > 0 {
            showLabel(positive, with: value)
            negative.isHidden = true
        } else {
            showLabel(negative, with: value)
            positive.isHidden = true
        }
    }
    
    static func showLabels(_ labels: [UILabel]) {
        for label in labels { showLabel(label) }
    }
    
    static func hideLablels(_ labels: [UILabel]) {
        for label in labels { label.isHidden = true }
    }
}
