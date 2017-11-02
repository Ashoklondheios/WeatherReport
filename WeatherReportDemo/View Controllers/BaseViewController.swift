//
//  BaseViewController.swift
//  WeatherReportDemo
//
//  Created by Ashok Londhe on 03/11/17.
//  Copyright © 2017 Ashok Londhe. All rights reserved.
//

import UIKit




class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func addNavigationBackButton() {
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        let backButtonImage = UIImage(named: "backButton")
        let customBarButton = UIBarButtonItem(image: backButtonImage,
                                              style: .plain,
                                              target: self,
                                              action: #selector(BaseViewController.goToParentViewController))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        navigationItem.setLeftBarButton(customBarButton, animated: true)
    }

    
    func goToParentViewController() {
        _ = self.navigationController?.popViewController(animated: true)
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
