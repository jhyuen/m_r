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
    static var soundEffectsVol: Float = 1
    static var musicVol: Float = 1
}

class OptionsViewController: UIViewController {

    @IBOutlet weak var soundEffectsSlider: UISlider!
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var directionsBtn: CheckBox!
    @IBOutlet weak var storyBtn: CheckBox!
    
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
        dismiss(animated: true, completion: nil)
    }
    
    // Info Button
    @IBAction func goToOptionInfo(_ sender: Any) {
        // Play button click sound effect
        playClick()
        performSegue(withIdentifier: "OptionToInfo", sender: self)
    }
    
    // Sound Effects Slider Changed
    @IBAction func soundEffectsSlider(_ sender: UISlider) {
        optionsParameters.soundEffectsVol = sender.value
        musicPlayer.volume = optionsParameters.musicVol
    }
    
    // Music Slider Changed
    @IBAction func musicSlider(_ sender: UISlider) {
        optionsParameters.musicVol = sender.value
        musicPlayer.volume = optionsParameters.musicVol
    }
}
