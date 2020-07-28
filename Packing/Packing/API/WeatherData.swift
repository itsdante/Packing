//
//  WeatherData.swift
//  Packing
//
//  Created by Andimas Bagaswara on 22/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let list: [ListWeather]
}

struct ListWeather: Decodable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let dt_txt: String
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
