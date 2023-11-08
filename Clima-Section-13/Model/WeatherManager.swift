//
//  WeatherManager.swift
//  Clima-Section-13
//
//  Created by Abdurahman on 8.11.2023.
//

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=6494a3072a3cc7a17e0a98969f869ac9&units=metric"
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        print(urlString)
    }
}
