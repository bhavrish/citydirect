//
//  updateViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/19/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse

class updateViewController: UIViewController {

    @IBOutlet weak var brokenSegControl: UISegmentedControl!
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
        var floornumber = floorField.text
        let brokenObects = ["Escalator","Bathroom"]
        let sides = ["East","West"]
        let obj = brokenObects[brokenSegControl.selectedSegmentIndex]
        let side = brokenObects[sideSegControl.selectedSegmentIndex]
        
        var updates = PFObject(className: "Updates")
        updates["floor_number"] = floornumber
        updates["uploader"] = PFUser.current()
        updates["object"] = obj
        updates["side"] = side
        updates.saveInBackground(block: {(success: Bool, error: Error?) -> Void in
            if error == nil {
                    print("data uploaded")
                    self.postUploadingLabel.text = "Post Uploaded"
            }
            else {
                    print(error)
            }
        })
    }
    
}
