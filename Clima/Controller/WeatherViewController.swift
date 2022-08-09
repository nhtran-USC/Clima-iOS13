//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Kingfisher

class WeatherViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var usingMapButton: UIButton!
    
    let locManager = CLLocationManager()
    let BASE_URL = "https://api.openweathermap.org/"
    let ACCESS_KEY = "c971dcfa039a769ffb82756277095d03"
    let unit = "metric"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        cityTextField.delegate = self
        
        // ask for location authorization
        locManager.requestWhenInUseAuthorization()
        
        // using map button init
        usingMapButton.layer.cornerRadius = usingMapButton.frame.height / 2
    }
    
    @IBAction func locationButtonDidTap(_ sender: Any) {
        // end editting and turn off keyboard
//        cityTextField.text = nil
//        view.endEditing(true)
        
        var currentLocation: CLLocation!
        if
           CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            currentLocation = locManager.location
            let long = currentLocation.coordinate.longitude
            let lat = currentLocation.coordinate.latitude
            updateWeatherInfo(long: long, lat: lat)
        }
    }
    
    func updateWeatherInfo(cityName: String) {
        if let url = URL(string: "\(BASE_URL)data/2.5/weather?q=\(cityName)&appid=\(ACCESS_KEY)&units=\(unit)") {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        fatalError(error.localizedDescription)
                    }
                    
                    if let data = data {
                        self.dataToView(data: data)
                    }
                    else  {
                        fatalError("no data")
                    }
            }
            task.resume()
        }
    }
    
    func updateWeatherInfo(long:CLLocationDegrees, lat:CLLocationDegrees) {
        if let url = URL(string: "\(BASE_URL)data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(ACCESS_KEY)&units=\(unit)") {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        fatalError(error.localizedDescription)
                    }
                    
                    
                    if let data = data {
                        self.dataToView(data: data)
                    }
                    else  {
                        fatalError("no data")
                    }
            }
            task.resume()
        }
    }
    
    func dataToView(data: Data) {
        let decoder = JSONDecoder()
        do{
            try WeatherInfoService.share.weatherInfo = decoder.decode(WeatherInfo.self, from: data)
            DispatchQueue.main.async { [self] in
                self.temperatureLabel.text = String(WeatherInfoService.share.getTemperature()!)
                let imgUrl = WeatherInfoService.share.getWeatherIconUrl()!
                self.conditionImageView.kf.setImage(with: imgUrl)
                self.cityLabel.text = WeatherInfoService.share.getCityName()!
            }
        }
        catch {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Location Not Found", message: "Please try again.", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }

    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
    @IBAction func CityTextfieldDidEnd(_ sender: UITextField) {
        if let cityName = cityTextField.text, cityName != ""{
            updateWeatherInfo(cityName: cityName)
        }
    }
    
    @IBAction func searchButtonDidTap(_ sender: UIButton) {
        view.endEditing(true)
    }
}

