//
//  CardsInfoViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 6/1/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class CardsInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Back Button
    @IBAction func goBackToCards(_ sender: Any) {
        // Play button click sound effect
        playClick()
        dismiss(animated: true, completion: nil)
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
