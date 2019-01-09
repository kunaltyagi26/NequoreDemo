//
//  HeaderCell.swift
//  Nequore
//
//  Created by Kunal Tyagi on 09/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var category: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(category: String) {
        self.category.text = category
    }

}
