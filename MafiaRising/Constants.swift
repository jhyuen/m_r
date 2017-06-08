//
//  Constants.swift
//  MafiaRising
//
//  Created by Admin on 6/8/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

let animateSegues: Bool = true

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
