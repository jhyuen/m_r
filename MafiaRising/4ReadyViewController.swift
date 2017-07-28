//
//  4ReadyViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

var cycle: Int = 1
var part: Int = 0

class _ReadyViewController: UIViewController {
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        masterPlayerArray.removeAll()
//        // !!! populating the master array for testing
//        let citImage = UIImage(named: "MRFinal RolesCitizen")
//        let polImage = UIImage(named: "MRFinal RolesPolice")
//        let mafImage = UIImage(named: "MRFinal RolesMafia")
//        let docImage = UIImage(named: "MRFinal RolesDoctor")
//        
//        for index in 1...13 {
//            if index % 3 == 0 {
//                masterPlayerArray.append(Player(picture: mafImage!, role: "MAFIA"))
//            } else if index % 11 == 0 {
//                masterPlayerArray.append(Player(picture: docImage!, role: "DOCTOR"))
//            } else if index % 4 == 0 {
//                masterPlayerArray.append(Player(picture: polImage!, role: "POLICE"))
//            } else {
//                masterPlayerArray.append(Player(picture: citImage!, role: "CITIZEN"))
//            }
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Reset game status
        // Reset cycle
        cycle = 1
        UserDefaults.standard.set(cycle, forKey: "Cycle")
        part = 0
        currentGameFinished = false
        UserDefaults.standard.set(currentGameFinished, forKey: "CurrentGameFinished")
        
        savedMasterArray = masterPlayerArray
        let data = NSKeyedArchiver.archivedData(withRootObject: savedMasterArray)
        UserDefaults.standard.set(data, forKey: "savedMasterArray")
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "ReadyToPause", sender: masterPlayerArray)
    }
    
    // Proceed Button
    @IBAction func goToStory(_ sender: Any) {
        performSegue(withIdentifier: "ReadyToStory", sender: masterPlayerArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReadyToStory" {
            if let selectedVC = segue.destination as? _StoryViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        } else if segue.identifier == "ReadyToPause" {
            if let selectedVC = segue.destination as? PauseViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
}
