//
//  PauseViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

class PauseViewController: UIViewController {
    
    @IBOutlet weak var rolesBtn: UIButton!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if masterPlayerArray.count == 0 {
            rolesBtn.isEnabled = false
        } else {
            rolesBtn.isEnabled = true
        }
        
}
    
    // Back Button
    @IBAction func backBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        dismiss(animated: true, completion: nil)
    }
    
    // Home Button
    @IBAction func homeBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        // Undo murder that occurred
        if recentlyMurdered >= 0 {
            if masterPlayerArray[recentlyMurdered].isDead{
                masterPlayerArray[recentlyMurdered].revive()
                UserDefaults.standard.set(cycle, forKey: "Cycle")
            }
        }
        // Untarget, unprotect, and enables all players
        for player in masterPlayerArray {
            player.save()
            player.enablePlayer()
        }
        savedMasterArray = masterPlayerArray
        let data = NSKeyedArchiver.archivedData(withRootObject: savedMasterArray)
        UserDefaults.standard.set(data, forKey: "savedMasterArray")
        
        // Play main menu music
        let trackTitle = "Main Menu"
        if let sound = NSDataAsset(name: trackTitle) {
            // Do any additional setup after loading the view, typically from a nib.
            do {
                musicPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeMPEGLayer3)
                musicPlayer.numberOfLoops = -1
                
                // !!! STOP PLAYER
                musicPlayer.volume = optionsParameters.musicVol
                musicPlayer.prepareToPlay()
                musicPlayer.play()
                
            } catch {
                print(error)
            }
        }

        performSegue(withIdentifier: "unwindHome", sender: self)
    }
    
    // Roles Button
    @IBAction func rolesBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "PauseToRoles", sender: masterPlayerArray)
    }
    // Add segue
    // Remember to keep game data for roles screen
    
    // Options Button
    @IBAction func optionsBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "PauseToOptions", sender: self)
    }
    
    // Rules Button
    @IBAction func rulesBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "PauseToRules", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PauseToRoles" {
            if let selectedVC = segue.destination as? GameRolesViewController {
                if let theArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = theArray
                }
            }
        }
    }

}
