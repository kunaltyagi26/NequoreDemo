//
//  RecommendedCell.swift
//  Nequore
//
//  Created by Kunal Tyagi on 09/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit

class RecommendedCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func configureCell(image: UIImage, address: String, description: String, price: String) {
        self.image.image = image
        self.addressLabel.text = address
        self.desc.text = description
        self.price.text = price
    }
}
