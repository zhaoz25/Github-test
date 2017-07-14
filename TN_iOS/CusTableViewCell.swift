//
//  CusTableViewCell.swift
//  TN_iOS
//
//  Created by Hoang Phuc on 7/13/17.
//  Copyright © 2017 Hoang Phuc. All rights reserved.
//

import UIKit

class CusTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var contentCell: UILabel!
    @IBOutlet weak var mucphatCell: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
