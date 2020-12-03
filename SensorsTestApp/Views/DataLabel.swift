//
//  DataLabel.swift
//  SensorsTestApp
//
//  Created by Maksim Kalik on 12/2/20.
//

import UIKit

class DataLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    func commonInit() {
        font = UIFont.systemFont(ofSize: 21.0, weight: .semibold)
        isHidden = true
    }
}
