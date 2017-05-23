//
//  Header.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class Header: UILabel {
    
    let blackColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
    
    override func awakeFromNib() {
        /*
        // Constraints
        let heightConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 20)
        let leadingConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 0)
        let trailingConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 0)
        let topConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 0)
        
        self.addConstraints([heightConstraint, leadingConstraint, trailingConstraint, topConstraint])
        
        */
        self.backgroundColor = blackColor
        
    }
    
    
}
