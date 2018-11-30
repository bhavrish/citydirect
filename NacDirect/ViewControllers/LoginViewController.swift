//
//  LoginViewController.swift
//  NacDirect
//
//  Created by Ishraq Khan on 11/16/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButtonFrame: UIView!
    @IBOutlet weak var signinFrame: UIView!
    @IBOutlet weak var signupFrame: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set login button properties
        loginButtonFrame.layer.cornerRadius = 8.0
        loginButtonFrame.clipsToBounds = true
        signinFrame.layer.cornerRadius = 8.0
        signinFrame.clipsToBounds = true
        signupFrame.layer.cornerRadius = 8.0
        signupFrame.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onLogIn(_ sender: Any) {
        let username = usernameField.text ?? "" // provides default value of empty string if no username / password
        let password = passwordField.text ?? ""
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "mainSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUpSegue", sender: nil)
    }

}
