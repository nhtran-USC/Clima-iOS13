//
//  Main.swift
//  Clima
//
//  Created by Nguyen Huy Tran on 6/19/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class Main: Codable {
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Int
    let humidity: Int
    
    init( temp: Float,
          feels_like: Float,
          temp_min: Float,
          temp_max: Float,
          pressure: Int,
          humidity: Int) {
        
        self.temp = temp
        self.feels_like = feels_like
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.pressure = pressure
        self.humidity = humidity
    }
}
