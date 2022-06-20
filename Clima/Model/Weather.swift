//
//  Weather.swift
//  Clima
//
//  Created by Nguyen Huy Tran on 6/19/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    init(id:Int, main: String, description: String, icon: String) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}
