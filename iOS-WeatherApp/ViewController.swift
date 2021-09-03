//
//  ViewController.swift
//  iOS-WeatherApp
//
//  Created by Manuel Carvalho on 31/8/21.
//

import UIKit

class ViewController: UIViewController, WeatherDataManagerDelegate {
    func didUpdateWeather(prices: [String : Double]) {
        <#code#>
    }
    
    
    var dataManager = WeatherDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.fetchWeatherData()
    }


}

