//
//  marshakUpdateViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/24/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class marshakUpdateViewController: UIViewController {
    
    @IBOutlet weak var brokenSegControl: UISegmentedControl!
    @IBOutlet weak var elevatorView: UIView!
    @IBOutlet weak var elevatorSegControl: UISegmentedControl!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var genderSegControl: UISegmentedControl!
    @IBOutlet weak var floorField: UITextField!
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var sideLabel: UILabel!
    @IBOutlet weak var sideSegControl: UISegmentedControl!
    @IBOutlet weak var updateButtonFrame: UIView!
    
    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide these elements when elevator is selected
        genderView.isHidden = true
        floorLabel.isHidden = true
        floorField.isHidden = true
        sideLabel.isHidden = true
        sideSegControl.isHidden = true
        
        
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
        let elevatorSeg = ["1","2","3","4","5","6"]
        let sideSeg = ["East", "West"]
        let elevator = elevatorSeg[elevatorSegControl.selectedSegmentIndex]
        let broken = brokenSeg[brokenSegControl.selectedSegmentIndex]
        let gender = genderSeg[genderSegControl.selectedSegmentIndex]
        let side = sideSeg[sideSegControl.selectedSegmentIndex]
        let floorNum = floorField.text
        
        var update = PFObject(className: "Updates")
        update["building"] = "marshak"
        update["uploader"] = PFUser.current()
        update["object"] = broken
        
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
                    
                    // show completion indicator
                    hud.mode = .customView
                    hud.label.text = "Updated"
                    hud.customView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
                    hud.hide(animated:true, afterDelay: 1)
                }
            }
            else {
                print(error)
            }
        })
    }
    
    @IBAction func onBrokenChanged(_ sender: Any) {
        counter = counter + 1
        if counter % 2 == 0 {
            genderView.isHidden = false
            floorLabel.isHidden = false
            floorField.isHidden = false
            sideLabel.isHidden = false
            sideSegControl.isHidden = false
            elevatorView.isHidden = true
        } else {
            genderView.isHidden = true
            floorLabel.isHidden = true
            floorField.isHidden = true
            sideLabel.isHidden = true
            sideSegControl.isHidden = true
            elevatorView.isHidden = false
        }
    }
}
