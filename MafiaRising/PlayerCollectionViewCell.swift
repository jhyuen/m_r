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
    
    /*
    // Images
    let selectedImage = UIImage(named: "MRFinal OptionsC4")! as UIImage
    let unselectedImage = UIImage(named: "MRFinal OptionsC5")! as UIImage
    
    // Bool property
    var isSelected: Bool = true {
        didSet{
            if isSelected == true {
                self.setImage(selectedImage, for: UIControlState.normal)
            } else {
                self.setImage(unselectedImage, for: UIControlState.normal)
            }
        }
    } */
    
    override func awakeFromNib() {
        playerBtnView = UIButton(frame: contentView.frame)
        playerBtnView.contentMode = .scaleAspectFill
        playerBtnView.clipsToBounds = true
        
       /*
        if !Player.isDead {
            playerBtnView.
        }
         */
        
        contentView.addSubview(playerBtnView)
    }
    
   // let playerPicture = playerBtnView.image(for: .normal)
    
    // can't select dead player!!!!
    
    /*
    func selectPlayer(sender: UIButton) {
        //sender.tintColor = UIColor.red
        if let image = sender.imageView?.image?.withRenderingMode(.alwaysTemplate) {
            sender.setImage(image, for: .normal)
            sender.tintColor = UIColor.red
        }
        /*
        // Add the subview to the Button
        contentView.addSubview(overlay)
        */
        
        print("selecting person")
    }
 */
    
}
