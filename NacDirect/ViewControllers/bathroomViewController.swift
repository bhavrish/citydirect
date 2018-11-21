//
//  bathroomViewController.swift
//  
//
//  Created by Bhavesh Shah on 11/20/18.
//

import UIKit
import Parse

class bathroomViewController: UIViewController {

    var firsttotal = 0
    var secondtotal = 0
    var thirdtotal = 0
    var fourthtotal = 0
    @IBOutlet weak var firstPic: UIView!
    @IBOutlet weak var secondPic: UIView!
    @IBOutlet weak var thirdPic: UIView!
    @IBOutlet weak var fourthPic: UIView!
    
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
                    if post["floor_number"] as? Int == 5 && post["side"] as? String == "East" && post["gender"] as? String == "Male" {
                        self.firsttotal += 1 //need to work on this part
                    }
                    if post["floor_number"] as? Int == 5 && post["side"] as? String == "West" && post["gender"] as? String == "Female" {
                        self.secondtotal += 1 //need to work on this part
                    }
                    if post["floor_number"] as? Int == 5 && post["side"] as? String == "East" && post["gender"] as? String == "Male" {
                        self.thirdtotal += 1 //need to work on this part
                    }
                    if post["floor_number"] as? Int == 5 as? Int && post["side"] as? String == "West" && post["gender"] as? String == "Female" {
                        self.fourthtotal += 1 //need to work on this part
                    }
                }
                
            }
            else {
                print(error)
            }
        }
        
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
