//
//  5StoryViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

// Initialize button index array
var potentialIndex: Array<Int> = []

var storyIntroTrackNum: Int = 0
var dayStoryTrackNum: Int = 0
var tribunalTrackNum: Int = 0

class _StoryViewController: UIViewController, AVAudioPlayerDelegate {
    
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
    
    // Track names of story intro paragraphs
    var storyIntroOrder: Array<String> = []
    
    // Track names of day story
    var dayStoryOrder: Array<String> = []
    
    // Track names of tribunal story
    var tribunalStoryOrder: Array<String> = []
    
    // Random Number
    var randNum: Int = 0
    
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
            if optionsParameters.enableStory && !narrationStarted {
                storyIntroOrder.removeAll()
                generateStoryIntro()
            }
        } else if cycle > 1 && part == 0 {
            mainTitle.text = "DAY \(cycle - 1)"
            // Tribunal recap
            print("Tribunal recap")
            
            if optionsParameters.enableStory && !narrationStarted {
                tribunalStoryOrder.removeAll()
                generateTribunalNarration()
            }
            
            /*
             randNum = Int(arc4random_uniform(UInt32(executionPictureNames.count)))
             mainPicture.image = UIImage(named: introPictureNames[randNum])
             */
            
        } else if cycle >= 1 && part > 0 {
            mainTitle.text = "DAY \(cycle)"
            // Night recap
            print("Night recap")
            
            if optionsParameters.enableStory && !narrationStarted {
                dayStoryOrder.removeAll()
                generateDayNarration()
            }
            
            /*
             randNum = Int(arc4random_uniform(UInt32(murderPictureNames.count)))
             mainPicture.image = UIImage(named: introPictureNames[randNum])
             */
        }
        
        if mafiaSelected == docSelected && mafiaSelected != -1 {
            // Player Saved
            print("Saved")
            mainPicture.image = masterPlayerArray[docSelected].picture
        } else if mafiaSelected != docSelected && mafiaSelected != -1 {
            // Player Murdered
            print("Murdered")
            mainPicture.image = masterPlayerArray[mafiaSelected].picture
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
    
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(false)
    //        self.dismiss(animated: false, completion: nil)
    //        print("Story Disappearing")
    //    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "StoryToPause", sender: masterPlayerArray)
    }
    
    // Repeat Voice Button
    @IBAction func repeatVoice(_ sender: Any) {
        print("You hit the repeat button")
        if optionsParameters.enableStory {
            if cycle == 1 && part == 0 {
                // Story Intro
                narrationPlayer.stop()
                print(storyIntroOrder[0])
                playNarrationQueue(trackTitle: storyIntroOrder[0])
                storyIntroTrackNum = 1
            } else if cycle > 1 && part == 0 {
                // Tribunal recap
                narrationPlayer.stop()
                print(tribunalStoryOrder[0])
                playNarrationQueue(trackTitle: tribunalStoryOrder[0])
                dayStoryTrackNum = 1
            } else if cycle >= 1 && part > 0 {
                // Night recap
                narrationPlayer.stop()
                print(dayStoryOrder[0])
                playNarrationQueue(trackTitle: dayStoryOrder[0])
                dayStoryTrackNum = 1
            }
        }
    }
    
    // Proceed Button
    @IBAction func goToNextScreen(_ sender: Any) {
        narrationPlayer.stop()
        narrationStarted = false
        mafiaSelected = -1
        docSelected = -1
        dayStoryTrackNum = 0
        storyIntroTrackNum = 0
        tribunalTrackNum = 0
        
        if part == 0 {
            
            // Increase Part
            part = part + 1
            UserDefaults.standard.set(part, forKey: "Part")
            
            musicPlayer.stop()
            
            // Update Data for NightViewController
            isDay = false
            UserDefaults.standard.set(isDay, forKey: "isDay")
            
            savedMasterArray = masterPlayerArray
            let data = NSKeyedArchiver.archivedData(withRootObject: savedMasterArray)
            UserDefaults.standard.set(data, forKey: "savedMasterArray")
            
            narrationPlayer.stop()
            narrationStarted = false
            
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
            generateTribunalButtonSelection()
            
            // Reset recentlyMurdered variable
            recentlyMurdered = -1
            
            narrationPlayer.stop()
            narrationStarted = false
            
            performSegue(withIdentifier: "StoryToChoose", sender: masterPlayerArray)
        }
    }
    
    // adds red tint to imageView
    func applyFilter(imageView: UIImageView) {
        let overlay: UIView = UIView(frame: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
        overlay.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.5)
        imageView.addSubview(overlay)
    }
    
    // Touch Portrait
    func touchPortrait() {
        let randNum = Int(arc4random_uniform(UInt32(profileNoisesNames.count)))
        print("randNum is \(randNum)")
        print("You hit a button")
        
        let trackTitle = profileNoisesNames[randNum]
        if let sound = NSDataAsset(name: trackTitle) {
            // Do any additional setup after loading the view, typically from a nib.
            do {
                soundEffectPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeMPEGLayer3)
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
    
    // Choose 4 random unique sound effect buttons
    func generateTribunalButtonSelection() {
        // Loop through number of sound effect buttons
        potentialIndex.removeAll()
        
        for _ in 1...4 {
            var nextIndex: Int
            
            repeat {
                nextIndex = Int(arc4random_uniform(UInt32(tribunalSoundEffectsArray.count)))
            } while potentialIndex.contains(nextIndex)
            
            potentialIndex.append(nextIndex)
        }
        
        print(potentialIndex)
    }
    
    // Generates 3 paragraphs of narration for the story introduction
    func generateStoryIntro() {
        let firstParagraph = msiFirstParagraph[Int(arc4random_uniform(UInt32(msiFirstParagraph.count)))]
        let secondParagraph = msiSecondParagraph[Int(arc4random_uniform(UInt32(msiSecondParagraph.count)))]
        let thirdParagraph = msiThirdParagraph[Int(arc4random_uniform(UInt32(msiThirdParagraph.count)))]
        
        storyIntroOrder.append(firstParagraph)
        storyIntroOrder.append(secondParagraph)
        storyIntroOrder.append(thirdParagraph)
        
        // Play first paragraph
        if optionsParameters.enableStory {
            print(firstParagraph)
            playNarrationQueue(trackTitle: firstParagraph)
            storyIntroTrackNum = 1
        }
    }
    
    // Generate narration lines for tribunal recap
    func generateTribunalNarration() {
        let time = tribunalTime[Int(arc4random_uniform(UInt32(msiFirstParagraph.count)))]
        let setLine = tribunalGeneral[Int(arc4random_uniform(UInt32(msiFirstParagraph.count)))]
        let execution = tribunalExecution[Int(arc4random_uniform(UInt32(msiFirstParagraph.count)))]
        let explaination = tribunalExplanation[Int(arc4random_uniform(UInt32(msiFirstParagraph.count)))]
        
        tribunalStoryOrder.append(time)
        tribunalStoryOrder.append(setLine)
        tribunalStoryOrder.append(execution)
        tribunalStoryOrder.append(explaination)
        
        // Play first paragraph
        if optionsParameters.enableStory {
            print(time)
            playNarrationQueue(trackTitle: time)
            tribunalTrackNum = 1
        }
        
    }
    
    // Generate narration lines for night recap
    func generateDayNarration() {
        if mafiaSelected == docSelected && mafiaSelected != -1 {
            // Player Saved
            let trackTitle = noneDie[Int(arc4random_uniform(UInt32(noneDie.count)))]
            playNarration(trackTitle: trackTitle)
        } else {
            let intro = dayIntro[Int(arc4random_uniform(UInt32(dayIntro.count)))]
            let death = dayDeath[Int(arc4random_uniform(UInt32(dayDeath.count)))]
            let who = whoDied[Int(arc4random_uniform(UInt32(whoDied.count)))]
            
            dayStoryOrder.append(intro)
            dayStoryOrder.append(death)
            dayStoryOrder.append(who)
            
            // Play first paragraph
            if optionsParameters.enableStory {
                print(intro)
                playNarrationQueue(trackTitle: intro)
                dayStoryTrackNum = 1
            }
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("finished playing")
        if flag == true {
            // Story Intro Management
            if cycle == 1 && part == 0 {
                if storyIntroTrackNum == 1 && optionsParameters.enableStory {
                    // Play second paragraph
                    print(storyIntroOrder[1])
                    narrationPlayer.stop()
                    playNarrationQueue(trackTitle: storyIntroOrder[1])
                    storyIntroTrackNum = 2
                } else if storyIntroTrackNum == 2 && optionsParameters.enableStory {
                    // Play third paragraph
                    print(storyIntroOrder[2])
                    narrationPlayer.stop()
                    playNarrationQueue(trackTitle: storyIntroOrder[2])
                    storyIntroTrackNum = 0
                }
                // Day Story Management
            } else if cycle > 1 && part == 0 {
                // Tribunal recap
                if tribunalTrackNum == 1 && optionsParameters.enableStory {
                    // Play second paragraph
                    print(tribunalStoryOrder[1])
                    narrationPlayer.stop()
                    playNarrationQueue(trackTitle: tribunalStoryOrder[1])
                    tribunalTrackNum = 2
                } else if tribunalTrackNum == 2 && optionsParameters.enableStory {
                    // Play third paragraph
                    print(tribunalStoryOrder[2])
                    narrationPlayer.stop()
                    playNarrationQueue(trackTitle: tribunalStoryOrder[2])
                    tribunalTrackNum = 3
                } else if tribunalTrackNum == 3 && optionsParameters.enableStory {
                    // Play third paragraph
                    print(tribunalStoryOrder[3])
                    narrationPlayer.stop()
                    playNarrationQueue(trackTitle: tribunalStoryOrder[3])
                    tribunalTrackNum = 0
                }
            } else if cycle >= 1 && part > 0 {
                // Night recap
                if mafiaSelected != docSelected && mafiaSelected != -1 {
                    if dayStoryTrackNum == 1 && optionsParameters.enableStory {
                        // Play second paragraph
                        print(dayStoryOrder[1])
                        narrationPlayer.stop()
                        playNarrationQueue(trackTitle: dayStoryOrder[1])
                        dayStoryTrackNum = 2
                    } else if dayStoryTrackNum == 2 && optionsParameters.enableStory {
                        // Play third paragraph
                        print(dayStoryOrder[2])
                        narrationPlayer.stop()
                        playNarrationQueue(trackTitle: dayStoryOrder[2])
                        dayStoryTrackNum = 0
                    }
                }
            }
        }
    }
    
    // Given an mp3 file name, play file
    func playNarrationQueue(trackTitle: String) {
        if let sound = NSDataAsset(name: trackTitle) {
            // Do any additional setup after loading the view, typically from a nib.
            do {
                narrationPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeMPEGLayer3)
                
                narrationPlayer.delegate = self
                narrationPlayer.prepareToPlay()
                narrationPlayer.play()
                
            } catch {
                print(error)
            }
        }
        narrationStarted = true
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
