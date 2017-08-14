//
//  Intro1ViewController.swift
//  MafiaRising
//
//  Created by Admin on 8/14/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class Intro1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(segue), with: nil, afterDelay: 1)

        // Do any additional setup after loading the view.
    }
    
    func segue() {
        performSegue(withIdentifier: "Intro1ToIntro2", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
