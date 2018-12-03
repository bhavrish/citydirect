//
//  updateViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/19/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class updateViewController: UIViewController {
    
    @IBOutlet weak var brokenSegControl: UISegmentedControl!
    @IBOutlet weak var floorField: UITextField!
    @IBOutlet weak var sideSegControl: UISegmentedControl!
    
    @IBOutlet weak var directionView: UIView!
    @IBOutlet weak var directionSegControl: UISegmentedControl!
    
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var genderSegControl: UISegmentedControl!
    
    @IBOutlet weak var updateButtonFrame: UIView!
    @IBOutlet weak var brokenText: UILabel!
    
    var counter = 0
    
    override func viewDidLoad() {
        if PFUser.current()?.username as? String == "admin" {
            brokenText.text = "What has been fixed?"
            brokenText.font = UIFont(name: brokenText.font.fontName, size: 30)
        }
        super.viewDidLoad()
        genderView.isHidden = true
        
        // set update button properties
        updateButtonFrame.layer.cornerRadius = 8.0
        updateButtonFrame.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateOnTap(_ sender: Any) {
        // adds status update indicator
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .indeterminate
        
        // var floorstring = floorField.text
        let floornumber = floorField.text
        let brokenObects = ["Escalator","Bathroom"]
        let sides = ["East","West"]
        let directionArr = ["Up","Down"]
        let genderArr = ["Male","Female"]
        let obj = brokenObects[brokenSegControl.selectedSegmentIndex]
        let side = sides[sideSegControl.selectedSegmentIndex]
        let dir = directionArr[directionSegControl.selectedSegmentIndex]
        let gend = genderArr[genderSegControl.selectedSegmentIndex]
        
        if PFUser.current()?.username as? String == "admin" { // if user is admin, delete posts
            let query = PFQuery(className: "Updates")
            query.order(byDescending: "createdAt")
            query.findObjectsInBackground { (posts, error) in
                if error == nil {
                    for post in posts! {
                        if self.genderView.isHidden == true { // if escalator has been fixed
                            if post["building"] as? String == "nac" && post["floor_number"] as? String == floornumber && post["side"] as? String == side && post["direction"] as? String == dir {
                                post.deleteInBackground()
                            }
                        }
                        else { // if bathroom has been fixed
                            if post["building"] as? String == "nac" && post["floor_number"] as? String == floornumber && post["side"] as? String == side && post["gender"] as? String == gend {
                                post.deleteInBackground()
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        hud.mode = .customView
                        hud.label.text = "Updated!"
                        hud.customView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
                        hud.hide(animated:true, afterDelay: 1)
                    }
                }
                else {
                    print(error)
                }
                
            }
        }
        else { // if user is regular person, update database
            var updates = PFObject(className: "Updates")
            updates["building"] = "nac"
            updates["floor_number"] = floornumber
            updates["uploader"] = PFUser.current()
            updates["object"] = obj
            updates["side"] = side
            
            if genderView.isHidden == true {
                updates["direction"] = dir
            }
            else if directionView.isHidden == true {
                updates["gender"] = gend
            }
            
            updates.saveInBackground(block: {(success: Bool, error: Error?) -> Void in
                if error == nil {
                    DispatchQueue.main.async {
                        sleep(1)
                        
                        // show completion indicator
                        hud.mode = .customView
                        hud.label.text = "Submitted!"
                        hud.customView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
                        hud.hide(animated:true, afterDelay: 1)
                    }
                }
                else {
                    print(error)
                }
            })
        }
    
    }
    
    
    @IBAction func brokenSegChanged(_ sender: Any) {
        counter = counter + 1
        
        // When escalator option is shown
        if counter%2 == 0 {
            genderView.isHidden = true;
            directionView.isHidden = false;
            
        }
        // When Bathroom option is shown
        else {
            genderView.isHidden = false;
            directionView.isHidden = true;
        }
    }
    
    
    
}

