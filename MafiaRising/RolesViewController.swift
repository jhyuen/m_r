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
        if let btnTapped: Int = (sender as AnyObject).tag {
            performSegue(withIdentifier: "RolesToRoleInformation", sender: btnTapped)
            
            
            /* switch btnTapped {
             
             case Roles.MODERATOR.rawValue:
             
             let characterTag = 0
             
             
             case Roles.CITIZEN.rawValue:
             
             let characterTag = 1
             goToNextScreen(characterTag: characterTag)
             
             case Roles.MAFIA.rawValue:
             
             let characterTag = 2
             goToNextScreen(characterTag: characterTag)
             
             case Roles.DOCTOR.rawValue:
             
             let characterTag = 3
             goToNextScreen(characterTag: characterTag)
             
             case Roles.POLICE.rawValue:
             
             let characterTag = 4
             goToNextScreen(characterTag: characterTag)
             
             default:
             
             let characterTag = 5
             goToNextScreen(characterTag: characterTag)
             */
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
