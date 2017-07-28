//
//  6NightViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class _NightViewController: UIViewController {

    // UI Outlets
    @IBOutlet weak var nightNum: UILabel!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isDay = false
        UserDefaults.standard.set(isDay, forKey: "isDay")
        
        savedMasterArray = masterPlayerArray
        let data = NSKeyedArchiver.archivedData(withRootObject: savedMasterArray)
        UserDefaults.standard.set(data, forKey: "savedMasterArray")

        print("NightViewController")
        print("Cycle is \(cycle)")
        print("Part is \(part)")
        print("\(masterPlayerArray[0].isDead)")
        print("\(masterPlayerArray[1].isDead)")
        print("\(masterPlayerArray[2].isDead)")
        print("\(masterPlayerArray[3].isDead)")
        print("\(masterPlayerArray[4].isDead)")
        print("\(masterPlayerArray[0].role)")
        print("\(masterPlayerArray[1].role)")
        print("\(masterPlayerArray[2].role)")
        print("\(masterPlayerArray[3].role)")
        print("\(masterPlayerArray[4].role)")
        
        nightNum.text = "\(cycle)"
    }
    
    // Proceed Button
    @IBAction func goToChoose(_ sender: Any) {
        
        if part == 1 {
            
            // Increase part
            part = part + 1
        
            performSegue(withIdentifier: "NightToChoose", sender: masterPlayerArray)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NightToChoose" {
            if let selectedVC = segue.destination as? _ChooseViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
}
