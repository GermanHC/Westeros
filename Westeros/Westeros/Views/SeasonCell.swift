//
//  SeasonCell.swift
//  Westeros
//
//  Created by German Hernandez on 28/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

class SeasonCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originallyAiredYearLabel: UILabel!
   
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        originallyAiredYearLabel.text = nil
    }
    
}
