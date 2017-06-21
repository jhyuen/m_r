//
//  2RoleSetUpViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

var policeExist: Bool = false
var doctorExist: Bool = false

class _RoleSetUpViewController: UIViewController {

    // UI Outlets
    @IBOutlet weak var isDoctor: CheckBox!
    @IBOutlet weak var isPolice: CheckBox!

    // Number of players Instantiated
    var numPlayers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // Back Button
    @IBAction func goBackToPlayer(_ sender: Any) {
        dismiss(animated: false, completion: nil )
    }
    
    // Info Button
    @IBAction func goToRoleInfo (_ sender: Any) {
        performSegue(withIdentifier: "RolesToInfo", sender: self)
    }
    
    // Proceed Button
    @IBAction func goToCards(_ sender: Any) {
        
        // 4:1 Players to Mafia
        // 1 Doctor
        // 1 Police
        
        let numMafia: Int = numPlayers/5
        
        // Change when adding new special role types
        let numPossibleSpecialRoles: Int = numMafia + 2
        
        // Instantiation of Master Index Array
        var masterIndex = [Int](repeating: 0, count: numPlayers)
        
        masterIndex = setRoleIndex(numMafia: numMafia, possibleSpecialRoles: numPossibleSpecialRoles)
        
        masterIndex = refineRoleIndex(index: masterIndex)
    
        performSegue(withIdentifier: "RolesToCards", sender: masterIndex)
    }
    
    // Create Master Index
    func setRoleIndex(numMafia: Int, possibleSpecialRoles: Int) -> Array<Int>{
        
        // Randomization of Roles
        // 1 = mafia
        // 2 = police
        // 3 = doctor
        
        // Generate tag array
        var potentialIndex = [Int](repeating: 0, count: numPlayers)
        
        // Loop through number of special roles
        for role in 0..<possibleSpecialRoles {
            
            var nextIndex: Int
            
            repeat {
                nextIndex = Int(arc4random_uniform(UInt32(numPlayers)))
            } while potentialIndex[nextIndex] != 0
            
            // Set mafia index
            if role < numMafia {
                potentialIndex[nextIndex] = 1
            }
            
            // Set police index
            if role == numMafia {
                potentialIndex[nextIndex] = 2
            }
            
            // Set doctor index
            if role == numMafia + 1 {
                potentialIndex[nextIndex] = 3
            }
            
        }
        
        return potentialIndex
    }
    
    // Refine Master Index to Exclude Certain Roles
    func refineRoleIndex(index: Array<Int>) -> Array<Int> {
        
        var masterIndex: Array<Int> = index
        
        let doesPoliceExist: Bool = isPolice.isChecked
        let doesDoctorExist: Bool = isDoctor.isChecked
        
        for role in 0..<masterIndex.count {
            if doesPoliceExist == false && masterIndex[role] == 2 {
                masterIndex[role] = 0
            }
            
            if doesDoctorExist == false && masterIndex[role] == 3 {
                masterIndex[role] = 0
            }
        }
        
        // Set global variables
        policeExist = doesPoliceExist
        doctorExist = doesDoctorExist
        
        return masterIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RolesToCards" {
            if let selectedVC = segue.destination as? _CardRevealViewController {
                if let theMasterArray = sender as? Array<Int> {
                    selectedVC.masterIndexArray = theMasterArray
                }
            }
        }
    }

}
