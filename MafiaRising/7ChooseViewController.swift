//
//  7ChooseViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

// 0 = Continue
// 1 = Mafia Defeat
// 2 = Mafia Victory
var conclusion: Int = 0

class _ChooseViewController: UIViewController {

    // UI Outlets
    @IBOutlet weak var roleLbl: UILabel!
    @IBOutlet weak var soundEffectBtn1: UIButton!
    @IBOutlet weak var soundEffectBtn2: UIButton!
    @IBOutlet weak var soundEffectBtn3: UIButton!
    @IBOutlet weak var soundEffectBtn4: UIButton!
    
    // Transfer Array
    var masterPlayerArray: Array<Player> = []
    
    // Collection View
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Sound Effect Lists
    // !!! maybe make another sound effect array for tribunal sounds, not just night phase !!!
    var nightSoundEffectsArray: Array<SoundEffect> = []
    var tribunalSoundEffectsArray: Array<SoundEffect> = []
    
    // Sound Effect Button Sounds
    var sE1: String = "se1"
    var sE2: String = "se2"
    var sE3: String = "se3"
    var sE4: String = "se4"
    
    // Subpart Instantiation
    var subPart: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
    // load pictures from array
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return masterPlayerArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        
        //let button = cell.viewWithTag(1) as! UILabel
        
        let img = masterPlayerArray[indexPath.row].picture
        
        let btnView = UIButton(type: .custom)
        btnView.setImage(img, for: .normal)
        
        // Add portrait
        cell.viewWithTag(1)?.addSubview(btnView)
        //scrollView.addSubview(imgView)
        
        // Set frame of portrait
        btnView.frame = CGRect(x: 0, y: 0, width: cell.frame.width/3, height: cell.frame.height/3)
        
        // Set portrait to "scale to fill"
        btnView.contentMode = .scaleToFill
        
        /*
        // Set button functionality
        btnView.addTarget(self, action: #selector(touchPortrait), for: .touchUpInside)
 
        let subLabel = UIButton(type(of: custom))
        subLabel.image = Array[indexPath.row]
        cell.viewWithTag(1)?.addSubview(subLabel)
        subLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        subLabel.textAlignment = NSTextAlignment.center
        subLabel.textColor = UIColor.white
        return cell
         */
        
