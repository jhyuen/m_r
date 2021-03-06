//
//  OptionsViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

struct optionsParameters {
    static var enableDirections: Bool = true
    static var enableStory: Bool = true
    static var soundEffectsVol: Float = 0.05
    static var musicVol: Float = 0.05
}

class OptionsViewController: UIViewController {

    @IBOutlet weak var soundEffectsSlider: UISlider!
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var directionsBtn: CheckBox!
    @IBOutlet weak var storyBtn: CheckBox!
    @IBOutlet weak var creditsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        soundEffectsSlider.value = optionsParameters.soundEffectsVol
        musicSlider.value = optionsParameters.musicVol
        directionsBtn.isChecked = optionsParameters.enableDirections
        storyBtn.isChecked = optionsParameters.enableStory
    }
    
    // Back Button
    @IBAction func backBtnPressed(_ sender: Any) {
        
        optionsParameters.enableDirections = directionsBtn.isChecked
        optionsParameters.enableStory = storyBtn.isChecked
        
        // Store sound options
        UserDefaults.standard.set(optionsParameters.enableDirections, forKey: "EnableDirections")
        UserDefaults.standard.set(optionsParameters.enableStory, forKey: "EnableStory")
        UserDefaults.standard.set(optionsParameters.musicVol, forKey: "MusicVol")
        UserDefaults.standard.set(optionsParameters.soundEffectsVol, forKey: "SEVol")
        
        // test if options were updated
        print(optionsParameters.enableDirections)
        print(optionsParameters.enableStory)
        print(optionsParameters.soundEffectsVol)
        print(optionsParameters.musicVol)
        
        // Play button click sound effect
        playClick()
        dismissLeftToRight(theVC: self)
        
    }
    
    // Info Button
    @IBAction func goToOptionInfo(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "OptionToInfo", sender: self)
    }
    
    // Credits Button
    @IBAction func creditsBtnPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "OptionsToCredits", sender: self)
    }
    
    // Checkbox Buttons
    @IBAction func checkBoxPressed(_ sender: Any) {
        // Play button click sound effect
        playClick()
    }
    
    // Sound Effects Slider Changed
    @IBAction func soundEffectsSlider(_ sender: UISlider) {
        optionsParameters.soundEffectsVol = sender.value
        print(optionsParameters.soundEffectsVol)
    }
    
    // Music Slider Changed
    @IBAction func musicSlider(_ sender: UISlider) {
        optionsParameters.musicVol = sender.value
        musicPlayer.volume = optionsParameters.musicVol
    }
}
