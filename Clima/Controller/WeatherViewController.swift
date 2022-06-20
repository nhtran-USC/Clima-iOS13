//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    let locManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        cityTextField.delegate = self
        
        // ask for location authorization
        locManager.requestWhenInUseAuthorization()
        
    }
    
    @IBAction func locationButtonDidTap(_ sender: Any) {
        // end editting and turn off keyboard
        cityTextField.text = nil
        view.endEditing(true)
        var currentLocation: CLLocation!
        if
           CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            currentLocation = locManager.location
            let long = currentLocation.coordinate.longitude
            let lat = currentLocation.coordinate.latitude
            let BASE_URL = "https://api.openweathermap.org/"
            let ACCESS_KEY = "c971dcfa039a769ffb82756277095d03"
            if let url = URL(string: "\(BASE_URL)data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(ACCESS_KEY)") {
                    let task = URLSession.shared.dataTask(with: url) { data, response, error in
                        if let error = error {
                            fatalError(error.localizedDescription)
                        }
                        guard let httpResponse = response as? HTTPURLResponse,
                            (200...299).contains(httpResponse.statusCode) else {
//                            self.handleServerError(response)
                                // how to pass error in this case
                            return
                        }
                        if let data = data {
//                            let string = String(data: data, encoding: .utf8)
                            let decoder = JSONDecoder()
                            let weatherInfo = try! decoder.decode(WeatherInfo.self, from: data)
                            self.temperatureLabel.text = String(weatherInfo.main.temp)
                        }
                        else  {
                            fatalError("no data")
                        }
                }
                task.resume()
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
        if let cityName = cityTextField.text{
            if(!cityName.isEmpty) {
                print(cityName)
            }
        }
    }
    
    @IBAction func searchButtonDidTap(_ sender: UIButton) {
        view.endEditing(true)
    }
}

