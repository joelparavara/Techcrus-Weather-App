//
//  ViewController.swift
//  Techcrus Weather App
//
//  Created by Joel Thomson on 5/9/20.
//  Copyright © 2020 Techcrus Labs. All rights reserved.
//

import UIKit

class ViewController: MainViewController, WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager ,weather: WeatherModel) {
        temp = weather.temperatureString
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        //searchField.delegate = self
        
    }
    


}

