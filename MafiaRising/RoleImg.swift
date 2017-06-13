//
//  RoleImg.swift
//  MafiaRising
//
//  Created by Admin on 6/13/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import Foundation

class RoleImg: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateImg(pictureName: String) {
        self.image = UIImage(named: pictureName)
    }
    
}
