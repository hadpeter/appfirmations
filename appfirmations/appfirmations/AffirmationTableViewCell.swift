//
//  AffirmationTableViewCell.swift
//  appfirmations
//
//  Created by Hadley Peterson on 5/31/20.
//  Copyright © 2020 Hadley Peterson. All rights reserved.
//

import UIKit

class AffirmationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var affirmationBlurb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
