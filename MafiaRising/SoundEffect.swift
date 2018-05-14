//
//  SoundEffect.swift
//  MafiaRising
//
//  Created by Joseph Yuen on 6/20/17.
//  Copyright © 2017 Joseph Yuen. All rights reserved.
//

import Foundation
import UIKit

class SoundEffect {
    
    private var _effect: String
    private var _picture: String
    
    var effect: String {
        get {
            return _effect
        }
    }
    
    var picture: String {
        get {
            return _picture
        }
    }
    
    init(effect: String, picture: String) {
        self._effect = effect
        self._picture = picture
    }
}
