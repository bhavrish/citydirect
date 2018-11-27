//
//  marshakElevatorViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/24/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse

class marshakElevatorViewController: UIViewController {

    var firsttotal = 0
    var secondtotal = 0
    var thirdtotal = 0
    var fourthtotal = 0
    var fifthtotal = 0
    var sixthtotal = 0
    var floorNumber:String!
    @IBOutlet weak var firstPic: UIView!
    @IBOutlet weak var secondPic: UIView!
    @IBOutlet weak var thirdPic: UIView!
    @IBOutlet weak var fourthPic: UIView!
    @IBOutlet weak var fifthPic: UIView!
    @IBOutlet weak var sixthPic: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPostData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchPostData() {
        let query = PFQuery(className: "Updates")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (posts, error) in
            if error == nil {
                for post in posts! {
                    if post["building"] as? String == "marshak" && post["elevator_number"] as? String == "1" {
                        self.firsttotal += 1
                    }
                    else if post["building"] as? String == "marshak" && post["elevator_number"] as? String == "2" {
                        self.secondtotal += 1
                    }
                    else if post["building"] as? String == "marshak" && post["elevator_number"] as? String == "3" {
                        self.thirdtotal += 1
                    }
                    else if post["building"] as? String == "marshak" && post["elevator_number"] as? String == "4" {
                        self.fourthtotal += 1
                    }
                    else if post["building"] as? String == "marshak" && post["elevator_number"] as? String == "5" {
                        self.fifthtotal += 1
                    }
                    else if post["building"] as? String == "marshak" && post["elevator_number"] as? String == "6" {
                        self.sixthtotal += 1
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
            if fifthtotal >= 3 {
                fifthPic.backgroundColor = .red
            }
            if sixthtotal >= 3 {
                sixthPic.backgroundColor = .red
            }
        }
        
    }

}
