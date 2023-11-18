//
//  WeatherManager.swift
//  Clima-Section-13
//
//  Created by Abdurahman on 8.11.2023.
//

import Foundation

let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //  1. Create a Url:
        if let url = URL(string: urlString) {
            // 2. Create a URLSession:
            let session = URLSession(configuration: .default)
            // 3. Give the session a task:
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    //let dataString = String(data: safeData, encoding: .utf8)
                    if let weather = self.parseJSON(weatherData: safeData){
//                        let weatherVC = WeatherViewController()
//                        weatherVC.didUpdateWeather(weather: weather)
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            // 4. Start the task:
            task.resume()
        }
    }
    
    func parseJSON (weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            //print(weather.getConditionName(weatherId: id))
            //print(weather.conditionName)
            print(weather.temperatureString)
            return weather
        }catch{
            print(error)
            return nil
        }
        
    }
}
