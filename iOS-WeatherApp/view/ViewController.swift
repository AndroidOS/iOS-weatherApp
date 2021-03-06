//
//  ViewController.swift
//  iOS-WeatherApp
//
//  Created by Manuel Carvalho on 31/8/21.
//

import UIKit

class ViewController: UIViewController, WeatherDataManagerDelegate {
    
    
    @IBOutlet weak var txtBaram: UITextField!
    @IBOutlet weak var txtTemp: UITextField!
    
    @IBOutlet weak var txtWind: UITextField!
    
    func didUpdateWeather(icon: String, temp: Double, bara: Int, wind: Int) {
        print(temp)
        let url = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        print(url)
        let temp1 = round(temp)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: url)!) {
                       if let image = UIImage(data: data) {
                           DispatchQueue.main.async {
                            //self?.imageView.se = image
                            self!.imageView.image = image
                            self?.txtTemp.text = " \(temp1) Degrees Celcius"
                            self?.txtBaram.text = "\(bara) Baramoteric Pressure"
                            self?.txtWind.text = "Wind Degrees \(wind)"
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

