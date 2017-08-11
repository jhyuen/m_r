//
//  4ReadyViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

var cycle: Int = 1
var part: Int = 0

class _ReadyViewController: UIViewController {
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        masterPlayerArray.removeAll()
//        // !!! populating the master array for testing
//        let citImage = UIImage(named: "MRFinal RolesCitizen")
//        let polImage = UIImage(named: "MRFinal RolesPolice")
//        let mafImage = UIImage(named: "MRFinal RolesMafia")
//        let docImage = UIImage(named: "MRFinal RolesDoctor")
//        
//        for index in 1...13 {
//            if index % 3 == 0 {
//                masterPlayerArray.append(Player(picture: mafImage!, role: "MAFIA"))
//            } else if index % 11 == 0 {
//                masterPlayerArray.append(Player(picture: docImage!, role: "DOCTOR"))
//            } else if index % 4 == 0 {
//                masterPlayerArray.append(Player(picture: polImage!, role: "POLICE"))
//            } else {
//                masterPlayerArray.append(Player(picture: citImage!, role: "CITIZEN"))
//            }
//        }
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "ReadyToPause", sender: masterPlayerArray)
    }
    
    // Proceed Button
    @IBAction func goToStory(_ sender: Any) {
        // Play background music for next screen
        musicPlayer.stop()
        let trackTitle = "Intro Story"
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
        performSegue(withIdentifier: "ReadyToStory", sender: masterPlayerArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ReadyToStory" {
            if let selectedVC = segue.destination as? _StoryViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        } else if segue.identifier == "ReadyToPause" {
            if let selectedVC = segue.destination as? PauseViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
}
