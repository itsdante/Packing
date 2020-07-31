//
//  WeatherModel.swift
//  Packing
//
//  Created by Andimas Bagaswara on 22/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

struct WeatherModel {
    let weatherList: [WeatherList]
}

struct WeatherList: Identifiable {
    var id: String {
        return String(dateTime)
    }
    let dateTime: Int
    let temperature: Double
    let conditionId: Int
    
    var dateTimeString: String {
        let date = Date(timeIntervalSince1970: Double(dateTime))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return String(localDate.split(separator: ",")[0])
    }
    
    var temperatureString: String {
        return String(format: "%.0f", temperature) + "°"
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
    var conditionColor: Int {
        switch conditionId {
        case 800:
            return 0xF9B710
        default:
            return 0x594E9F
        }
    }
}
