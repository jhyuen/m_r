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
var currentGameFinished = false;

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

}
