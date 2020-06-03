//
//  AffirmationTableViewCell.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/31/20.
//  Copyright © 2020 Hadley Peterson. All rights reserved.
//

import UIKit

class AffirmationTableViewCell: UITableViewCell {
    
    // Properties
    @IBOutlet weak var affirmationBlurb: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
