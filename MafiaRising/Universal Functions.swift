//
//  Constants.swift
//  MafiaRising
//
//  Created by Admin on 6/8/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

let animateSegues: Bool = false

// Sound Effect List
// Basic Sound Effects
var accent1 = SoundEffect(effect: "Accent 1", picture: "AccentW.png")
let accent2 = SoundEffect(effect: "Accent 2", picture: "Accent2W.png")
let accent3 = SoundEffect(effect: "Accent 3", picture: "Accent2W.png")
let bell = SoundEffect(effect: "Bell", picture: "BellBW.png")
let clock = SoundEffect(effect: "Clock", picture: "ClockBW.png")
let cough = SoundEffect(effect: "Cough", picture: "CoughW.png")
let creak1 = SoundEffect(effect: "Creak 1", picture: "CreakW.png")
let creak2 = SoundEffect(effect: "Creak 2", picture: "CreakW.png")
let crickets = SoundEffect(effect: "Crickets", picture: "CricketsW.png")
let door = SoundEffect(effect: "Door", picture: "DoorW.png")
let giggle = SoundEffect(effect: "Giggle", picture: "GiggleW.png")
let glass = SoundEffect(effect: "Glass", picture: "GlassW.png")
let leaves1 = SoundEffect(effect: "Leaves 1", picture: "LeavesBW.png")
let pianoAccent1 = SoundEffect(effect: "Piano Accent 1", picture: "PianoAccentW.png")
let pianoAccent2 = SoundEffect(effect: "Piano Accent 2", picture: "PianoAccentW.png")
let pianoAccent3 = SoundEffect(effect: "Piano Accent 3", picture: "PianoAccentW.png")
let scratch = SoundEffect(effect: "Scratch", picture: "ScratchW.png")
let wind = SoundEffect(effect: "Wind", picture: "WindW.png")

// Tribunal Sound Effects
// for multiple potentially add array instead of single String
// and randomize for each picture the multiple sound effects
// BUT table until update
let angryMob1 = SoundEffect(effect: "Angry Mob 1", picture: "AngryMobW.png")
let angryMob2 = SoundEffect(effect: "Angry Mob 2", picture: "AngryMobW.png")
let angryMob3 = SoundEffect(effect: "Angry Mob 3", picture: "AngryMobW.png")
let boo = SoundEffect(effect: "Boo", picture: "BooW.png")
let clapping = SoundEffect(effect: "Clapping", picture: "PeopleClapW.png")
let flappingBirds = SoundEffect(effect: "Flapping birds", picture: "FlappingWingsW.png")
let freedom = SoundEffect(effect: "Freedom", picture: "FreedomW.png")
let ivat1 = SoundEffect(effect: "IVAT 1", picture: "IVolunteerW.png")
let ivat2 = SoundEffect(effect: "IVAT 2", picture: "IVolunteerW.png")
let ivat3 = SoundEffect(effect: "IVAT 3", picture: "IVolunteerW.png")
let nay = SoundEffect(effect: "Nay", picture: "NayW.png")
let raven = SoundEffect(effect: "Raven", picture: "RavenW.png")
let rooster = SoundEffect(effect: "Rooster", picture: "RoosterCrowW.png")
let weeping = SoundEffect(effect: "Weeping", picture: "WeepingW.png")
let yay = SoundEffect(effect: "Yay", picture: "YayW.png")

// Generate sound effects arrays
let basicSoundEffectsArray: Array<SoundEffect> = [accent1, accent2, accent3, bell, clock, cough, creak1, creak2, crickets, door, giggle, glass, leaves1, pianoAccent1, pianoAccent2, scratch, wind]
let tribunalSoundEffectsArray: Array<SoundEffect> = [angryMob1, angryMob2, angryMob3, boo, clapping, flappingBirds, freedom, ivat1, ivat2, ivat3, nay, raven, rooster, weeping, yay]

var msiFirstParagraph: Array<String> = []
var msiSecondParagraph: Array<String> = []
var msiThirdParagraph: Array<String> = []
var dayIntro: Array<String> = []
var dayDeath: Array<String> = []
var tribunalTime: Array<String> = []
var tribunalGeneral: Array<String> = []
var tribunalExecution: Array<String> = []
var tribunalExplanation: Array<String> = []
var noneDie: Array<String> = []
var endVictory: Array<String> = []
var endDefeat: Array<String> = []
var whoDied: Array<String> = []

