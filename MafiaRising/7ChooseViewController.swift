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
    
    // !!! maybe make another sound effect array for tribunal sounds, not just night phase !!!
    var nightSoundEffectsArray: Array<SoundEffect> = []
    var tribunalSoundEffectsArray: Array<SoundEffect> = []
    
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
        
        /*
        if part == 2 {
            updateSounds(arrayType: nightSoundEffectsArray)
        } else {
            updateSounds(arrayType: tribunalSoundEffectsArray)
        }
        */
        
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "ChooseToPause", sender: self)
    }
    
    // Repeat Button
    @IBAction func repeatDirections(_ sender: Any) {
        
    }
    
    // Proceed Button
    @IBAction func goToNextScreen(_ sender: Any) {
        
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
    
    func updateSounds(arrayType: Array<SoundEffect>) {
        
         // Generate tag array
         var soundEffectsIndex = [Int](repeating: 0, count: arrayType.count)
         
         // Loop through number of sound effect buttons
         for soundEffectNum in 1...4 {
         
            var nextIndex: Int
         
            repeat {
                nextIndex = Int(arc4random_uniform(UInt32(arrayType.count)))
            } while soundEffectsIndex[nextIndex] == 1
         
            // Set sound effect button with random sound and corresponding picture
            switch soundEffectNum {
         
            case 1:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn1.setBackgroundImage(UIImage(named: arrayType[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE1 = arrayType[nextIndex].effect
                
            case 2:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn2.setBackgroundImage(UIImage(named: arrayType[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE2 = arrayType[nextIndex].effect
            case 3:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn3.setBackgroundImage(UIImage(named: arrayType[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE3 = arrayType[nextIndex].effect
            case 4:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn4.setBackgroundImage(UIImage(named: arrayType[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE4 = arrayType[nextIndex].effect
            default:
                print("You have found a bug!!! Congratulations!!!")
            }
         
        }
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
