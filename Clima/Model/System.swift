//
//  System.swift
//  Clima
//
//  Created by Nguyen Huy Tran on 6/19/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class System: Codable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
    
    init(type:Int, id:Int, country: String, sunrise: Int, sunset: Int) {
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
