//
//  dateCell.swift
//  date ideas
//
//  Created by Timothy Acorda on 1/30/15.
//  Copyright (c) 2015 hackanddev. All rights reserved.
//

import UIKit

class dateCell: UITableViewCell {
    
    @IBOutlet weak var dateImage: UIImageView!
    @IBOutlet weak var dateName: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var dollarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
