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
    
    // Array that holds names to intro story images
    var introStoryImages: Array<String> = ["Field.png", "HouseDay.png", "HouseNight.png", "Inn.jpg", "ShadowFigure.png", "Stocks.jpg", "Town.jpg", "Town2.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "ReadyToPause", sender: masterPlayerArray)
    }
    
    // Proceed Button
    @IBAction func goToStory(_ sender: Any) {
        // Play soundEffect
        storyIntroImage =  UIImage(named: introStoryImages[Int(arc4random_uniform(UInt32(introStoryImages.count)))])!
        if let sound = NSDataAsset(name: "Gunshot2") {
            // Do any additional setup after loading the view, typically from a nib.
            do {
                soundEffectPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
                //audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: trackTitle, ofType: "mp3")!))
                
                if soundEffectPlayer.isPlaying {
                    soundEffectPlayer.stop()
                }
                
                soundEffectPlayer.volume = optionsParameters.soundEffectsVol
                soundEffectPlayer.prepareToPlay()
                soundEffectPlayer.play()
                
            } catch {
                print(error)
            }
        }
        
        // Play background music for next screen
        musicPlayer.stop()
        if let sound = NSDataAsset(name: "Intro Story") {
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
