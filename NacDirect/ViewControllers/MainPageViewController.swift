//
//  MainPageViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/23/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNAC(_ sender: Any) {
        self.performSegue(withIdentifier: "homePageSegue", sender: nil)
    }
    
    @IBAction func onGrove(_ sender: Any) {
    }
    
    @IBAction func onMarshak(_ sender: Any) {
    }
    
}
