//
//  TopDevelopersCell.swift
//  Nequore
//
//  Created by Kunal Tyagi on 10/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit

class TopDevelopersCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var numberOfProjects: UILabel!
    @IBOutlet weak var developer: UILabel!
    @IBOutlet weak var developerDesc: UILabel!
    
    func configureCell(imageUrl: URL, numberOfProjects: Int, developer: String, developerDesc: String) {
        self.image.af_setImage(withURL: imageUrl)
        self.numberOfProjects.text = "\(numberOfProjects)"
        self.developer.text = developer
        self.developerDesc.text = developerDesc
    }
}
