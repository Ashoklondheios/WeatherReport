//
//  WeatherDetailsViewController.swift
//  WeatherReportDemo
//
//  Created by Ashok Londhe on 03/11/17.
//  Copyright © 2017 Ashok Londhe. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: BaseViewController {

    
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var tempDescriptionLabel: UILabel!
    
    @IBOutlet weak var tempatureLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var precipitationLabel: UILabel!
    
    var weather = WeatherForecastDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindData()
        addNavigationBackButton()
        self.title = "Weather Details"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindData() {
        cityNameLabel.text = weather.location
        tempDescriptionLabel.text = weather.weatherDescription
        dateLabel.text = weather.date
        tempatureLabel.text = weather.temp
        humidityLabel.text = weather.humidity
        windSpeedLabel.text = weather.wind
        precipitationLabel.text = weather.perception
        minTempLabel.text = weather.minTemp
        maxTempLabel.text = weather.maxTemp
        weatherImageView.image = UIImage(named: weather.weatherImageName)
        let weatherUrl = "http://openweathermap.org/img/w/\(weather.weatherImageName).png"
        
        let url = URL(string: weatherUrl)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            weatherImageView.image = UIImage(data: imageData)
            //            let image = UIImage(data: data!)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
