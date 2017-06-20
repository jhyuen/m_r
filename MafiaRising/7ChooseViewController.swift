//
//  7ChooseViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class _ChooseViewController: UIViewController {

    @IBOutlet weak var soundEffectBtn1: UIButton!
    @IBOutlet weak var soundEffectBtn2: UIButton!
    @IBOutlet weak var soundEffectBtn3: UIButton!
    @IBOutlet weak var soundEffectBtn4: UIButton!
    
    // transfer array
    var masterPlayerArray: Array<Player> = []
    
    var soundEffectsArray: Array<SoundEffect> = []
    
    // Sound Effect Button Sounds
    var sE1: String = "se1"
    var sE2: String = "se2"
    var sE3: String = "se3"
    var sE4: String = "se4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        /* TAKE OFF COMMENTS ONCE SOUND EFFECTS ARE INSERTED INTO ARRAY
         
        // Generate tag array
        var soundEffectsIndex = [Int](repeating: 0, count: soundEffectsArray.count)
        
        // Loop through number of sound effect buttons
        for soundEffectNum in 1...4 {
            
            var nextIndex: Int
            
            repeat {
                nextIndex = Int(arc4random_uniform(UInt32(soundEffectsArray.count)))
            } while soundEffectsIndex[nextIndex] == 1
            
            // Set sound effect button with random sound and corresponding picture
            switch soundEffectNum {
                
            case 1:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn1.setBackgroundImage(UIImage(named: soundEffectsArray[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE1 = soundEffectsArray[nextIndex].effect
            case 2:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn2.setBackgroundImage(UIImage(named: soundEffectsArray[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE2 = soundEffectsArray[nextIndex].effect
            case 3:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn3.setBackgroundImage(UIImage(named: soundEffectsArray[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE3 = soundEffectsArray[nextIndex].effect
            case 4:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn4.setBackgroundImage(UIImage(named: soundEffectsArray[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE4 = soundEffectsArray[nextIndex].effect
            default:
                print("You have found a bug!!! Congratulations!!!")
            }
            
        } 
         */
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "ChooseToPause", sender: self)
    }
    
    // Sound Effect Buttons
    @IBAction func pressSoundEffectBtn1(_ sender: Any) {
        // play
        print("\(sE1)")
    }
    // Sound Effect Buttons
    @IBAction func pressSoundEffectBtn2(_ sender: Any) {
        // play
        print("\(sE2)")
    }
    @IBAction func pressSoundEffectBtn3(_ sender: Any) {
        // play
        print("\(sE3)")
    }
    @IBAction func pressSoundEffectBtn4(_ sender: Any) {
        // play
        print("\(sE4)")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseToDay" {
            if let selectedVC = segue.destination as? _DayViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            } else if segue.identifier == "ChooseToStory" {
                if let selectedVC = segue.destination as? _StoryViewController {
                    if let thePlayerArray = sender as? Array<Player> {
                        selectedVC.masterPlayerArray = thePlayerArray
                    }
                }
            }
        }
    }

}
