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
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=" + key
   
    var delegate: WeatherDataManagerDelegate?
    
    func fetchWeatherData(){
       print(weatherURL)
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
                    print(safeData.base64EncodedString())
                    //self.parseJSON(weatherData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data){
        
        do {
            if let json = try JSONSerialization.jsonObject(with: weatherData, options: []) as? [String: Any] {
                // try to read out a string array
                if let values = json["bpi"] as? [String: Double] {
                    
                    self.delegate?.didUpdateWeather(prices: values)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }
    
    
}

