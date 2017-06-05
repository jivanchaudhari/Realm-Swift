//
//  CustomTableViewCell.swift
//  RealmDemo
//
//  Created by Mindrose on 05/06/17.
//  Copyright © 2017 Mindrose. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var deparmentLabel: UILabel!
    @IBOutlet var IDLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
