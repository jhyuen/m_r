//
//  RoleInformationViewController.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 5/22/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import UIKit

class RoleInformationViewController: UIViewController {
    
    // changing variables
    @IBOutlet weak var roleCharacter: UILabel!
    @IBOutlet weak var roleAllegiance: UILabel!
    @IBOutlet weak var roleImg: UIImageView!
    @IBOutlet weak var roleDescription: UILabel!
    
    // Transfer variables
    var transferTag = 0
    
    // Role Image Names
    var moderatorImg: String = "MRFinal RolesModerator"
    var citizenImg: String = "MRFinal RolesCitizen"
    var mafiaImg: String = "MRFinal RolesMafia"
    var doctorImg: String = "MRFinal RolesDoctor"
    var policeImg: String = "MRFinal RolesPolice"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Back Button
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch transferTag {
            
        case 0:
            
            roleCharacter.text = "MODERATOR"
            roleAllegiance.text = "NEUTRAL"
            roleImg.image = UIImage(named: moderatorImg)
            roleDescription.text = "The moderator creates an immersive story for the players to play in. By interacting with various characters in the game, the moderator controls the game's prograssion. Also, the moderator may add sound effects to dramatize the game experience."
            
        case 1:
            
            roleCharacter.text = "CITIZEN"
            roleAllegiance.text = "PRO-TOWN"
            roleImg.image = UIImage(named: citizenImg)
            roleDescription.text = "Citizens are the main inhabitants of the town. Unlike the other roles, citizens do not have any special powers. Their role, however, is not frowned upon for they have the opportunity to vote during the tribunal. During the tribunal, citizens typically make up the majority of voters."
            
        case 2:
            
            roleCharacter.text = "MAFIA"
            roleAllegiance.text = "ANTI-TOWN"
            roleImg.image = UIImage(named: mafiaImg)
            roleDescription.text = "The MAFIA is the villian in Mafia Rising. There can be a single MAFIA or multiple MAFIA in one game. In the beginning, the MAFIA will know who each other are, but they will have no information on any of the other roles. During the night phase, every MAFIA must agree on one person to try murdering. During the day phase, the MAFIA will be trying to decieve the TOWN by framing other players and drawing suspicion away from the actual MAFIA. To win, the MAFIA must murder enough townspeople to become the majority."
            
        case 3:
            
            roleCharacter.text = "DOCTOR"
            roleAllegiance.text = "PRO-TOWN"
            roleImg.image = UIImage(named: doctorImg)
            roleDescription.text = "The DOCTOR is the healer of the party. Every round, he has a chance to protect the CITIZENS of his city. At night, the DOCTOR indicates to the MODERATOR one person whom he wants to protect. If the MAFIA chooses a victim and the victim is protected by the DOCTOR, the victim will survive the night. DOCTORS are allowed to target themselves."
            
        case 4:
            
            roleCharacter.text = "POLICE"
            roleAllegiance.text = "PRO-TOWN"
            roleImg.image = UIImage(named: policeImg)
            roleDescription.text = "The POLICE's duty is to investigate the criminals of his or her town. At night, the POLICE indicates to the MODERATOR who he wants to suspect. If the POLICE has correctly identitifed the MAFIA, the MODERATOR will notify the POLICE with a nod. I f the POLICE has NOT identified the MAFIA, the MODERATOR will notify the POLICE with a shake of the head. During the day, the POLICE will use the information gathered to sway the public opinion to hopefully kill the MAFIA."
            
        default:
            
            roleCharacter.text = "YOU"
            roleAllegiance.text = "FOUND"
            roleImg.image = UIImage(named: mafiaImg)
            roleDescription.text = "A bug. Congrats. Please let us know!!!"
            
        }
    }
}
