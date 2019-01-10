//
//  RecommendedCell.swift
//  Nequore
//
//  Created by Kunal Tyagi on 09/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit
import AlamofireImage

class RecommendedCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var section: Int = 0
    
    func configureCell(imageUrl: URL, address: String, description: String, price: Int) {
        self.image.af_setImage(withURL: imageUrl)
        self.addressLabel.text = address
        self.desc.text = description
        self.price.text = "\(price)"
        
        addressView.layer.cornerRadius = 15
    }
}
