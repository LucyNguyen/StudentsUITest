//
//  StudentCell.swift
//  StudentsUITest
//
//  Created by Lucy Nguyen on 12/24/16.
//  Copyright © 2016 Lucy Nguyen. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setContent(name: String, address: String) {
        nameLabel.text = name
        addressLabel.text = address
    }
}
