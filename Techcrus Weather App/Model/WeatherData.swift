//
//  WeatherData.swift
//  Techcrus Weather App
//
//  Created by Joel Thomson on 5/13/20.
//  Copyright © 2020 Techcrus Labs. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    let name : String
    let main : main
    let sys : sys
    let weather : [weather]
}

struct main : Codable{
    let temp : Double
}

struct sys : Codable{
    let country : String
}

struct weather : Codable{
    let description : String
    let id : Int
}
