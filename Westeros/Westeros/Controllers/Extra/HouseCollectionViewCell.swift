//
//  HouseCollectionViewCell.swift
//  Westeros
//
//  Created by German Hernandez on 26/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

class HouseCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: self)
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
}
