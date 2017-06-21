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
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "ReadyToPause", sender: masterPlayerArray)
    }
    
    // Proceed Button
    @IBAction func goToStory(_ sender: Any) {
        
        // Reset cycle
        cycle = 1
        part = 0
        
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
