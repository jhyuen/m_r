//
//  CheckBox.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 6/7/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    
    // Images
    let checkedImage = UIImage(named: "MRFinal OptionsC4")! as UIImage
    let uncheckedImage = UIImage(named: "MRFinal OptionsC5")! as UIImage
    
    // Bool property
    var isChecked: Bool = true {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControlState.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = true
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
