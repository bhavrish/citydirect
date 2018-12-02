//
//  MainPageViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/23/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit
import Parse

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var nacView: UIView!
    @IBOutlet weak var groveView: UIView!
    @IBOutlet weak var marshakView: UIView!
    
    @IBOutlet weak var nacImage: UIImageView!
    @IBOutlet weak var groveImage: UIImageView!
    @IBOutlet weak var marshakImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlur()
        setGradient()
        
        setNacImage()
        setGroveImage()
        setMarshakImage()
        
        if PFUser.current()?.username == "admin" {
            navBar.title = "Admin"
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNAC(_ sender: Any) {
        self.performSegue(withIdentifier: "homePageSegue", sender: nil)
    }
    
    @IBAction func onGrove(_ sender: Any) {
        self.performSegue(withIdentifier: "groveSegue", sender: nil)
    }
    
    @IBAction func onMarshak(_ sender: Any) {
        self.performSegue(withIdentifier: "marshakSegue", sender: nil)
    }
    
    func setNacImage() {
        nacImage.image = UIImage(named: "nacPic")
        nacView.insertSubview(nacImage, at: 0)
        nacImage.layer.borderWidth = 5
    }
    
    func setMarshakImage() {
        marshakImage.image = UIImage(named: "marshakPic")
        marshakView.insertSubview(marshakImage, at: 0)
        marshakImage.layer.borderWidth = 5
    }
    
    func setGroveImage() {
        groveImage.image = UIImage(named: "grovePic")
        groveView.insertSubview(groveImage, at: 0)
        groveImage.layer.borderWidth = 5
    }
    
    func setGradient() {
        var gradientLayer:CAGradientLayer!
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        let topColor = hexStringToUIColor(hex: "C400FF")
        let bottomColor = hexStringToUIColor(hex: "5500FF")
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x:0,y:0)
        gradientLayer.endPoint = CGPoint(x:1,y:1)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func setBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.insertSubview(blurEffectView, at:0)
    }
    
    
}

extension UIImageView
{
    func blurImage()
    {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.init(rawValue: 1)!)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    
    
    
    
}