// Populates arrays the hold narration file names
func generateNarrationArrays() {
    // First Paragraph
    for number in 1...30 {
        if (number<10) {
            msiFirstParagraph.append("CL_MSI_P1_0\(number)")
        } else {
            msiFirstParagraph.append("CL_MSI_P1_\(number)")
        }
    }
    
    // Second Paragraph
    for number in 1...30 {
        if (number<10) {
            msiSecondParagraph.append("CL_MSI_P2_0\(number)")
        } else {
            msiSecondParagraph.append("CL_MSI_P2_\(number)")
        }
    }
    
    // Third Paragraph
    for number in 1...30 {
        if (number<10) {
            msiThirdParagraph.append("CL_MSI_P3_0\(number)")
        } else {
            msiThirdParagraph.append("CL_MSI_P3_\(number)")
        }
    }
    
    // Day - Intro
    for number in 1...9 {
        dayIntro.append("CL_D_I_0\(number)")
    }
    for number in 10...29 {
        dayIntro.append("CL_D_I_\(number)")
    }
    
    // Day - Death
    for number in 1...9 {
        dayDeath.append("CL_D_D_0\(number)")
    }
    for number in 10...44 {
        dayDeath.append("CL_D_D_\(number)")
    }
    
    // Tribunal - Time
    for number in 1...9 {
        tribunalTime.append("CL_T_T_0\(number)")
    }
    for number in 10...15 {
        tribunalTime.append("CL_T_T_\(number)")
    }
    
    // Tribunal - General
    tribunalGeneral.append("CL_T_G_01")
    
    // Tribunal - Execution
    for number in 1...9 {
        tribunalExecution.append("CL_T_Exe_0\(number)")
    }
    for number in 10...30 {
        tribunalExecution.append("CL_T_Exe_\(number)")
    }
    
    // Tribunal - Explanation
        for number in 1...9 {
        tribunalExplanation.append("CL_T_Exp_0\(number)")
    }
    for number in 10...30 {
        tribunalExplanation.append("CL_T_Exp_\(number)")
    }
    
    // Special Saying Only if someone was saved
    noneDie.append("NoneDie")
    
    // End - Victory
    for number in 1...9 {
        endVictory.append("CL_E_V_0\(number)")
    }
    for number in 10...11 {
        endVictory.append("CL_E_V_\(number)")
    }
    
    // End - Defeat
    for number in 1...9 {
        endDefeat.append("CL_E_D_0\(number)")
    }
    for number in 10...24 {
        endDefeat.append("CL_E_D_\(number)")
    }
    
    // Line indicating who died
    whoDied.append("CL_D_W_01")
}

// Given an mp3 file name, play file
func playNarration(trackTitle: String) {
    if let sound = NSDataAsset(name: trackTitle) {
        // Do any additional setup after loading the view, typically from a nib.
        do {
            narrationPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
            
            narrationPlayer.volume = 1.0
            narrationPlayer.prepareToPlay()
            narrationPlayer.play()
            
        } catch {
            print(error)
        }
    }
    narrationStarted = true
}

// Plays click sound effect
func playClick() {
    if let sound = NSDataAsset(name: "Click") {
        // Do any additional setup after loading the view, typically from a nib.
        do {
            clickPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileType.mp3.rawValue)
            
            clickPlayer.volume = optionsParameters.soundEffectsVol
            clickPlayer.prepareToPlay()
            clickPlayer.play()
            
        } catch {
            print(error)
        }
    }
}

func dismissLeftToRight (theVC: UIViewController) {
    let transition: CATransition = CATransition()
    transition.duration = 0.5
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    transition.type = kCATransitionMoveIn
    transition.subtype = kCATransitionFromLeft
    theVC.view.window!.layer.add(transition, forKey: nil)
    theVC.dismiss(animated: false, completion: nil)
}


func dismissRightToLeft (theVC: UIViewController) {
    let transition: CATransition = CATransition()
    transition.duration = 0.5
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    transition.type = kCATransitionMoveIn
    transition.subtype = kCATransitionFromRight
    theVC.view.window!.layer.add(transition, forKey: nil)
    theVC.dismiss(animated: false, completion: nil)
}

func dismissTopToBottom (theVC: UIViewController) {
    let transition: CATransition = CATransition()
    transition.duration = 0.5
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    transition.type = kCATransitionMoveIn
    transition.subtype = kCATransitionFromTop
    theVC.view.window!.layer.add(transition, forKey: nil)
    theVC.dismiss(animated: false, completion: nil)
}


func dismissBottomToTop (theVC: UIViewController) {
    let transition: CATransition = CATransition()
    transition.duration = 0.5
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    transition.type = kCATransitionMoveIn
    transition.subtype = kCATransitionFromBottom
    theVC.view.window!.layer.add(transition, forKey: nil)
    theVC.dismiss(animated: false, completion: nil)
}
