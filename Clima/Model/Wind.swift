//
//  Wind.swift
//  Clima
//
//  Created by Nguyen Huy Tran on 6/19/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class Wind:Codable {
    let speed: Float
    let deg: Int
    
    init(speed: Float, deg: Int) {
        self.speed = speed
        self.deg = deg
    }
}
