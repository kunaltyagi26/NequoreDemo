//
//  PreSalesCell.swift
//  Nequore
//
//  Created by Kunal Tyagi on 12/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit

class PreSalesCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var owner: UILabel!
    
    func configureCell(imageUrl: URL, price: Double, desc: String, owner: String) {
        self.image.af_setImage(withURL: imageUrl)
        self.price.text = "$ \(price)K"
        self.desc.text = desc
        self.owner.text = owner
        self.roundedView.layer.cornerRadius = 15
    }
}
