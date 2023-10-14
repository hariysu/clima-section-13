//
//  ViewController.swift
//  Clima-Section-13
//
//  Created by Abdurahman on 12.10.2023.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
    }
    
    // to handle what should happen when the user presses the "Return" or "Done" key on the keyboard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text!)
        print("sample0")
        searchTextField.endEditing(true)
        return true
    }
    
    // to perform validation and checks on the text entered by the user before allowing the text field to resign its first responder status
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            print("sample1")
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    // to perform actions or tasks after the user has finished editing the text in the UITextField
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Use searchTextField.text to get the weather for that city
        textField.text = ""
        print("sample2")
    }
    
    
    
}

