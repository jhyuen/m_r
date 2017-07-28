//
//  PauseViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class PauseViewController: UIViewController {
    
    @IBOutlet weak var rolesBtn: UIButton!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if masterPlayerArray.count == 0 {
            rolesBtn.isEnabled = false
        } else {
            rolesBtn.isEnabled = true
        }
    }
    
    // Back Button
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Home Button
    @IBAction func homeBtnPressed(_ sender: Any) {
        // Undo murder that occurred
        if recentlyMurdered >= 0 {
            if masterPlayerArray[recentlyMurdered].isDead{
                masterPlayerArray[recentlyMurdered].revive()
                cycle = cycle - 1
            }
        }
        // Untarget, unprotect, and enables all players
        for player in masterPlayerArray {
            player.save()
            player.enablePlayer()
        }
        performSegue(withIdentifier: "PauseToHome", sender: self)
    }
    
    // Roles Button
    @IBAction func rolesBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "PauseToRoles", sender: masterPlayerArray)
    }
    // Add segue
    // Remember to keep game data for roles screen
    
    // Options Button
    @IBAction func optionsBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "PauseToOptions", sender: self)
    }
    
    // Rules Button
    @IBAction func rulesBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "PauseToRules", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PauseToRoles" {
            if let selectedVC = segue.destination as? GameRolesViewController {
                if let theArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = theArray
                }
            }
        }
    }

}
