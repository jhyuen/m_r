//
//  1PlayerViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class _PlayerViewController: UIViewController {

    
    
    @IBOutlet weak var numPlayerField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // PauseButton
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "PlayersToOptions", sender: self)
    }

    // Proceed Arrow
    @IBAction func goToRoleSetUp(_ sender: Any) {
        
        if numPlayerField.text?.isEmpty == false {
            
            if (Int(numPlayerField.text!))! >= 0 && (Int(numPlayerField.text!))! <= 30 {
                
                let numPlayers: Int = (Int(numPlayerField.text!))!
                performSegue(withIdentifier: "goToRoleSetUp", sender: numPlayers)
                
            }
        }
    }
    
    @IBAction func goToPlayerInfo(_ sender: Any) {
        performSegue(withIdentifier: "PlayersToInfo", sender: self)
    }
    

}
