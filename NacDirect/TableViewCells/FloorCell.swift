//
//  FloorCell.swift
//  NacDirect
//
//  Created by Anthony Bravo on 11/17/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class FloorCell: UITableViewCell {

    @IBOutlet weak var floorNumber: UILabel!
    @IBOutlet weak var escalatorButton: UIButton!
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
