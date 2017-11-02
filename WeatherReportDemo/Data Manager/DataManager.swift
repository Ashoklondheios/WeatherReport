//
//  DataManager.swift
//  WeatherReportDemo
//
//  Created by Ashok Londhe on 01/11/17.
//  Copyright © 2017 Ashok Londhe. All rights reserved.
//

import Foundation
import SwiftyJSON


class DataManager {
    
    // MARK: Created Shared instance of DataManager class
    class func sharedInstance() -> DataManager {
        struct Static {
            static let sharedInstance = DataManager()
        }
        return Static.sharedInstance
    }
    
    
    // Get list of countries for currency converter api
    
    func getCurrencyConversion(amount: String, from: String, to: String, closure: @escaping (Result<JSON,Error>) -> Void)  {
        var parameters = [String:String]()
        parameters = ["from":"USD", "to":"INR", "amount":"1"]
        let url = "id" + "&from=\(from)&to=\(to)&amount=\(amount)"
        
        
        ServerManager.sharedInstance().getRequest(postData: nil, apiName: url, extraHeader: nil) { (result) in
            switch result {
            case .success(let response):
                closure(.success(response))
                
            case .failure(let error):
                closure(.failure(error))
            }

        }
    }
    
    
    
}


