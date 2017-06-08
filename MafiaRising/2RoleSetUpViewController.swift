//
//  2RoleSetUpViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class _RoleSetUpViewController: UIViewController {

    @IBOutlet weak var isDoctor: CheckBox!
    @IBOutlet weak var isPolice: CheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Back Button
    @IBAction func goBackToPlayer(_ sender: Any) {
            dismiss(animated: false, completion: nil )
    }
    
    /*
    @IBAction func goToCards(_ sender: Any) {
    } */
    
       /*
        performSegue(withIdentifier: "RolesToCards", sender: Any?)
    }*/
    
    // Info Button
    @IBAction func goToRoleInfo (_ sender: Any) {
        performSegue(withIdentifier: "RolesToInfo", sender: self)
    }

}
