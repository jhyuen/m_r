//
//  RolesViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class RolesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Back Button
    @IBAction func backBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        dismiss(animated: true, completion: nil)
    }
    
    enum Roles: Int {
        case MODERATOR = 0
        case CITIZEN = 1
        case MAFIA = 2
        case DOCTOR = 3
        case POLICE = 4
    }
    
    // Role Buttons
    @IBAction func onRoleBtnTapped(_ sender: Any) {
        // Play button click sound effect
        playClick()
        if let btnTapped: Int = (sender as AnyObject).tag {
            performSegue(withIdentifier: "RolesToRoleInformation", sender: btnTapped)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RolesToRoleInformation" {
            if let selectedVC = segue.destination as? RoleInformationViewController {
                if let theTag = sender as? Int {
                    selectedVC.transferTag = theTag
                }
            }
        }
    }
    
}
