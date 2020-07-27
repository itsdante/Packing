//
//  NetworkManager.swift
//  Packing
//
//  Created by Andimas Bagaswara on 22/07/20.
//  Copyright © 2020 Packing. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var weathers = [WeatherList]()
    
    let weatherUrl = "https://api.openweathermap.org/data/2.5/forecast?appid=86f431f8abc8b2f04d2b698f8327624b&units=metric"
    
    func fetchData(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                guard let safeData = data, let weather = self.parseJSON(safeData) else { return }
                DispatchQueue.main.async {
                    self.weathers = weather.weatherList
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        var weatherList: [WeatherList] = []
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            var tempDate: String = ""
            for weather in decodedData.list {
                let currDate: String = String(weather.dt_txt.split(separator: " ")[0])
                if tempDate == currDate {
                    continue
                }
                tempDate = currDate
                let dt = weather.dt
                let temp = weather.main.temp
                let id = weather.weather[0].id
                weatherList.append(WeatherList(dateTime: dt, temperature: temp, conditionId: id))
            }
            return WeatherModel(weatherList: weatherList)
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}
