//
//  6NightViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

var firstTimeNight: Bool = false

class _NightViewController: UIViewController {

    // UI Outlets
    @IBOutlet weak var nightNum: UILabel!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let trackTitle = "Night Transition"
        if let sound = NSDataAsset(name: trackTitle) {
            // Do any additional setup after loading the view, typically from a nib.
            do {
                musicPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
                
                // !!! STOP PLAYER
                musicPlayer.volume = optionsParameters.musicVol
                musicPlayer.prepareToPlay()
                musicPlayer.play()
                
            } catch {
                print(error)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //UIApplication.shared.statusBarStyle = .lightContent
        setNeedsStatusBarAppearanceUpdate() 
        
        print("NightViewController")
        print("Cycle is \(cycle)")
        print("Part is \(part)")

        nightNum.text = "\(cycle)"
        
        if optionsParameters.enableDirections {
            if firstTimeNight {
                print("First time night")
                // Begin narration after 1 second
                    print("S_N_B_01")
                    playNarration(trackTitle: "S_N_B_01")
            } else {
                print("Not first time night")
                // Begin narration after 1 second
                    print("S_T_B_02")
                    playNarration(trackTitle: "S_T_B_02")
            }
        }
    }
    
    // Proceed Button
    @IBAction func goToChoose(_ sender: Any) {
        firstTimeNight = false
        if part == 1 {
            
            // Increase part
            part = part + 1
            UserDefaults.standard.set(part, forKey: "Part")
        
            let trackTitle = "Night"
            musicPlayer.stop()
            if let sound = NSDataAsset(name: trackTitle) {
                // Do any additional setup after loading the view, typically from a nib.
                do {
                    musicPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
                    musicPlayer.numberOfLoops = -1
                    
                    // !!! STOP PLAYER
                    musicPlayer.volume = optionsParameters.musicVol
                    musicPlayer.prepareToPlay()
                    musicPlayer.play()
                    
                } catch {
                    print(error)
                }
            }
            generateBasicButtonSelection()
            // Reset recentlyMurdered variable
            recentlyMurdered = -1
            
            narrationPlayer.stop()
            narrationStarted = false
            performSegue(withIdentifier: "NightToChoose", sender: masterPlayerArray)
            
        }
    }
    
    func generateBasicButtonSelection() {
        // Loop through number of sound effect buttons
        potentialIndex.removeAll()

        for _ in 1...4 {
            var nextIndex: Int
            
            repeat {
                nextIndex = Int(arc4random_uniform(UInt32(basicSoundEffectsArray.count)))
            } while potentialIndex.contains(nextIndex)
            
            potentialIndex.append(nextIndex)
        }
        print(potentialIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NightToChoose" {
            if let selectedVC = segue.destination as? _ChooseViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
}
