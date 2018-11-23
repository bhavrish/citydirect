//
//  AdminViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/20/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class AdminViewController: UIViewController {

    @IBOutlet weak var fixedSegControl: UISegmentedControl!
    @IBOutlet weak var floorField: UITextField!
    @IBOutlet weak var sideSegControl: UISegmentedControl!
    @IBOutlet weak var updateButtonFrame: UIView!
    @IBOutlet weak var buildingSegControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set update button properties
        updateButtonFrame.layer.cornerRadius = 8.0
        updateButtonFrame.clipsToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func updateOnTap(_ sender: Any) {
        // adds status update indicator
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .indeterminate
        
        // gathers information about current update
        var floorstring = floorField.text
        let floornumber = Int(floorstring!)
        let fixedObects = ["Escalator","Bathroom"]
        let sides = ["East","West"]
        let buildings = ["NAC", "Grove", "Marshak"]
        let obj = fixedObects[fixedSegControl.selectedSegmentIndex]
        let side = sides[sideSegControl.selectedSegmentIndex]
        let build = buildings[buildingSegControl.selectedSegmentIndex]
        let query = PFQuery(className: "Updates")
        query.order(byDescending: "createdAt")
        
        // run update code in background thread
        DispatchQueue.global(qos: .background).async {
            // deletes user-uploaded posts that match current update (resetting status to default)
            query.findObjectsInBackground { (posts, error) in
                if error == nil {
                    for post in posts! {
                        if post["building"] as? String == build && post["floor_number"] as? Int == floornumber && post["side"] as? String == side && post["gender"] as? String == "Male" {
                            post.deleteInBackground()
                        }
                    }
                }
                else {
                    print(error)
                }
            }
            DispatchQueue.main.async {
                sleep(1)
        
                // show completion indicator
                hud.mode = .customView
                hud.label.text = "Updated"
                hud.customView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
                hud.hide(animated:true, afterDelay: 1)
            }
        }
    }
}
