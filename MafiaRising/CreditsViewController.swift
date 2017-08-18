//
//  CreditsViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 8/18/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {

    // UI Variables
    @IBOutlet weak var creditScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set frame of ScrollView
        creditScrollView.contentSize = CGSize(width: creditScrollView.frame.size.width, height: 1490)
        
        // Generate Content
        //let thanksLbl = UILabel()
        let madeByLbl = UILabel()
        let narrationByLbl = UILabel()
        let soundEffectsTitleLbl = UILabel()
        let soundEffectsNoteLbl = UILabel()
        let soundEffectsByLbl = UILabel()
        
        // Add Content to ScrollView
        //creditScrollView.addSubview(thanksLbl)
        creditScrollView.addSubview(madeByLbl)
        creditScrollView.addSubview(narrationByLbl)
        creditScrollView.addSubview(soundEffectsTitleLbl)
        creditScrollView.addSubview(soundEffectsNoteLbl)
        creditScrollView.addSubview(soundEffectsByLbl)
        
        // Set frame of label
        //thanksLbl.frame = CGRect(x: 0, y: 0, width: creditScrollView.frame.width, height: 50)
        madeByLbl.frame = CGRect(x: 0, y: 0, width: creditScrollView.frame.width, height: 50)
        narrationByLbl.frame = CGRect(x: 0, y: 50, width: creditScrollView.frame.width, height: 50)
        soundEffectsTitleLbl.frame = CGRect(x: 0, y: 110, width: creditScrollView.frame.width, height: 50)
        soundEffectsNoteLbl.frame = CGRect(x: 0, y: 160, width: creditScrollView.frame.width, height: 50)
        soundEffectsByLbl.frame = CGRect(x: 0, y: 220, width: creditScrollView.frame.width, height: 1250)
        
        // Set label font
        //thanksLbl.font = UIFont(name: “Kefa-Bold”, size: 25)
        //thanksLbl.font = UIFont.boldSystemFont(ofSize: 20.0)
        madeByLbl.font = UIFont(name: "Kefa-Bold", size: 30)
        narrationByLbl.font = UIFont(name: "Kefa", size: 20)
        soundEffectsTitleLbl.font = UIFont(name: "Kefa-Bold", size: 30)
        soundEffectsNoteLbl.font = UIFont(name: "Kefa", size: 20)
        soundEffectsByLbl.font = UIFont(name: "Kefa", size: 10)
        
        // Set label color
      //  thanksLbl.textColor = UIColor.black
        madeByLbl.textColor = UIColor.black
        narrationByLbl.textColor = UIColor.black
        soundEffectsTitleLbl.textColor = UIColor.black
        soundEffectsNoteLbl.textColor = UIColor.black
        soundEffectsByLbl.textColor = UIColor.black
        
        
        // Set label allignment
      //  thanksLbl.textAlignment = NSTextAlignment.center
        madeByLbl.textAlignment = NSTextAlignment.center
        narrationByLbl.textAlignment = NSTextAlignment.center
        soundEffectsTitleLbl.textAlignment = NSTextAlignment.center
        soundEffectsNoteLbl.textAlignment = NSTextAlignment.center
        soundEffectsByLbl.textAlignment = NSTextAlignment.center
        
        // Set number of lines
      // thanksLbl.numberOfLines = 1
        madeByLbl.numberOfLines = 1
        narrationByLbl.numberOfLines = 2
        soundEffectsTitleLbl.numberOfLines = 1
        soundEffectsNoteLbl.numberOfLines = 2
        soundEffectsByLbl.numberOfLines = 107
        
        // Set label content
       // thanksLbl.text = "Thank you for playing!"
        madeByLbl.text = "Made by Illum"
        narrationByLbl.text = "Narration by David Burke\ndotherobot2199@gmail.com"
        soundEffectsTitleLbl.text = "Sound Effects"
        soundEffectsNoteLbl.text = "This app uses many sounds\nfrom freesound:"
        soundEffectsByLbl.text = "Door by rivernile7\n(http://www.freesound.org/people/rivernil7/)\n\nGlass, Clock, Footsteps, Rooster by InspectorJ\n(http://www.freesound.org/people/InspectorJ/)\n\nWind Swish by hykenfreak\n(http://www.freesound.org/people/hykenfreak/)\n\nCreak 1 by JarredGibb\n(http://www.freesound.org/people/JarredGibb/)\n\nCreak 2 by jameswrowles\n(https://freesound.org/people/jameswrowles/)\n\nBell by tec studios\n(http://www.freesound.org/people/tec%20studios/)\n\nLeaves 1 by SOUNDSCAPE_HUMFAK\n(http://www.freesound.org/people/SOUNDSCAPE_HUMFAK/)\n\nLeaves 2 by ceberation\n(https://freesound.org/people/ceberation/)\n\nCough by joedeshon\n(http://www.freesound.org/people/joedeshon/)\n\nScratch by THE_bizniss\n(http://www.freesound.org/people/THE_bizniss/)\n\nAccent 1 by MonkeyFacebook532\n(http://www.freesound.org/people/MonkeyFacebook532/)\n\nAccent 2, Ugh by qubodup\n(http://www.freesound.org/people/qubodup/)\n\nBell by copyc4t\n(http://www.freesound.org/people/copyc4t/)\n\nGunshot 1 by RSilveira_88\n(http://www.freesound.org/people/FSilveira_88/)\n\nGunshot 2 by ShawnyBoy\n(http://www.freesound.org/people/ShawnyBoy/)\n\nClick by ecfike\n(http://www.freesound.org/people/ecfike/)\n\nDing by JohnsonBrandEditing\n(http://www.freesound.org/people/JohnsonBrandEditing/)\n\nBum by ondondvo\n(http://www.freesound.org/people/ondondvo/)\n\nDum by DJ Burnham\n(http://www.freesound.org/people/DJ%20Burnham/)\n\nError by RICHERlandTV\n(http://www.freesound.org/people/RICHERlandTV/)\n\nHey by justincase1021\n(http://www.freesound.org/people/justincase1021/)\n\nHaha by engreitz\n(http://www.freesound.org/people/engreitz/)\n\nOuch by girlhurl\n(http://www.freesound.org/people/girlhurl/)\n\nOw by thecheeseman\n(http://www.freesound.org/people/thecheeseman/)\n\nHi by rjsaqibsheikh\n(http://www.freesound.org/people/rjsaqibsheikh/)\n\nGiggle, Ooh by Reitanna\n(http://www.freesound.org/people/Reitanna/)\n\nRoar by ArriGD\n(http://www.freesound.org/people/ArriGD/)\n\nCrickets by hdfreema\n(http://www.freesound.org/people/hdfreema/)\n\nRain by loopbasedmusic\n(http://www.freesound.org/people/loopbasedmusic/)\n\nWind by spoonbender\n(http://www.freesound.org/people/spoonbender/)\n\nRiver by lwdickens\n(http://www.freesound.org/people/lwdickens/)\n\nAngry Crowd 1 by FillMat\n(https://freesound.org/people/FillMat/)\n\nAngry Crowd 2 by unchaz\n(https://freesound.org/people/unchaz/)\n\nAngry Crowd 3 by jayfrosting\n(https://freesound.org/people/jayfrosting/)\n\nWeeping by AlucardsBride\n(https://freesound.org/people/AlucardsBride/)\n\nYay by zut50\n(https://freesound.org/people/zut50/)"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // Back Button
    @IBAction func goBackToHome(_ sender: Any) {
        // Play button click sound effect
        playClick()
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
