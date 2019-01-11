//
//  FeaturedLocalitiesCell.swift
//  Nequore
//
//  Created by Kunal Tyagi on 11/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit

class FeaturedLocalitiesCell: UICollectionViewCell {
    @IBOutlet weak var locality: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var numberOfProjects: UILabel!
    
    func configureCell(locality: String, price: Int, numberofProjects: Int) {
        self.locality.text = locality
        self.price.text = "$ \(price) / sqft"
        self.numberOfProjects.text = "\(numberofProjects)"
    }
}
