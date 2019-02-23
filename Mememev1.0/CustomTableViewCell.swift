//
//  CustomTableViewCell.swift
//  Mememev1.0
//
//  Created by Srikar Thottempudi on 2/23/19.
//  Copyright © 2019 Srikar Thottempudi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var customMemeImage: UIImageView!
    @IBOutlet weak var customMemeText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
