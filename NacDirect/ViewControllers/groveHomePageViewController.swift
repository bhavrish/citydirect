//
//  groveHomePageViewController.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/24/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class groveHomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self;
        tableView.delegate = self;
        self.tableView.rowHeight = 100
        
        // Do any additional setup after loading the view.
    }
    
    //Nummber of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }
    
    //Contents for each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroveFloorCell", for: indexPath) as! GroveFloorCell
        cell.floorNumber.text = String (indexPath.row+1)
        cell.elevatorButton.titleLabel?.text = String(indexPath.row+1)
        cell.bathroomButton.titleLabel?.text = String(indexPath.row+1)
        return cell
    }
    
    @IBAction func onElevator(_ sender: Any) {
        self.performSegue(withIdentifier: "groveElevatorSegue", sender: nil)

    }
    
    @IBAction func onBathroom(_ sender: Any) {
        self.performSegue(withIdentifier: "groveBathroomSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Passing the floor number to either bathroom or elevator VC
        if segue.identifier == "groveElevatorSeg" {
            let elevatorVC = segue.destination as! groveElevatorViewController
            let button = sender as! UIButton
            let floorNumber:String = button.titleLabel!.text!
            elevatorVC.floorNumber = floorNumber
        }
        else if segue.identifier == "groveBathroomSeg"{
            let bathroomVC = segue.destination as! groveBathroomViewController
            let button = sender as! UIButton
            let floorNumber:String = button.titleLabel!.text!
            bathroomVC.floorNumber = floorNumber
        }
        
    }

}
