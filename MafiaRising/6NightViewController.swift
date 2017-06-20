//
//  6NightViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class _NightViewController: UIViewController {

    // transfer array
    var masterPlayerArray: Array<Player> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Proceed Button
    @IBAction func goToChoose(_ sender: Any) {
        
        // Increase part
        part = part + 1
        
        performSegue(withIdentifier: "NightToChoose", sender: masterPlayerArray)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NightToChoose" {
            if let selectedVC = segue.destination as? _NightViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
}
