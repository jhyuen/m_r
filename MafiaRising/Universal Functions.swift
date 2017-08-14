//
//  Constants.swift
//  MafiaRising
//
//  Created by Admin on 6/8/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit
import AVFoundation

let animateSegues: Bool = true

// Sound Effect List
// Basic Sound Effects
var accent1 = SoundEffect(effect: "Accent 1", picture: "Accent.png")
let accent2 = SoundEffect(effect: "Accent 2", picture: "Accent2.png")
let accent3 = SoundEffect(effect: "Accent 3", picture: "Accent2.png")
let bell = SoundEffect(effect: "Bell", picture: "BellB.png")
let clock = SoundEffect(effect: "Clock", picture: "ClockB.png")
let cough = SoundEffect(effect: "Cough", picture: "Cough.png")
let creak1 = SoundEffect(effect: "Creak 1", picture: "Creak.png")
let creak2 = SoundEffect(effect: "Creak 2", picture: "Creak.png")
let crickets = SoundEffect(effect: "Crickets", picture: "Crickets.png")
let door = SoundEffect(effect: "Door", picture: "Door.png")
let giggle = SoundEffect(effect: "Giggle", picture: "Giggle.png")
let glass = SoundEffect(effect: "Glass", picture: "Glass.png")
let leaves1 = SoundEffect(effect: "Leaves 1", picture: "LeavesB.png")
let pianoAccent1 = SoundEffect(effect: "Piano Accent 1", picture: "PianoAccent.png")
let pianoAccent2 = SoundEffect(effect: "Piano Accent 2", picture: "PianoAccent.png")
let pianoAccent3 = SoundEffect(effect: "Piano Accent 3", picture: "PianoAccent.png")
let scratch = SoundEffect(effect: "Scratch", picture: "Scratch.png")
let wind = SoundEffect(effect: "Wind", picture: "Wind.png")

// Tribunal Sound Effects
// for multiple potentially add array instead of single String
// and randomize for each picture the multiple sound effects
// BUT table until update
let angryMob1 = SoundEffect(effect: "Angry Mob 1", picture: "AngryMob.png")
let angryMob2 = SoundEffect(effect: "Angry Mob 2", picture: "AngryMob.png")
let angryMob3 = SoundEffect(effect: "Angry Mob 3", picture: "AngryMob.png")
let boo = SoundEffect(effect: "Boo", picture: "Boo.png")
let clapping = SoundEffect(effect: "Clapping", picture: "PeopleClap.png")
let flappingBirds = SoundEffect(effect: "Flapping Birds", picture: "FlappingWings.png")
let freedom = SoundEffect(effect: "Freedom", picture: "Freedom.png")
let ivat1 = SoundEffect(effect: "IVAT 1", picture: "IVolunteer.png")
let ivat2 = SoundEffect(effect: "IVAT 2", picture: "IVolunteer.png")
let ivat3 = SoundEffect(effect: "IVAT 3", picture: "IVolunteer.png")
let nay = SoundEffect(effect: "Nay", picture: "Nay.png")
let raven = SoundEffect(effect: "Raven", picture: "Raven.png")
let rooster = SoundEffect(effect: "Rooster", picture: "RoosterCrow.png")
let weeping = SoundEffect(effect: "Weeping", picture: "Weeping.png")
let yay = SoundEffect(effect: "Yay", picture: "Yay.png")

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

}

// Given an mp3 file name, play file
func playNarration(trackTitle: String) {
    if let sound = NSDataAsset(name: trackTitle) {
        // Do any additional setup after loading the view, typically from a nib.
        do {
            narrationPlayer = try AVAudioPlayer(data: sound.data, fileTypeHint: AVFileTypeMPEGLayer3)
        
            narrationPlayer.prepareToPlay()
            narrationPlayer.play()
            
        } catch {
            print(error)
        }
    }
    narrationStarted = true
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
