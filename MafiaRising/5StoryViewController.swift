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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let WIDTH: CGFloat = 90
    let HEIGHT: CGFloat = 135
    
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
        
    }

    override func viewWillAppear(_ animated: Bool) {
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
        
        for player in 0..<masterPlayerArray.count {
            let img = masterPlayerArray[player].picture
            let imgView = UIImageView(image: img)
            
            scrollView.addSubview(imgView)
            
            imgView.frame = CGRect(x: -WIDTH + ((WIDTH) * CGFloat(player+1)), y: 0, width: WIDTH, height: HEIGHT)
            
            imgView.contentMode = .scaleToFill
        }
        
        scrollView.contentSize = CGSize(width: WIDTH*CGFloat(masterPlayerArray.count), height: scrollView.frame.size.height)
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
        
        if part == 1 {
            performSegue(withIdentifier: "StoryToNight", sender: masterPlayerArray)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StoryToNight" {
            if let selectedVC = segue.destination as? _NightViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }
    
}
