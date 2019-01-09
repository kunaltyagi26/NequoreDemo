//
//  CategoryCell.swift
//  Nequore
//
//  Created by Kunal Tyagi on 08/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var roundedView: UIView!
    
    override func awakeFromNib() {
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.7
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.cornerRadius = 20
        shadowView.layer.shadowRadius = 30
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        
        roundedView.layer.cornerRadius = 20
        roundedView.layer.masksToBounds = true
        roundedView.backgroundColor = .red
        
        self.contentView.layer.cornerRadius = 20
        //self.contentView.layer.masksToBounds = true
    }
}
