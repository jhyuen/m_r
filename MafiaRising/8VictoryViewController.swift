//
//  8VictoryViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

// Conclusion Key
// 0 = Continue
// 1 = Mafia Defeat
// 2 = Mafia Victory

class _VictoryViewController: UIViewController {

    // UI Outlets
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var winnerImage: UIImageView!
    @IBOutlet weak var btmLbl: UILabel!
    @IBOutlet weak var dot: UIImageView!
    
    // Constants
    let blackColor: UIColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
    let whiteColor: UIColor = UIColor(white: 1.0, alpha: 1.0)
    let bottomMessage: String = "PRESS ANYWHERE TO CONTINUE"
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        btmLbl.text = bottomMessage
        
        switch conclusion {
            
        case 1:
            
            backgroundView.backgroundColor = whiteColor
            winnerImage.image = UIImage(named: "MRFinal CitizensWinC1")
            dot.image = UIImage(named: "MRFinal CitzensWinC2")
            btmLbl.textColor = blackColor
            
            musicPlayer.stop()
            // Play background music
            let trackTitle = "Civilians Win"
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
            
        case 2:
            
            backgroundView.backgroundColor = blackColor
            winnerImage.image = UIImage(named: "MRFinal MafiaWinC1")
            dot.image = UIImage(named: "MRFinal MafiaWinC2")
            btmLbl.textColor = whiteColor
            
            // Play background music
            let trackTitle = "Mafia Win"
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

            
        default:
            
            print("You found a bug!!! Congrats!!!")
            
        }
    }
    
    // Proceed Button
    @IBAction func goToEnd(_ sender: Any) {
        part = part + 1
        UserDefaults.standard.set(part, forKey: "Part")
        performSegue(withIdentifier: "VictoryToEnd", sender: masterPlayerArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VictoryToEnd" {
            if let selectedVC = segue.destination as? _EndViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
    

}
