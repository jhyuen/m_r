//
//  GameRolesViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class GameRolesViewController: UIViewController, UIScrollViewDelegate {
    
    // UI Outlets
    @IBOutlet weak var rolesScrollView: UIScrollView!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    // Profile Weird Noises Array
    var profileNoisesNames: Array<String> = []
    
    // ScrollView Constants
    let WIDTH: CGFloat = 90
    let HEIGHT: CGFloat = 135
    let SPACE: CGFloat = 5
    let FONTSIZE: CGFloat = 30
    let GAP: CGFloat = 27
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rolesScrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // don't worry about this recognizer code... I was trying
        // to make an image view a button... didn't exactly work the way I wanted
        //let UITapRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameRolesViewController.touchPortrait(sender:)))
        //UITapRecognizer.delegate = self as! UIGestureRecognizerDelegate
        
        // Set frame of ScrollView
        rolesScrollView.contentSize = CGSize(width: rolesScrollView.frame.size.width, height: (HEIGHT + SPACE)*CGFloat(masterPlayerArray.count))
        
        // Add player portaits to ScrollView
        for player in 0..<masterPlayerArray.count {
            
            let buttonHeight = (HEIGHT + SPACE) * (CGFloat(player))
            
            let imgView = masterPlayerArray[player].pictureView
            let roleName = masterPlayerArray[player].role
            
            let btnView = UIButton(type: .custom)
            //btnView.setImage(img, for: .normal)
            //let imgView = img
            
            btnView.addSubview(imgView)
            
            let roleLbl = UILabel()
            roleLbl.text = roleName
            
            // Add portrait
            rolesScrollView.addSubview(btnView)
            //rolesScrollView.addSubview(imgView)
            rolesScrollView.addSubview(roleLbl)
            
            if player == 0 {
                // Set frame of portrait
                btnView.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT)
                //imgView.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT)
                imgView.frame = btnView.bounds
            } else {
                // Set frame of portrait
                btnView.frame = CGRect(x: 0, y: buttonHeight, width: WIDTH, height: HEIGHT)
                //imgView.frame = CGRect(x: 0, y: buttonHeight, width: WIDTH, height: HEIGHT)
                imgView.frame = btnView.bounds
            }
            
            // Set frame of label
            roleLbl.frame = CGRect(x: WIDTH + GAP, y: buttonHeight + (HEIGHT / 2) - (FONTSIZE / 2), width: 125, height: FONTSIZE)
            
            // Set portrait to "scale to fill"
            btnView.contentMode = .scaleToFill
            imgView.contentMode = .scaleToFill
            
            // set label font
            roleLbl.font = UIFont(name: "Kefa", size: FONTSIZE)
            
            // Set button functionality
            btnView.addTarget(self, action: #selector(touchPortrait), for: .touchUpInside)
            //imgView.addTarget(self, action: #selector(touchPortrait), for: .touchUpInside)
            
            // don't worry about this
            //imgView.addGestureRecognizer(UITapRecognizer)
            //imgView.isUserInteractionEnabled = true
            
        }
    }
    
    // Back Button
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Touch Portrait
    func touchPortrait(sender: AnyObject) {
        // randNum = Int(arc4random_uniform(UInt32(profileNoisesNames.count)))
        // play profileNoisesNames[randNum]
        print("You hit a button")
    }
    
    // Need for Solely Vertical Scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
