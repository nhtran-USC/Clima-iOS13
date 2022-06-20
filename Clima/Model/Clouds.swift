//
//  Clouds.swift
//  Clima
//
//  Created by Nguyen Huy Tran on 6/19/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class Cloud: Codable {
    let all: Int
    init(all: Int) {
        self.all = all
    }
}
