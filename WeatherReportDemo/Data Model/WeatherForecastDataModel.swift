//
//  WeatherForecastDataModel.swift
//  WeatherReportDemo
//
//  Created by Ashok Londhe on 03/11/17.
//  Copyright © 2017 Ashok Londhe. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class WeatherForecastDataModel {
    
    private var _date: Double?
    private var _temp: String?
    private var _minTemp: String?
    private var _maxTemp: String?
    private var _location: String?
    private var _weather: String?
    private var _humidity: String?
    private var _wind: String?
    private var _perception: String?
    private var _weatherImageName: String?
    typealias JSONStandard = Dictionary<String, AnyObject>

    let appId = "341d265ca5b9129f96a52e9317c6a577"
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let date = Date(timeIntervalSince1970: _date!)
        return (_date != nil) ? "Today, \(dateFormatter.string(from: date))" : "Date Invalid"
    }
    
    var weatherImageName: String {
        return _weatherImageName ?? "image not present"
    }
    
    var temp: String {
        return _temp ?? "0 °C"
    }
    
    var minTemp: String {
        return _minTemp ?? "0 °C"
    }

    var maxTemp: String {
        return _maxTemp ?? "0 °C"
    }

    
    var location: String {
        return _location ?? "Location Invalid"
    }
    
    var weatherDescription: String {
        return _weather ?? "Weather Invalid"
    }
    
    var humidity: String {
        return _humidity ?? "humidity Invalid"
    }
    
    var wind: String {
        return _wind ?? "Wind Invalid"
    }
    
    var perception: String {
        return _perception ?? "perception Invalid"
    }
    
    
    func downloadData(locationID: String, completed: @escaping (WeatherForecastDataModel)-> ()) {
        
        let path = "http://api.openweathermap.org/data/2.5/weather?id=\(locationID)&units=metric&APPID=\(appId)"
        print(path)
        
        let url = URL(string: path)
        
        Alamofire.request(url!).responseJSON(completionHandler: {
            response in
            let result = response.result
            print(response)
            if let dict = result.value as? JSONStandard, let main = dict["main"] as? JSONStandard, let temp = main["temp"] as? Double, let minTemp = main["temp_min"] as? Double , let maxTemp = main["temp_max"] as? Double, let weatherArray = dict["weather"] as? [JSONStandard], let weather = weatherArray[0]["main"] as? String, let name = dict["name"] as? String, let sys = dict["sys"] as? JSONStandard, let country = sys["country"] as? String, let dt = dict["dt"] as? Double, let humidity = main["humidity"] as? Double, let clouds = dict["clouds"] as? JSONStandard, let perception = clouds["all"] as? Double, let wind = dict["wind"] as? JSONStandard, let windSpeed = wind["speed"] as? Double, let weatherImage = weatherArray[0]["icon"] as? String {
                
                self._temp = String(format: "%.0f °C", temp)
                self._minTemp = String(format: "%.0f °C", minTemp)
                self._maxTemp = String(format: "%.0f °C", maxTemp)
                self._weather = weather
                self._location = "\(name), \(country)"
                self._date = dt
                self._humidity = "\(humidity)%"
                self._weatherImageName = weatherImage
                self._wind = "\(windSpeed) km/hr"
                self._perception = "\(perception) cm"

            }
            completed( self)
        })
    }
    
}

