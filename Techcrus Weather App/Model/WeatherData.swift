//
//  WeatherData.swift
//  Techcrus Weather App
//
//  Created by Joel Thomson on 5/13/20.
//  Copyright © 2020 Techcrus Labs. All rights reserved.
//

import Foundation

struct WeatherData : Decodable {
    let name : String
    let main : main
    let sys : sys
    let weather : [weather]
}

struct main : Decodable{
    let temp : Double
}

struct sys : Decodable{
    let country : String
}

struct weather : Decodable{
    let description : String
    let id : Int
}
