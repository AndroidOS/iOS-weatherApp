//
//  ViewController.swift
//  iOS-WeatherApp
//
//  Created by Manuel Carvalho on 31/8/21.
//

import UIKit

class ViewController: UIViewController, WeatherDataManagerDelegate {
    func didUpdateWeather(icon: String) {
        
        let url = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        print(url)
    }
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var dataManager = WeatherDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.fetchWeatherData()
    }


}