        return cell
    } */

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ChooseViewController")
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
        
        // Reset subPart
        subPart = 1
        
        // !!! Remember to Call This !!!
        setupCollectionView()
        
        if part == 2 {
            
            // Update title
            roleLbl.text = "MAFIA"
            // updateSounds(arrayType: nightSoundEffectsArray)
            
        } else if part == 5 {
            
            // Update title
            roleLbl.text = "TRIBUNAL"
            
            // updateSounds(arrayType: tribunalSoundEffectsArray)
        }
        
    }
    
    // Pause Button
    @IBAction func pauseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "ChooseToPause", sender: masterPlayerArray)
    } 
    
    // Repeat Button
    @IBAction func repeatDirections(_ sender: Any) {
        
        print("You hit the repeat button")
        // depending on subpart and cycle
        // remember to load different files
    }
    
    // Proceed Button
    @IBAction func goToNextScreen(_ sender: Any) {
        
        // Finish Mafia Selection
        if part == 2 && subPart == 1 {
            
            // checked box is targetted
            // uncheck all boxes
            
            if policeExist {
                subPart = subPart + 1
                roleLbl.text = "POLICE"
            } else if doctorExist {
                subPart = subPart + 2
                roleLbl.text = "DOCTOR"
            } else {
                
                // update masterPlayerArray with decisions
                
                if checkForEndGame(players: masterPlayerArray) {
                    part = part + 1
                    performSegue(withIdentifier: "ChooseToVictory", sender: masterPlayerArray)
                } else {
                    part = part + 1
                    performSegue(withIdentifier: "ChooseToDay", sender: masterPlayerArray)
                }
            }
            
        // Finish Police Selection
        } else if part == 2 && subPart == 2 {
            
            // checked box is targetted
            // uncheck all boxes
            
            if doctorExist {
                subPart = subPart + 1
                roleLbl.text = "DOCTOR"
            } else {
                
                // update masterPlayerArray with decisions
                
                if checkForEndGame(players: masterPlayerArray) {
                    part = part + 1
                    performSegue(withIdentifier: "ChooseToVictory", sender: masterPlayerArray)
                } else {
                    part = part + 1
                    performSegue(withIdentifier: "ChooseToDay", sender: masterPlayerArray)
                }
            }
            
        // Finish Doctor Selection
        } else if part == 2 && subPart == 3 {
            
            // checked box is targetted
            // uncheck all boxes
            
            // update masterPlayerArray with decisions
            
            if checkForEndGame(players: masterPlayerArray) {
                part = part + 1
                performSegue(withIdentifier: "ChooseToVictory", sender: masterPlayerArray)
            } else {
                part = part + 1
                performSegue(withIdentifier: "ChooseToDay", sender: masterPlayerArray)
            }
            
        // Finish Tribunal Selection
        } else if part == 5 {
            
            // update masterPlayerArray with decisions
            
            if checkForEndGame(players: masterPlayerArray) {
                part = part + 1
                performSegue(withIdentifier: "ChooseToVictory", sender: masterPlayerArray)
            } else {
                cycle = cycle + 1
                part = 0
                performSegue(withIdentifier: "ChooseToStory", sender: masterPlayerArray)
            }
        }
    }
    
    // Sound Effect Buttons
    @IBAction func pressSoundEffectBtn1(_ sender: Any) {
        // play
        print("\(sE1)")
    }
    // Sound Effect Buttons
    @IBAction func pressSoundEffectBtn2(_ sender: Any) {
        // play
        print("\(sE2)")
    }
    @IBAction func pressSoundEffectBtn3(_ sender: Any) {
        // play
        print("\(sE3)")
    }
    @IBAction func pressSoundEffectBtn4(_ sender: Any) {
        // play
        print("\(sE4)")
    }
    
    
    // Set Up Collection View
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing  = 0
        layout.minimumLineSpacing = 0
        collectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: "playerCollectionCell")
        collectionView.backgroundColor = nil
        
        collectionView.delegate = self as? UICollectionViewDelegate
        collectionView.dataSource = self as? UICollectionViewDataSource
    }
    
    // Set each sound effect button with picture and sound
    func updateSounds(arrayType: Array<SoundEffect>) {
        
         // Generate tag array
         var soundEffectsIndex = [Int](repeating: 0, count: arrayType.count)
         
         // Loop through number of sound effect buttons
         for soundEffectNum in 1...4 {
         
            var nextIndex: Int
         
            repeat {
                nextIndex = Int(arc4random_uniform(UInt32(arrayType.count)))
            } while soundEffectsIndex[nextIndex] == 1
         
            // Set sound effect button with random sound and corresponding picture
            switch soundEffectNum {
         
            case 1:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn1.setBackgroundImage(UIImage(named: arrayType[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE1 = arrayType[nextIndex].effect
                
            case 2:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn2.setBackgroundImage(UIImage(named: arrayType[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE2 = arrayType[nextIndex].effect
                
            case 3:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn3.setBackgroundImage(UIImage(named: arrayType[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE3 = arrayType[nextIndex].effect
                
            case 4:
                // Tag Index
                soundEffectsIndex[nextIndex] = 1
                // Picture
                soundEffectBtn4.setBackgroundImage(UIImage(named: arrayType[nextIndex].picture), for: UIControlState.normal)
                // Sound
                sE4 = arrayType[nextIndex].effect
                
            default:
                print("You have found a bug!!! Congratulations!!!")
            }
         
        }
    }
    
    // Check for end game scenario
    func checkForEndGame(players: Array<Player>) -> Bool{
        
        var mafiaPop: Int = 0
        var townPop: Int = 0
        
        for player in 0..<players.count {
            if players[player].isDead == false {
                if players[player].role == "MAFIA" {
                    mafiaPop = mafiaPop + 1
                } else {
                    townPop = townPop + 1
                }
            }
        }
        
        print("\(mafiaPop)")
        print("\(townPop)")
        
        
        // 0 = Continue
        // 1 = Mafia Defeat
        // 2 = Mafia Victory
        
        if mafiaPop == 0 {
            conclusion = 1
            return true
        } else if mafiaPop >= townPop {
            conclusion = 2
            return true
        } else {
            return false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseToDay" {
            if let selectedVC = segue.destination as? _DayViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        } else if segue.identifier == "ChooseToStory" {
            if let selectedVC = segue.destination as? _StoryViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        } else if segue.identifier == "ChooseToVictory" {
                if let selectedVC = segue.destination as? _VictoryViewController {
                    if let thePlayerArray = sender as? Array<Player> {
                        selectedVC.masterPlayerArray = thePlayerArray
                    }
                }
        } else if segue.identifier == "ChooseToPause" {
            if let selectedVC = segue.destination as? PauseViewController {
                if let thePlayerArray = sender as? Array<Player> {
                    selectedVC.masterPlayerArray = thePlayerArray
                }
            }
        }
    }

}

extension _ChooseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Specifying the number of sections in the collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Specifying the number of cells in the given section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return masterPlayerArray.count
    }
    
    // We use this method to dequeue the cell and set it up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCollectionCell", for: indexPath) as! PlayerCollectionViewCell
        cell.awakeFromNib()
        // cell.delegate = self
        return cell
    }
    
    // We use this method to populate the data of a given cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let playerCell = cell as! PlayerCollectionViewCell
        playerCell.playerBtnView.setImage(masterPlayerArray[indexPath.row].picture, for: .normal)
    }
    
    // Sets size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/3.2), height: collectionView.frame.height/2.05)
        // 200
        // 2.05
    }
    
    // Tap cell functionality
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
