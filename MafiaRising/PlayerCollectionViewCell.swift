//
//  PlayerCollectionViewCell.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 7/4/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    
    // LATER CREATE A SIMILAR CHECKBOX CODE FOR BETTER FUNCITONALITY
    var playerBtnView: UIButton!
    
    
    override func awakeFromNib() {
        playerBtnView = UIButton(frame: contentView.frame)
        playerBtnView.contentMode = .scaleAspectFill
        playerBtnView.clipsToBounds = true
        playerBtnView.addTarget(self, action: #selector(selectPlayer), for: .touchUpInside)
        contentView.addSubview(playerBtnView)
    }
    
    func selectPlayer() {
        print("selecting person")
    }
    
}
