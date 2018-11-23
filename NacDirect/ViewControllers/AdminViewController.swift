//
//  AdminViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/20/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse

class AdminViewController: UIViewController {

    @IBOutlet weak var fixedSegControl: UISegmentedControl!
    @IBOutlet weak var floorField: UITextField!
    @IBOutlet weak var sideSegControl: UISegmentedControl!
    @IBOutlet weak var postUploadingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateOnTap(_ sender: Any) {
        var floorstring = floorField.text
        let floornumber = Int(floorstring!)
        let fixedObects = ["Escalator","Bathroom"]
        let sides = ["East","West"]
        let obj = fixedObects[fixedSegControl.selectedSegmentIndex]
        let side = sides[sideSegControl.selectedSegmentIndex]
        let query = PFQuery(className: "Updates")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (posts, error) in
            if error == nil {
                for post in posts! {
                    if post["floor_number"] as? Int == floornumber && post["side"] as? String == side && post["gender"] as? String == "Male" {
                        post.deleteInBackground()
                    }
                }
                self.postUploadingLabel.text = "Post Uploaded"
            }
            else {
                print(error)
            }
        }
    }

}
