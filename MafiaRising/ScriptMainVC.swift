//
//  ScriptMainVC.swift
//  MafiaRising
//
//  Created by Admin on 6/6/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class ScriptMainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(TutorialMainVC.swipeOccurred(_:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
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
