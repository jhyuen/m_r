//
//  GameRolesViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class GameRolesViewController: UIViewController {

    // UI Outlets
    @IBOutlet weak var rolesScrollView: UIScrollView!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    // Profile Weird Noises Array
    var profileNoisesNames: Array<String> = []
    
    // ScrollView Constants
    let WIDTH: CGFloat = 90
    let HEIGHT: CGFloat = 135
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Add player portaits to ScrollView
        for player in 0..<masterPlayerArray.count {
            
            let img = masterPlayerArray[player].picture
            let roleName = masterPlayerArray[player].role
            
            let btnView = UIButton(type: .custom)
            btnView.setImage(img, for: .normal)
            
            let roleLbl = UILabel()
            roleLbl.text = roleName
            
            // Add portrait
            rolesScrollView.addSubview(btnView)
            rolesScrollView.addSubview(roleLbl)
            
            // Set frame of portrait
            btnView.frame = CGRect(x: 0, y: -HEIGHT+10+((HEIGHT) * (CGFloat(player+1))) , width: WIDTH, height: HEIGHT)
            // Set frame of label
            roleLbl.frame = CGRect(x: WIDTH + 50, y: btnView.frame.maxY-(HEIGHT/2)-12.5, width: 100, height: 25)
            
            // Set portrait to "scale to fill"
            btnView.contentMode = .scaleToFill
            // set label font
            roleLbl.font = UIFont(name: "Kefa", size: 25)
            
            // Set button functionality
            btnView.addTarget(self, action: #selector(touchPortrait), for: .touchUpInside)
            
        }
        
        // Set frame of ScrollView
        rolesScrollView.contentSize = CGSize(width: WIDTH*CGFloat(masterPlayerArray.count), height: rolesScrollView.frame.size.height)
    }

    // Back Button
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func touchPortrait() {
        // randNum = Int(arc4random_uniform(UInt32(profileNoisesNames.count)))
        // play profileNoisesNames[randNum]
        print("You hit a button")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



