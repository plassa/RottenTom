//
//  MovieCell.swift
//  RottenTom
//
//  Created by Paul L on 9/27/14.
//  Copyright (c) 2014 ICH. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var MovieTitleLabel: UILabel!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
