//
//  1PlayersViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

class _PlayersViewController: UIViewController, AVAudioPlayerDelegate {
    
    // UI Outlets
    @IBOutlet weak var numPlayerField: UITextField!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var errorLabel: UILabel!
    
    // Constants
    let minimumPlayers = 5
    let maximumPlayers = 30
    
    var audioPlayer = AVAudioPlayer()
    
    var masterPlayerArray: Array<Player> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Player View Controller")
        
        errorLabel.isHidden = true
        numPlayerField.text = ""
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(_PlayersViewController.dismissKeyboard)))
        
        // Notifications that allow view to be pushed up when keyboard appears
        NotificationCenter.default.addObserver(self, selector: #selector(_PlayersViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(_PlayersViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // Setup keyboard toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        numPlayerField.inputAccessoryView = toolBar
        
        // Begin narration after 1 second
        if optionsParameters.enableDirections && !narrationStarted {
            print("S_SU_01")
            playNarration(trackTitle: "S_SU_01")
        }
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "PlayersToPause", sender: masterPlayerArray)
    }
    
    // Proceed Arrow
    @IBAction func goToRoleSetUp(_ sender: Any) {
        
        if numPlayerField.text?.isEmpty == false {
            
            if (Int(numPlayerField.text!))! >= minimumPlayers && (Int(numPlayerField.text!))! <= maximumPlayers {
                
                if let numPlayers: Int = (Int(numPlayerField.text!)) {
                    narrationPlayer.stop()
                    narrationStarted = false
                    // Play button click sound effect
                    playClick()
                    performSegue(withIdentifier: "PlayersToRoleSetUp", sender: numPlayers)
                    errorLabel.isHidden = true
                }
                
            } else {
                errorLabel.isHidden = false
                errorLabel.text = "Enter a number from 5-30"
            }
        } else {
            errorLabel.isHidden = false
            errorLabel.text = "Please Enter the Number of Players"
        }
    }
    
    // Info Button
    @IBAction func goToPlayerInfo(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "PlayersToInfo", sender: self)
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= (keyboardSize.height / 2)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += (keyboardSize.height / 2)
            }
        }
    }
    
    @objc func dismissKeyboard() {
        numPlayerField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("finished")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlayersToRoleSetUp" {
            if let selectedVC = segue.destination as? _RoleSetUpViewController {
                if let theNumPlayers = sender as? Int {
                    selectedVC.numPlayers = theNumPlayers
                }
            }
        } else
            if segue.identifier == "PlayersToPause" {
                if let selectedVC = segue.destination as? PauseViewController {
                    if let theArray = sender as? Array<Player> {
                        selectedVC.masterPlayerArray = theArray
                    }
                }
        }
    }
}
