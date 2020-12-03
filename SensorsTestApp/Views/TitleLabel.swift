//
//  TitleLabel.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/3/20.
//

import UIKit

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    func commonInit() {
        font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        alpha = 0.5
        isHidden = true
    }
}
