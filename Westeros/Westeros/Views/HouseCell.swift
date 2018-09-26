//
//  HouseCell.swift
//  Westeros
//
//  Created by German Hernandez on 25/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

class HouseCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        sigilImageView.image = nil
        nameLabel.text = nil
        wordsLabel.text = nil
    }
}
