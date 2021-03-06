//
//  6DayViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

var firstTimeDay: Bool = false

class _DayViewController: UIViewController {

    // UI Outlets
    @IBOutlet weak var dayNum: UILabel!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trackTitle = "Day Transition"
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
        
        print("DayViewController")
        print("Cycle is \(cycle)")
        print("Part is \(part)")
        
        dayNum.text = "\(cycle)"
        
        if optionsParameters.enableDirections {
            if firstTimeDay {
                    print("S_D_R_01")
                    playNarration(trackTitle: "S_D_R_01")
            } else {
                    print("S_D_B_01")
                    playNarration(trackTitle: "S_D_B_01")
            }
        }
    }

    // Proceed Button
    @IBAction func goToStory(_ sender: Any) {
        firstTimeDay = false
        if part == 3 {
            
            // Increase part
            part = part + 1
            UserDefaults.standard.set(part, forKey: "Part")
            
            let trackTitle = "Day Story"
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
            
            narrationPlayer.stop()
            narrationStarted = false
            performSegue(withIdentifier: "DayToStory", sender: masterPlayerArray)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DayToStory" {
            if let selectedVC = segue.destination as? _StoryViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
}
