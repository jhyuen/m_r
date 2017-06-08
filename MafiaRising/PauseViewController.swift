//
//  PauseViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class PauseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Back Button
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Home Button
    // Add segue
    // Remember to keep game data for continue
    
    // Roles Button
    // Add segue
    // Remember to keep game data for roles screen
    
    // Options Button
    @IBAction func optionsBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "PauseToOptions", sender: self)
    }
    
    // Rules Button
    @IBAction func rulesBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "PauseToRules", sender: self)
    }
    
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
