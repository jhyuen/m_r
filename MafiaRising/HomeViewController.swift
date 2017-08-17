//
//  HomeViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import  AVFoundation

// Sequence number of tutorial
var tutorialProgress = 0;
// Sequence number of script
var scriptProgress = 0;
// Indicates track of if the game has been completed
var currentGameFinished = true;
// Indicated whether the current cycle is a day cycle
var isDay = false;
// Idicated whether the user has progressed past the ready screen
var passedReady = false;
// Copy of the master player array
var savedMasterArray: Array<Player> = []
// Initialize AudioPlayer for background music
var musicPlayer = AVAudioPlayer()
// Initialize AudioPlayer for sound effects
var soundEffectPlayer = AVAudioPlayer()
// Initialize AudioPlayer for narration
var narrationPlayer = AVAudioPlayer()
// Initialize AudioPlayer for basic button sounds
var clickPlayer = AVAudioPlayer()

// Indicated whether or not a narration has begun playing
var narrationStarted: Bool = false

// Profile sound effect names
var profileNoisesNames: Array<String> = ["Agh god", "Agh-2", "Agh-3", "Agh", "Ah my face", "Are you enjoying this", "Aw thank you thank you", "Can you stop please", "Do you enjoy this", "Eh", "Ha", "Haha", "Hands off my face", "Hands off", "Hey(1)", "Hey", "Hi", "I don’t even have any words anymore", "I hope you enjoy a restraining order", "I keep saying things", "If you touch me one more time", "My masculinity", "No stop", "Oh come on really the face", "Oh my ugh", "Oh no", "Oi", "Oof-2", "Oof-3", "Oof", "Ooh (1)", "Ooh", "Oomph", "Ouch", "Ow (1)", "Ow-2", "Ow-3", "Ow-4", "Ow", "Please no", "Roar", "Stop that", "Stop touching me", "That’s my face man", "Ugh (1)", "Ugh the burn feel it ugh", "Ugh", "Will you ever learn", "Yeah keep pressing the face please", "Yeah", "You like that", "You’re gonna mess up my hair"]

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Populates arrays the hold narration file names
        generateNarrationArrays()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if narrationStarted {
            narrationPlayer.stop()
            narrationStarted = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // New Game Button
    @IBAction func pushNewGame(_ sender: Any) {
        // Reset globals
        passedReady = false
        currentGameFinished = true
        UserDefaults.standard.set(currentGameFinished, forKey: "CurrentGameFinished")
        isDay = false
        UserDefaults.standard.set(isDay, forKey: "isDay")
        narrationStarted = false
        
        // Play button click sound effect
        playClick()
        
        performSegue(withIdentifier: "HomeToPlayers", sender: self)
    }
    
    // Continue Button
    @IBAction func pushContinue(_ sender: Any) {
        print("Continue Pressed")
        print(isDay)
        print(part)
        print(currentGameFinished)
        
        // Play button click sound effect
        playClick()
        
        if !currentGameFinished {
            // Reset variables that may not have been reset
            storyIntroTrackNum = 0
            dayStoryTrackNum = 0
            tribunalTrackNum = 0
            docSelected = -1
            mafiaSelected = -1
            narrationStarted = false
            if !isDay {
                part = 1
                performSegue(withIdentifier: "ContinueToNight", sender: savedMasterArray)
            } else {
                if part == 0 {
                    cycle = cycle - 1
                }
                part = 3
                performSegue(withIdentifier: "ContinueToDay", sender: savedMasterArray)
            }
        }
    }
    
    // Options Button
    @IBAction func pushOptions(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "HomeToOptions", sender: self)
    }
    
    // Rules Button
    @IBAction func pushRules(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "HomeToRules", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContinueToNight" {
            if let selectedVC = segue.destination as? _NightViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray.removeAll()
                    selectedVC.masterPlayerArray.append(contentsOf: thePlayerArray)
                }
            }
        } else  if segue.identifier == "ContinueToDay" {
            if let selectedVC = segue.destination as? _DayViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray.removeAll()
                    selectedVC.masterPlayerArray.append(contentsOf: thePlayerArray)
                }
            }
        }
    }
    
    // Similar to prepare for segue, necessary for unwinding segue
    @IBAction func unwindToHomeVC(segue: UIStoryboardSegue) {
        // May take action before segue occurs
    }
}
