//
//  Player.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 6/17/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import Foundation
import UIKit
class Player {
    
    // private var _picture:UIImage
    private var _isDead: Bool = false
    private var _isProtected: Bool = false
    private var _isTargeted: Bool = false
    private var _role:String = "Citizen"
    
    /*
     var picture: UIImage {
     get {
     return _picture
     }
     }
     */
    
    var isDead: Bool {
        get {
            return _isDead
        }
    }
    
    var isProtected: Bool {
        get {
            return _isProtected
        }
    }
    
    var isTargeted: Bool {
        get {
            return _isTargeted
        }
    }
    
    var role: String {
        get {
            return _role
        }
    }
    
    // Initializers
    
    // default initializer
    init() {
        
    }
    
    // add in _picture to initializer
    init(role: String) {
        self._role = role
    }
    
    // Functions
    
    // Mafia Action
    func attemptMurder() {
        _isTargeted = true
    }
    
    // Doctor Action
    func protect() {
        _isProtected = true
    }
    
    // End Results
    
    func save() {
        _isTargeted = false
        _isProtected = false
    }
    
    func murder() {
        _isDead = true
        _isTargeted = false
    }
    
}
