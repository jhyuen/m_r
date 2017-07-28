//
//  HomeViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

var tutorialProgress = 0;
var scriptProgress = 0;
var currentGameFinished = true;
var isDay = false;
var passedReady = false;
var savedMasterArray: Array<Player> = []


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // New Game Button
    @IBAction func pushNewGame(_ sender: Any) {
        performSegue(withIdentifier: "HomeToPlayers", sender: self)
    }
    
    // Continue Button
    @IBAction func pushContinue(_ sender: Any) {
        if !currentGameFinished {
            if !isDay {
                part = 1
                performSegue(withIdentifier: "ContinueToNight", sender: savedMasterArray)
            } else {
                part = 3
                performSegue(withIdentifier: "ContinueToDay", sender: savedMasterArray)
            }
        }
    }
    
    // Options Button
    @IBAction func pushOptions(_ sender: Any) {
        performSegue(withIdentifier: "HomeToOptions", sender: self)
    }
    
    // Rules Button
    @IBAction func pushRules(_ sender: Any) {
        performSegue(withIdentifier: "HomeToRules", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContinueToNight" {
            if let selectedVC = segue.destination as? _NightViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray.removeAll()
                    selectedVC.masterPlayerArray.append(contentsOf: thePlayerArray)
                }
            }
        } else  if segue.identifier == "ContinueToDay" {
            if let selectedVC = segue.destination as? _DayViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray.removeAll()
                    selectedVC.masterPlayerArray.append(contentsOf: thePlayerArray)
                }
            }
        }
    }
}
