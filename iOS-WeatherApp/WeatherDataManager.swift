//
//  WeatherDataManager.swift
//  iOS-WeatherApp
//
//  Created by Manuel Carvalho on 1/9/21.
//

import Foundation


protocol  WeatherDataManagerDelegate {
    func didUpdateWeather(prices: [String: Double])
}

struct WeatherDataManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=Sydney,au&APPID=" + key
   
    var delegate: WeatherDataManagerDelegate?
    
    func fetchWeatherData(){
       //print(weatherURL)
        performRequest(urlString: weatherURL)
    }
    
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let str = String(decoding:safeData, as: UTF8.self)
                    print(str)
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data){
        
        do {
            if let json = try JSONSerialization.jsonObject(with: weatherData, options: []) as? [String: Any] {
                // try to read out a string array
                //print(json)
                if let values = json["coord"] as? [String: Any] {
                    print(values)
                    //self.delegate?.didUpdateWeather(prices: values)
                }
                
                if let icon = json["weather"] as? [Any] {
                    print(icon)
                    
                
                    if let main = json["sys"] as? [Any] {
                        print(main)
                    }
                        
                    //self.delegate?.didUpdateWeather(prices: values)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }
    
    
}

