//
//  5StoryViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

class _StoryViewController: UIViewController {

    // UI Outlet
    // may turn into button if showing words
    @IBOutlet weak var mainPicture: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // ScrollView Constants
    let WIDTH: CGFloat = 90
    let HEIGHT: CGFloat = 135
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    // Main Picture Potential Photos
    // Intro Pictures Array
    var introPictureNames: Array<String> = []
    
    // Execution Pictures Array
    var executionPictureNames: Array<String> = []
    
    // Murder Pictures Array
    var murderPictureNames: Array<String> = []
    
    // Random Number
    var randNum: Int = 0
    
    // Initialize AudioPlayer for sound effects
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("StoryViewController")
        print("Cycle is \(cycle)")
        print("Part is \(part)")
        
        // Set main title to correct wording
        if cycle == 1 && part == 0 {
            // Story Intro
            mainTitle.text = "STORY"
        } else if cycle > 1 && part == 0 {
            mainTitle.text = "DAY \(cycle - 1)"
            
            /*
             randNum = Int(arc4random_uniform(UInt32(executionPictureNames.count)))
             mainPicture.image = UIImage(named: introPictureNames[randNum])
             */
            
        } else if cycle >= 1 && part > 0 {
            mainTitle.text = "DAY \(cycle)"
            
            /*
             randNum = Int(arc4random_uniform(UInt32(murderPictureNames.count)))
             mainPicture.image = UIImage(named: introPictureNames[randNum])
             */
        }
        
        // Add player portaits to ScrollView
        for player in 0..<masterPlayerArray.count {
            
            let img = masterPlayerArray[player].picture
            let imgView = UIImageView(image: img)
            
            let btnView = UIButton(type: .custom)
            btnView.addSubview(imgView)
            
            //btnView.setImage(img, for: .normal)
            //let imgView = UIImageView(image: img)
            
            // Add portrait
            scrollView.addSubview(btnView)
            //scrollView.addSubview(imgView)
            
            // Set frame of portrait
            btnView.frame = CGRect(x: -WIDTH + ((WIDTH) * CGFloat(player+1)), y: 0, width: WIDTH, height: HEIGHT)
            // imgView.frame = CGRect(x: -WIDTH + ((WIDTH) * CGFloat(player+1)), y: 0, width: WIDTH, height: HEIGHT)
            
            imgView.frame = btnView.bounds
            
            // Set portrait to "scale to fill"
            btnView.contentMode = .scaleToFill
            imgView.contentMode = .scaleToFill
            
            // Set button functionality
            if !masterPlayerArray[player].isDead {
                btnView.addTarget(self, action: #selector(touchPortrait), for: .touchUpInside)
            } else {
                applyFilter(imageView: imgView)
            }
        
        }
        
        // Set frame of ScrollView
        scrollView.contentSize = CGSize(width: WIDTH*CGFloat(masterPlayerArray.count), height: scrollView.frame.size.height)
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "StoryToPause", sender: masterPlayerArray)
    }
    
    // Repeat Voice Button
    @IBAction func repeatVoice(_ sender: Any) {
        print("You hit the repeat button")
    }
    
    // Proceed Button
    @IBAction func goToNextScreen(_ sender: Any) {
        
        if part == 0 {
            
            // Increase Part
            part = part + 1
            UserDefaults.standard.set(part, forKey: "Part")
            
            musicPlayer.stop()
            performSegue(withIdentifier: "StoryToNight", sender: masterPlayerArray)
        }
        
        if part == 4 {
            
            // Increase Part
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

            performSegue(withIdentifier: "StoryToChoose", sender: masterPlayerArray)
        }
    }
    
    // adds red tint to imageView
    func applyFilter(imageView: UIImageView) {
        let overlay: UIView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
        overlay.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.5)
        imageView.addSubview(overlay)
    }
    
    func touchPortrait() {
        let randNum = Int(arc4random_uniform(UInt32(profileNoisesNames.count)))
        print("randNum is \(randNum)")
        print("You hit a button")
        
        let trackTitle = profileNoisesNames[randNum]
        if let sound = NSDataAsset(name: trackTitle) {
            // Do any additional setup after loading the view, typically from a nib.
            do {
                audioPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeMPEGLayer3)
                //audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: trackTitle, ofType: "mp3")!))
                
                if audioPlayer.isPlaying {
                    audioPlayer.stop()
                }
                
                audioPlayer.play()
                
            } catch {
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StoryToNight" {
            if let selectedVC = segue.destination as? _NightViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        } else if segue.identifier == "StoryToChoose" {
            if let selectedVC = segue.destination as? _ChooseViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        } else if segue.identifier == "StoryToPause" {
            if let selectedVC = segue.destination as? PauseViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
    
}
