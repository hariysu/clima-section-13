//
//  WeatherModel.swift
//  Clima-Section-13
//
//  Created by Abdurahman on 17.11.2023.
//

import Foundation

struct WeatherModel {
    let conditionId: Int //stored properties
    let cityName: String
    let temperature: Double
    
    //computed property
    var temperatureString: String {
        return  String(format: "%.1f", temperature)
    }
    
    //computed property
    var conditionName: String {
        switch conditionId {
        case 200...232:         //... range operator
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...532:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...788:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
    // basic example on computed property
//    var aProperty: Int {
//        return 3 + 5
//    }
    
//    func getConditionName(weatherId: Int) -> String{
//        switch weatherId {
//        case 200...232:         //... range operator
//            return "cloud.bolt"
//        case 300...321:
//            return "cloud.drizzle"
//        case 500...532:
//            return "cloud.rain"
//        case 600...622:
//            return "cloud.snow"
//        case 701...788:
//            return "cloud.fog"
//        case 800:
//            return "sun.max"
//        case 801...804:
//            return "cloud.bolt"
//        default:
//            return "cloud"
//        }
//    }
    
}
