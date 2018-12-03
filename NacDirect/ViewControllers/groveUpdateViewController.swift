    //
    //  groveUpdateViewController.swift
    //  NacDirect
    //
    //  Created by Bhavesh Shah on 11/24/18.
    //  Copyright © 2018 Bhavesh Shah. All rights reserved.
    //

    import UIKit
    import Parse
    import MBProgressHUD

    class groveUpdateViewController: UIViewController {
        
        
        @IBOutlet weak var brokenSegControl: UISegmentedControl!
        @IBOutlet weak var floorView: UIView!
        @IBOutlet weak var floorField: UITextField!
        @IBOutlet weak var sideSegControl: UISegmentedControl!
        @IBOutlet weak var elevatorView: UIView!
        @IBOutlet weak var elevatorSegControl: UISegmentedControl!
        @IBOutlet weak var genderView: UIView!
        @IBOutlet weak var genderSegControl: UISegmentedControl!
        
        @IBOutlet weak var updateButtonFrame: UIView!
        @IBOutlet weak var brokenText: UILabel!
        
        var counter = 1
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if PFUser.current()?.username as? String == "admin" {
                brokenText.text = "What has been fixed?"
                brokenText.font = UIFont(name: brokenText.font.fontName, size: 30)
            }
            // hide these elements when elevator is selected
            genderView.isHidden = true
            floorView.isHidden = true
            

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
            
            // create update post and upload information to database
            let brokenSeg = ["Elevator", "Bathoom"]
            let genderSeg = ["Male", "Female"]
            let elevatorSeg = ["1","2","3","4"]
            let sideSeg = ["East", "West"]
            let broken = brokenSeg[brokenSegControl.selectedSegmentIndex]
            let elevator = elevatorSeg[elevatorSegControl.selectedSegmentIndex]
            let gender = genderSeg[genderSegControl.selectedSegmentIndex]
            let side = sideSeg[sideSegControl.selectedSegmentIndex]
            let floorNum = floorField.text
            
            if PFUser.current()?.username as? String == "admin" { // if user is admin, delete posts
                let query = PFQuery(className: "Updates")
                query.order(byDescending: "createdAt")
                query.findObjectsInBackground { (posts, error) in
                    if error == nil {
                        for post in posts! {
                            if self.genderView.isHidden == true { // if elevator has been fixed
                                if post["building"] as? String == "grove" && post["elevator_number"] as? String == elevator {
                                    post.deleteInBackground()
                                }
                            }
                            else { // if bathroom has been fixed
                                if post["building"] as? String == "grove" && post["floor_number"] as? String == floorNum && post["side"] as? String == side && post["gender"] as? String == gender {
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
                var update = PFObject(className: "Updates")
                update["building"] = "grove"
                update["uploader"] = PFUser.current()
                // update["object"] = broken
                
                if genderView.isHidden == true {
                    update["elevator_number"] = elevator
                } else {
                    update["gender"] = gender
                    update["floor_number"] = floorNum
                    update["side"] = side
                }
                
                update.saveInBackground(block: {(success: Bool, error: Error?) -> Void in
                    if error == nil {
                        DispatchQueue.main.async {
                            sleep(1)
                            
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
        
        @IBAction func onBrokenChanged(_ sender: Any) {
            counter = counter + 1
            if counter % 2 == 0 {
                genderView.isHidden = false
                floorView.isHidden = false
                elevatorView.isHidden = true
            } else {
                genderView.isHidden = true
                floorView.isHidden = true
                elevatorView.isHidden = false
            }
        }
    }

