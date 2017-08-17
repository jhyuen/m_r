//
//  RulesMenuViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class RulesMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Back Button
    @IBAction func backBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        dismiss(animated: true, completion: nil)
    }
    
    // Tutorial Button
    @IBAction func tutorialBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "RulesToTut", sender: self)
    }
    
    // Script Button
    @IBAction func scriptBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "RulesToScript", sender: self)
    }
    
    // Roles Button
    @IBAction func rolesBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "RulesToRoles", sender: self)
    }
    
}
