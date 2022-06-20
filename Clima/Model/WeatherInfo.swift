//
//  WeatherInfo.swift
//  Clima
//
//  Created by Nguyen Huy Tran on 6/19/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class WeatherInfo: Codable {
    let coord: Coordinate
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Cloud
    let dt: Int
    let sys: System
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
    init(   coord: Coordinate,
            weather: [Weather],
            base: String,
            main: Main,
            visibility: Int,
            wind: Wind,
            clouds: Cloud,
            dt: Int,
            sys: System,
            timezone: Int,
            id: Int,
            name: String,
            cod: Int)
    {
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.timezone = timezone
        self.id = id
        self.name = name
        self.cod = cod
    }
}
