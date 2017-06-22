//
//  5StoryViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

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
    
    // Profile Weird Noises Array
    var profileNoisesNames: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("StoryViewController")
        print("Cycle is \(cycle)")
        print("Part is \(part)")
        print("\(masterPlayerArray[0].isDead)")
        print("\(masterPlayerArray[1].isDead)")
        print("\(masterPlayerArray[2].isDead)")
        print("\(masterPlayerArray[3].isDead)")
        print("\(masterPlayerArray[4].isDead)")
        print("\(masterPlayerArray[0].role)")
        print("\(masterPlayerArray[1].role)")
        print("\(masterPlayerArray[2].role)")
        print("\(masterPlayerArray[3].role)")
        print("\(masterPlayerArray[4].role)")
        
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
  
            let btnView = UIButton(type: .custom)
            btnView.setImage(img, for: .normal)
            //let imgView = UIImageView(image: img)
            
            // Add portrait
            scrollView.addSubview(btnView)
            //scrollView.addSubview(imgView)
            
            // Set frame of portrait
            btnView.frame = CGRect(x: -WIDTH + ((WIDTH) * CGFloat(player+1)), y: 0, width: WIDTH, height: HEIGHT)
            // imgView.frame = CGRect(x: -WIDTH + ((WIDTH) * CGFloat(player+1)), y: 0, width: WIDTH, height: HEIGHT)
            
            // Set portrait to "scale to fill"
            btnView.contentMode = .scaleToFill
            // imgView.contentMode = .scaleToFill
            
            // Set button functionality
            btnView.addTarget(self, action: #selector(touchPortrait), for: .touchUpInside)
        
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
        
    }
    
    // Proceed Button
    @IBAction func goToNextScreen(_ sender: Any) {
        
        if part == 0 {
            
            // Increase Part
            part = part + 1
            
            performSegue(withIdentifier: "StoryToNight", sender: masterPlayerArray)
        }
        
        if part == 4 {
            
            // Increase Part
            part = part + 1
            
            performSegue(withIdentifier: "StoryToChoose", sender: masterPlayerArray)
        }
    }
    
    func touchPortrait() {
        // randNum = Int(arc4random_uniform(UInt32(profileNoisesNames.count)))
        // play profileNoisesNames[randNum]
        print("You hit a button")
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
