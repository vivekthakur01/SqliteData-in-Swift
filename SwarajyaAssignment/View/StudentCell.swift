//
//  StudentCell.swift
//  SwarajyaAssignment
//
//  Created by Vivek Thakur on 08/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    
    @IBOutlet weak var lblMain: CustomLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
