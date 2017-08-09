//
//  UnwindScaleSegue.swift
//  MafiaRising
//
//  Created by Admin on 8/9/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class UnwindScaleSegue: UIStoryboardSegue {
    override func perform() {
        scale()
    }
    
    func scale() {
        let toViewController = self.destination
        let fromViewController = self.source
        
        fromViewController.view.superview?.insertSubview(toViewController.view, at: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }, completion: { success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
    }
}
