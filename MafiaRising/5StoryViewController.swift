//
//  5StoryViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class _StoryViewController: UIViewController {

    @IBOutlet weak var mainPicture: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    
    // tranfer master player array
    var masterPlayerArray: Array<Player> = []
    
    // Main Picture Potential Photos
    // Intro Pictures Array
    var introPictureNames: Array<String> = []
    
    // Execution Pictures Array
    var executionPictureNames: Array<String> = []
    
    // Murder Pictures Array
    var murderPictureNames: Array<String> = []
    
    // random Number
    var randNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(cycle)")
        
        // Set main title to correct wording
        if cycle == 1 && part == 0 {
            mainTitle.text = "STORY"
            
            /*
            randNum = Int(arc4random_uniform(UInt32(introPictureNames.count)))
            mainPicture.image = UIImage(named: introPictureNames[randNum])
             */
            
        } else if cycle > 1 && part == 0 {
            mainTitle.text = "DAY \(cycle - 1)"
            
            /*
            randNum = Int(arc4random_uniform(UInt32(executionPictureNames.count)))
            mainPicture.image = UIImage(named: introPictureNames[randNum])
            */
            
        } else if cycle > 1 && part > 0 {
            mainTitle.text = "DAY \(cycle)"
            
            /*
            randNum = Int(arc4random_uniform(UInt32(murderPictureNames.count)))
            mainPicture.image = UIImage(named: introPictureNames[randNum])
            */
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "StoryToPause", sender: self)
    }
    
    // Repeat Voice Button
    @IBAction func repeatVoice(_ sender: Any) {
        
    }
    
    // Proceed Button
    @IBAction func goToNextScreen(_ sender: Any) {
        
        // Increase part
        part = part + 1
    }

}
