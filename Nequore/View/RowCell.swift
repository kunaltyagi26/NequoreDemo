//
//  RowCell.swift
//  Nequore
//
//  Created by Kunal Tyagi on 08/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit

class RowCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    /*override func awakeFromNib() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }*/
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}


/*extension RowCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
        //cell.configureCell(image: <#T##UIImage#>, address: <#T##String#>, description: <#T##String#>, price: <#T##String#>)
        return cell
    }
    
}

extension RowCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 2
        let padding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - padding
        let itemHeight = collectionView.bounds.height - (2 * padding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}*/
