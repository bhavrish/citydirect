//
//  GroveFloorCell.swift
//  NacDirect
//
//  Created by Bhavesh Shah on 11/25/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class GroveFloorCell: UITableViewCell {

    @IBOutlet weak var floorNumber: UILabel!
    @IBOutlet weak var elevatorButton: UIButton!
    @IBOutlet weak var bathroomButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
