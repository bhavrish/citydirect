//
//  marshakHomePageViewController.swift
//  NacDirect
//
//  Created by Ishraq Khan on 11/24/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class marshakHomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationVar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self;
        tableView.delegate = self;
        self.tableView.rowHeight = 100
        
    }
    
    // Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    // Contents for each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarshakFloorCell", for: indexPath) as! MarshakFloorCell
        cell.floorNumber.text = String (indexPath.row+1)
        cell.elevatorButton.titleLabel?.text = String(indexPath.row+1)
        cell.bathroomButton.titleLabel?.text = String(indexPath.row+1)
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Passing the floor number to either bathroom or elevator VC
        if segue.identifier == "marshakElevatorSegue" {
            let escalatorVC = segue.destination as! escalatorViewController
            let button = sender as! UIButton
            let floorNumber:String = button.titleLabel!.text!
            escalatorVC.floorNumber = floorNumber
        }
        else if segue.identifier == "markshakBathroomSegue"{
            let bathroomVC = segue.destination as! bathroomViewController
            let button = sender as! UIButton
            let floorNumber:String = button.titleLabel!.text!
            bathroomVC.floorNumber = floorNumber
        }
        
    }
}


