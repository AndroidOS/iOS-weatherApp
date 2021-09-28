//
//  ViewController.swift
//  iOS-WeatherApp
//
//  Created by Manuel Carvalho on 31/8/21.
//

import UIKit

class ViewController: UIViewController, WeatherDataManagerDelegate {
    
    
    @IBOutlet weak var txtTemp: UITextField!
    
    func didUpdateWeather(icon: String, temp: Double) {
        print(temp)
        let url = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        print(url)
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: url)!) {
                       if let image = UIImage(data: data) {
                           DispatchQueue.main.async {
                            //self?.imageView.se = image
                            self!.imageView.image = image
                           }
                       }
                   }
               }
    }
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var dataManager = WeatherDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.fetchWeatherData()
    }


}

