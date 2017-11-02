//
//  WeatherInfoTableViewCell.swift
//  WeatherReportDemo
//
//  Created by Ashok Londhe on 01/11/17.
//  Copyright © 2017 Ashok Londhe. All rights reserved.
//

import UIKit

class WeatherInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
