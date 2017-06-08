//
//  1PlayerViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class _PlayerViewController: UIViewController {

    let minimumPlayers = 5
    let maximumPlayers = 30
    
    @IBOutlet weak var numPlayerField: UITextField!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(_PlayerViewController.dismissKeyboard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(_PlayerViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(_PlayerViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= (keyboardSize.height / 2)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += (keyboardSize.height / 2)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        errorLabel.isHidden = true
        numPlayerField.text = ""
    }
    
    func dismissKeyboard() {
        numPlayerField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "PlayersToPause", sender: self)
    }

    // Proceed Arrow
    @IBAction func goToRoleSetUp(_ sender: Any) {
        
        if numPlayerField.text?.isEmpty == false {
            
            if (Int(numPlayerField.text!))! >= minimumPlayers && (Int(numPlayerField.text!))! <= maximumPlayers {
                
                let numPlayers: Int = (Int(numPlayerField.text!))!
                performSegue(withIdentifier: "goToRoleSetUp", sender: numPlayers)
                errorLabel.isHidden = true
            } else {
                errorLabel.isHidden = false
                errorLabel.text = "The Valid Player Range is 5 to 30"
            }
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Please Enter the Number of Players"
        }
    }
    
    // Info Button
    @IBAction func goToPlayerInfo(_ sender: Any) {
        performSegue(withIdentifier: "PlayersToInfo", sender: self)
    }
    

}
