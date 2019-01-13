//
//  PopularProjectsCell.swift
//  Nequore
//
//  Created by Kunal Tyagi on 12/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit

class PopularProjectsCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var owner: UILabel!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func configureCell(imageUrl: URL, owner: String, projectName: String, desc: String, price: Double) {
        self.image.af_setImage(withURL: imageUrl)
        self.owner.text = owner
        self.projectName.text = projectName
        self.desc.text = desc
        self.price.text = "$ \(price)K"
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
    }
}
