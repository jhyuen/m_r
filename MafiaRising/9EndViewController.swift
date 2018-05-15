//
//  9EndViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

class _EndViewController: UIViewController, UIScrollViewDelegate {

    // UI Outlets
    @IBOutlet weak var rolesScrollView: UIScrollView!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []

    // ScrollView Constants
    let WIDTH: CGFloat = 90
    let HEIGHT: CGFloat = 135
    let SPACE: CGFloat = 5
    let FONTSIZE: CGFloat = 30
    let GAP: CGFloat = 27
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rolesScrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // don't worry about this recognizer code... I was trying
        // to make an image view a button... didn't exactly work the way I wanted
        //let UITapRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameRolesViewController.touchPortrait(sender:)))
        //UITapRecognizer.delegate = self as! UIGestureRecognizerDelegate
        
        // Set frame of ScrollView
        rolesScrollView.contentSize = CGSize(width: rolesScrollView.frame.size.width, height: (HEIGHT + SPACE)*CGFloat(masterPlayerArray.count))
        
        // Add player portaits to ScrollView
        for player in 0..<masterPlayerArray.count {
            
            let buttonHeight = (HEIGHT + SPACE) * (CGFloat(player))
            
            // let imgView = masterPlayerArray[player].pictureView
            let imgView = UIImageView(image:  masterPlayerArray[player].picture)
            
            let roleName = masterPlayerArray[player].role
            
            let btnView = UIButton(type: .custom)
            //btnView.setImage(img, for: .normal)
            //let imgView = img
            
            btnView.addSubview(imgView)
            
            let roleLbl = UILabel()
            roleLbl.text = roleName
            
            // Add portrait
            rolesScrollView.addSubview(btnView)
            //rolesScrollView.addSubview(imgView)
            rolesScrollView.addSubview(roleLbl)
            
            if player == 0 {
                // Set frame of portrait
                btnView.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT)
                //imgView.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT)
                imgView.frame = btnView.bounds
            } else {
                // Set frame of portrait
                btnView.frame = CGRect(x: 0, y: buttonHeight, width: WIDTH, height: HEIGHT)
                //imgView.frame = CGRect(x: 0, y: buttonHeight, width: WIDTH, height: HEIGHT)
                imgView.frame = btnView.bounds
            }
            
            // Set frame of label
            roleLbl.frame = CGRect(x: WIDTH + GAP, y: buttonHeight + (HEIGHT / 2) - (FONTSIZE / 2), width: 125, height: FONTSIZE)
            
            // Set portrait to "scale to fill"
            btnView.contentMode = .scaleToFill
            imgView.contentMode = .scaleToFill
            
            if masterPlayerArray[player].isDead {
                applyFilter(imageView: imgView)
            } else {
                // Set button functionality
                btnView.addTarget(self, action: #selector(touchPortrait), for: .touchUpInside)
            }
            
            // set label font
            roleLbl.font = UIFont(name: "Kefa", size: FONTSIZE)
            
            //imgView.addTarget(self, action: #selector(touchPortrait), for: .touchUpInside)
            
            // don't worry about this
            //imgView.addGestureRecognizer(UITapRecognizer)
            //imgView.isUserInteractionEnabled = true
            
        }
    }

    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "EndToPause", sender: masterPlayerArray)
    }
    
    // Proceed Button
    @IBAction func goToHome(_ sender: Any) {
        // Play button click sound effect
        playClick()
        musicPlayer.stop()
        // Play main menu music
        let trackTitle = "Main Menu"
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
        
        performSegue(withIdentifier: "finish", sender: self)
    }
    
    // Touch Portrait
    @objc func touchPortrait() {
        let randNum = Int(arc4random_uniform(UInt32(profileNoisesNames.count)))
        print("randNum is \(randNum)")
        print("You hit a button")
        
        let trackTitle = profileNoisesNames[randNum]
        if let sound = NSDataAsset(name: trackTitle) {
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
    }

    
    // Need for Solely Vertical Scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
    
    // apply a red filter to an ImageView
    func applyFilter(imageView: UIImageView) {
        let overlay: UIView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
        overlay.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.5)
        imageView.addSubview(overlay)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EndToPause" {
            if let selectedVC = segue.destination as? PauseViewController {
                    if let thePlayerArray = sender as? Array<Player> {
                        selectedVC.masterPlayerArray = thePlayerArray
                    }
            }
        }
    }
}
