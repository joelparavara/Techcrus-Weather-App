//
//  WeatherManager.swift
//  Techcrus Weather App
//
//  Created by Joel Thomson on 5/9/20.
//  Copyright © 2020 Techcrus Labs. All rights reserved.
//

import UIKit

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=69910cbab89ef6848b1b3c02663b8bb6&units=metric"
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URL Session
                let session = URLSession(configuration: .default)
            //3. Give the session a Task
                let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            //Start the task
                task.resume()
            }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
    
}
