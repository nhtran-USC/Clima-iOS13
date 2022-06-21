//
//  WeatherInfoService.swift
//  Clima
//
//  Created by Nguyen Huy Tran on 6/20/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class WeatherInfoService {
    static let share = WeatherInfoService()
    var weatherInfo:WeatherInfo?
    
    private init() {
        
    }
    
    func getWeatherIconUrl() -> URL?{
        if let weatherInfo = weatherInfo {
            return URL(string: "https://openweathermap.org/img/w/\(weatherInfo.weather[0].icon).png")
        }
        return nil
    }

    func getTemperature() -> Int?{
        if let weatherInfo = weatherInfo {
            return Int(weatherInfo.main.temp)
        }
        return nil
    }

    func getCityName() -> String? {
        if let weatherInfo = weatherInfo {
            return weatherInfo.name
        }
        return nil
    }
}
