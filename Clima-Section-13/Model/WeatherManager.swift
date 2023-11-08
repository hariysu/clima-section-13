//
//  WeatherManager.swift
//  Clima-Section-13
//
//  Created by Abdurahman on 8.11.2023.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=\(Bundle.main.infoDictionary?["API_KEY"] as? String ?? "")&units=metric"
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        print(urlString)
    }
}
