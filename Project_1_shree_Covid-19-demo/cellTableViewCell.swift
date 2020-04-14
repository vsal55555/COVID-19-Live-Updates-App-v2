//
//  cellTableViewCell.swift
//  Project_1_shree_Covid-19-demo
//
//  Created by BSAL-MAC on 4/13/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
