//
//  Coordinate.swift
//  Clima
//
//  Created by Nguyen Huy Tran on 6/19/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class Coordinate: Codable {
    let lon: Float
    let lat: Float
    
    init(lon: Float, lat: Float) {
        self.lon = lon
        self.lat = lat
    }
}
