//
//  UILabel.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/2/20.
//

import UIKit

extension UIView {
    func fadeIn() {
        alpha = 0
        isHidden = true
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1 } completion: { value in
            self.isHidden = false
        }
    }
    
    func fadeOut() {
        alpha = 1
        isHidden = false
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0 } completion: { value in
            self.isHidden = true
        }
    }
}
