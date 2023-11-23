//
//  ViewController.swift
//  Clima-Section-13
//
//  Created by Abdurahman on 12.10.2023.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                locationManager.stopUpdatingLocation()
                let lat = location.coordinate.latitude
                let lon = location.coordinate.longitude
                print(lat)
                print(lon)
                weatherManager.fetchWeather(latitude: lat, longitude:lon)
            }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to get users location.")
    }
}

// MARK: - UITextFieldDelegate

extension WeatherViewController:UITextFieldDelegate{
    
    @IBAction func searchPressed(_ sender: UIButton) {
        // Dismisses the keyboard
        searchTextField.endEditing(true)
    }
    
    // to handle what should happen when the user presses the "Return" or "Done" key on the keyboard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //print(textField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    // to perform validation and checks on the text entered by the user before allowing the text field to resign its first responder status
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    // to perform actions or tasks after the user has finished editing the text in the UITextField
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        textField.text = ""
        
    }
}


//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate{
    // by convention we always have in a delegate method is the identity of the object that caused this delegate method
    // All methods take the delegate’s source object as the first argument.     https://google.github.io/swift/
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        // We have to call the main thread to update our user interface in the background (via DispatchQueue)
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error){
        print(error)
    }
}

