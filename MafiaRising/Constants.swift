//
//  Constants.swift
//  MafiaRising
//
//  Created by Admin on 6/8/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

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
