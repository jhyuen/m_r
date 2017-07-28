//
//  6DayViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class _DayViewController: UIViewController {

    // UI Outlets
    @IBOutlet weak var dayNum: UILabel!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isDay = true
        
        print("DayViewController")
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
        
        dayNum.text = "\(cycle)"
    }

    // Proceed Button
    @IBAction func goToStory(_ sender: Any) {
       
        if part == 3 {
            
            // Increase part
            part = part + 1
            
            performSegue(withIdentifier: "DayToStory", sender: masterPlayerArray)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DayToStory" {
            if let selectedVC = segue.destination as? _StoryViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
}
