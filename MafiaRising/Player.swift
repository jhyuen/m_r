//
//  Player.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 6/17/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import Foundation
import UIKit
class Player: NSObject, NSCoding {
    
    private var _pictureView: UIImageView = UIImageView(image: UIImage(named: "m"))
    private var _isDead: Bool = false
    private var _isProtected: Bool = false
    private var _isTargeted: Bool = false
    private var _isEnabled: Bool = true
    private var _role:String = "Citizen"

    
    var pictureView: UIImageView {
        get {
            return _pictureView
        }
    }
    
    var picture: UIImage {
        get {
            return _pictureView.image!
        }
    }
    
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
    
    var isEnabled: Bool {
        get {
            return _isEnabled
        }
    }
    
    var role: String {
        get {
            return _role
        }
    }
    
    // Initializers
    
    // default initializer
    override init() {
        
    }
    
    init(picture: UIImage, role: String) {
        self._pictureView.image = picture
        self._role = role
    }
    
    init(pictureView: UIImageView, isDead: Bool, isProtected: Bool, isTargeted: Bool, isEnabled:Bool, role: String) {
        self._pictureView = pictureView
        self._isDead = isDead
        self._isProtected = isProtected
        self._isTargeted = isTargeted
        self._isEnabled = isEnabled
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
    
    func revive() {
        _isDead = false
        self._pictureView.layer.borderWidth = 0
    }
    
    func murder() {
        _isDead = true
        _isTargeted = false
        self._pictureView.layer.borderColor = UIColor.red.withAlphaComponent(0.75).cgColor
        self._pictureView.layer.borderWidth = 100
    }
    
    func disablePlayer() {
        self._pictureView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        self._pictureView.layer.borderWidth = 100
        self._isEnabled = false
    }
    
    func enablePlayer() {
        if self.isDead {
            self._pictureView.layer.borderColor = UIColor.red.withAlphaComponent(0.5).cgColor
            self._pictureView.layer.borderWidth = 100
        } else {
            self._pictureView.layer.borderColor = UIColor.black.withAlphaComponent(1).cgColor
            self._pictureView.layer.borderWidth = 2
        }
        self._isEnabled = true
    }
    
    // NSCoding
    required convenience init?(coder decoder: NSCoder) {
        guard let pictureView = decoder.decodeObject(forKey: "pictureView") as? UIImageView,
//            let isDead = decoder.decodeObject(forKey: "isDead") as? Bool,
//            let isProtected = decoder.decodeObject(forKey: "isProtected") as? Bool,
//            let isTargeted = decoder.decodeObject(forKey: "isTargeted") as? Bool,
//            let isEnabled = decoder.decodeObject(forKey: "isEnabled") as? Bool,
            let role = decoder.decodeObject(forKey: "role") as? String
            else { return nil }
        
        self.init(
            pictureView: pictureView,
            isDead: decoder.decodeBool(forKey: "isDead"),
            isProtected: decoder.decodeBool(forKey: "isProtected"),
            isTargeted: decoder.decodeBool(forKey: "isTargeted"),
            isEnabled: decoder.decodeBool(forKey: "isEnabled"),
            role: role
        )
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self._pictureView, forKey: "pictureView")
        coder.encode(self._isDead, forKey: "isDead")
        coder.encode(self._isProtected, forKey: "isProtected")
        coder.encode(self._isTargeted, forKey: "isTargeted")
        coder.encode(self._isEnabled, forKey: "isEnabled")
        coder.encode(self._role, forKey: "role")
    }
}
