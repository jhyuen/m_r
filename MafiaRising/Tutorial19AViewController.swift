//
//  Tutorial19AViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 6/2/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class Tutorial19AViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(TutorialMainVC.swipeOccurred(_:)))
            swipeLeft.direction = .left
            view.addGestureRecognizer(swipeLeft)
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func swipeOccurred(_ sender: Any) {
            returnToOptions()
        }
        
        
        func returnToOptions() {
            dismiss(animated: false, completion: nil)
        }
}
