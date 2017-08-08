//
//  6NightViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

class _NightViewController: UIViewController {

    // UI Outlets
    @IBOutlet weak var nightNum: UILabel!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let trackTitle = "Night Transition"
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isDay = false
        UserDefaults.standard.set(isDay, forKey: "isDay")
        
        savedMasterArray = masterPlayerArray
        let data = NSKeyedArchiver.archivedData(withRootObject: savedMasterArray)
        UserDefaults.standard.set(data, forKey: "savedMasterArray")

        print("NightViewController")
        print("Cycle is \(cycle)")
        print("Part is \(part)")

        nightNum.text = "\(cycle)"
    }
    
    // Proceed Button
    @IBAction func goToChoose(_ sender: Any) {
        
        if part == 1 {
            
            // Increase part
            part = part + 1
            UserDefaults.standard.set(part, forKey: "Part")
        
            let trackTitle = "Night"
            musicPlayer.stop()
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
            
            performSegue(withIdentifier: "NightToChoose", sender: masterPlayerArray)
            
        }
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
