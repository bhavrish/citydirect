//
//  SignUpViewController.swift
//  NacDirect
//
//  Created by Ishraq Khan on 11/17/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var registerButtonFrame: UIView!
    @IBOutlet weak var fieldFrame: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set register button properties
        fieldFrame.layer.cornerRadius = 8.0
        fieldFrame.clipsToBounds = true
        registerButtonFrame.layer.cornerRadius = 8.0
        registerButtonFrame.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRegister(_ sender: Any) {
        // initializes a new Parse user object
        let newUser = PFUser()
        
        // sets user properties
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.email = emailField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User created")
                self.performSegue(withIdentifier: "mainSegue2", sender: nil)
            }
            
        }
    }

}
