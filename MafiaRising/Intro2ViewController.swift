//
//  Intro2ViewController.swift
//  MafiaRising
//
//  Created by Admin on 8/14/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

class Intro2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(segue), with: nil, afterDelay: 1)
        
        // Do any additional setup after loading the view.
    }
    
    func segue() {
        // Load sound defaults
        if let enableDirections = UserDefaults.standard.object(forKey: "EnableDirections") as? Bool {
            optionsParameters.enableDirections = enableDirections
        }
        if let enableStory = UserDefaults.standard.object(forKey: "EnableStory") as? Bool {
            optionsParameters.enableStory = enableStory
        }
        if let musicVol = UserDefaults.standard.object(forKey: "MusicVol") as? Float {
            optionsParameters.musicVol = musicVol
        }
        if let soundEffectsVol = UserDefaults.standard.object(forKey: "SEVol") as? Float {
            optionsParameters.soundEffectsVol = soundEffectsVol
        }
        
        // Load game defaults
        if let day = UserDefaults.standard.object(forKey: "isDay") as? Bool {
            isDay = day
        }
        if let gameFinished = UserDefaults.standard.object(forKey: "CurrentGameFinished") as? Bool {
            currentGameFinished = gameFinished
        }
        if let data = UserDefaults.standard.object(forKey: "savedMasterArray") as? Data {
            let masterArray = NSKeyedUnarchiver.unarchiveObject(with: data)
            savedMasterArray = masterArray as! Array<Player>
        }
        if let Cycle = UserDefaults.standard.object(forKey: "Cycle") as? Int {
            cycle = Cycle
        }
        if let Part = UserDefaults.standard.object(forKey: "Part") as? Int {
            part = Part
        }

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
        
        performSegue(withIdentifier: "Intro2ToHome", sender: self)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
