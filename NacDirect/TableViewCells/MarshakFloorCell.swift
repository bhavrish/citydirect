//
//  MarshakFloorCell.swift
//  NacDirect
//
//  Created by Ishraq Khan on 11/26/18.
//  Copyright © 2018 Bhavesh Shah. All rights reserved.
//

import UIKit

class MarshakFloorCell: UITableViewCell {

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
