//
//  WeatherInformationTableViewController.swift
//  WeatherReportDemo
//
//  Created by Ashok Londhe on 01/11/17.
//  Copyright © 2017 Ashok Londhe. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherInformationTableViewController: UITableViewController, CLLocationManagerDelegate {

    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    let activityViewLayerCornerRadius = 05
    let activityViewBackgroundAlpha = 0.7
    let activityViewColorAlpha = 1.0
    let activityViewColorRed = 1.0
    let activityViewColorGreen = 1.0
    let activityViewColorBlue = 1.0

    // Weather forcast object
    var weather = WeatherForecastDataModel()
    var weatherReportArray = [WeatherForecastDataModel]()
    var locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var userLatitude:CLLocationDegrees! = 0
    var userLongitude:CLLocationDegrees! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather Forecast"
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        startLocation = nil
        applyStyleForActivityIndicator()
        showProgressLoader()
        let idArray = ["4163971","2147714","2174003"]
        for id in idArray {
            weather = WeatherForecastDataModel()
            weather.downloadData(locationID: id){ result in
                print(result)
                self.weatherReportArray.append(result)
                if self.weatherReportArray.count == idArray.count {
                    self.updateUI()
                    self.hideProgressLoader()
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherReportArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "weatherReportCell", for: indexPath) as? WeatherInfoTableViewCell
        if cell == nil {
            cell = (self.tableView.dequeueReusableCell(withIdentifier: "weatherReportCell", for: indexPath) as? WeatherInfoTableViewCell)!
        }
        
        let weather = weatherReportArray[indexPath.row]
        cell?.cityLabel.text = weather.location
        cell?.temperatureLabel.text = weather.temp
        // Configure the cell...
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weather = weatherReportArray[indexPath.row]
        performSegue(withIdentifier: "weatherDetailsSegue", sender: self)
    }

    func updateUI(){
        self.tableView.reloadData()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    private func locationManager(manager: CLLocationManager,
                                 didFailWithError error: Error) {
        print("==============\(error)")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weatherDetailsSegue" {
            let weatherDetailsViewController =  segue.destination as? WeatherDetailsViewController
            weatherDetailsViewController?.weather = weather
        }
    }
    
    func applyStyleForActivityIndicator() {
        
        activityView.layer.cornerRadius = CGFloat(activityViewLayerCornerRadius)
        activityView.center = CGPoint(x: self.view.frame.width / 2.0 , y: self.view.frame.size.height / 2.0)
        activityView.backgroundColor = UIColor(white: 0.0, alpha: CGFloat(activityViewBackgroundAlpha))
        activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        activityView.color = UIColor(red:CGFloat(activityViewColorRed),green:CGFloat(activityViewColorGreen),blue:CGFloat(activityViewColorBlue),alpha:CGFloat(activityViewColorAlpha))
        activityView.hidesWhenStopped = true
    }
    
    func showProgressLoader() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = false
            self.activityView.startAnimating()
            self.view.addSubview(self.activityView)
            
        }
    }
    
    func hideProgressLoader() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            self.activityView.stopAnimating()
            self.activityView.removeFromSuperview()
            
        }
    }

}
