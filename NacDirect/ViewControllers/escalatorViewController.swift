//
//  escalatorViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/20/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse

class escalatorViewController: UIViewController {

    var firsttotal = 0
    var secondtotal = 0
    var thirdtotal = 0
    var fourthtotal = 0
    var floorNumber:String!
    @IBOutlet weak var firstPic: UIView!
    @IBOutlet weak var secondPic: UIView!
    @IBOutlet weak var thirdPic: UIView!
    @IBOutlet weak var fourthPic: UIView!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        fetchPostData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        let upperFloor = String( Int(floorNumber)! + 1 )
        var lowerFloor = String( Int(floorNumber)! - 1 )
        
        if floorNumber == "1" {
            lowerFloor = "B"
        }
        
        firstLabel.text = floorNumber! + "-" + upperFloor
        secondLabel.text = floorNumber! + "-" + lowerFloor
        thirdLabel.text = floorNumber! + "-" + upperFloor
        fourthLabel.text = floorNumber! + "-" + lowerFloor
        
    }
    
    func fetchPostData() {
        let query = PFQuery(className: "Updates")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (posts, error) in
            if error == nil {
                for post in posts! {
                    if post["floor_number"] as? String == self.floorNumber! && post["side"] as? String == "East" && post["direction"] as? String == "Up" {
                        
                        self.firsttotal += 1 //need to work on this part
                    }
                    else if post["floor_number"] as? String == self.floorNumber! && post["side"] as? String == "East" && post["direction"] as? String == "Down" {
                        self.secondtotal += 1 //need to work on this part
                    }
                    else if post["floor_number"] as? String == self.floorNumber! && post["side"] as? String == "West" && post["direction"] as? String == "Up" {
                        self.thirdtotal += 1 //need to work on this part
                    }
                    else if post["floor_number"] as? String == self.floorNumber! && post["side"] as? String == "West" && post["direction"] as? String == "Down" {
                        self.fourthtotal += 1 //need to work on this part
                    }
                }
                
            }
            else {
                print(error)
            }
            setColors()
            
        }
        
        func setColors() {
            if firsttotal >= 3 {
                firstPic.backgroundColor = .red
            }
            if secondtotal >= 3 {
                secondPic.backgroundColor = .red
            }
            if thirdtotal >= 3 {
                thirdPic.backgroundColor = .red
            }
            if fourthtotal >= 3 {
                fourthPic.backgroundColor = .red
            }
        }
        
    }
    
}

