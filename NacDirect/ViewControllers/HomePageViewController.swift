//
//  HomePageViewController.swift
//  NacDirect
//
//  Created by Anthony Bravo on 11/17/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationVar: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self;
        tableView.delegate = self;
        self.tableView.rowHeight = 100
        
        
        // Do any additional setup after loading the view.
    }
    
    //Nummber of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8;
    }
    
    //Contents for each cell 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FloorCell", for: indexPath) as! FloorCell
        cell.floorNumber.text = String (indexPath.row+1)
        return cell
    }
    
   
    
}

