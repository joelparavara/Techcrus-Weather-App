//
//  ViewController.swift
//  Techcrus Weather App
//
//  Created by Joel Thomson on 5/9/20.
//  Copyright © 2020 Techcrus Labs. All rights reserved.
//

import UIKit

class ViewController: MainViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchField.delegate = self
        
    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        searchField.endEditing(true)
//
//        if let city = searchField.text {
//            weatherManager.fetchWeather(cityName: city)
//        }
//        searchField.text = ""
//        return true
//    }
//
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if textField.text != "" {
//            return true
//        } else {
//            textField.placeholder = "Search for a location"
//            return false
//        }
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if let city = searchField.text {
//            weatherManager.fetchWeather(cityName: city)
//            print(weatherManager.weatherURL)
//        }
//        searchField.text = ""
//    }
//    
    


}

