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
    
    // transfer master player array
    var masterPlayerArray: Array<Player> = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "ReadyToPause", sender: self)
    }
    
    // Proceed Button
    @IBAction func goToStory(_ sender: Any) {
        
        // reset cycle
        cycle = 1
        part = 0
        
        performSegue(withIdentifier: "ReadyToStory", sender: masterPlayerArray)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReadyToStory" {
            if let selectedVC = segue.destination as? _StoryViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
}
