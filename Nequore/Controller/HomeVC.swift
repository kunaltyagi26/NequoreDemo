//
//  ViewController.swift
//  Nequore
//
//  Created by Kunal Tyagi on 08/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var categories: [String] = ["Recommended", "Top Developers", "Pre-Sales", "Popular Projects", "Featured Localities"]

    var data: Data?
    var recommended: [Recommended] = []
    var topDevelopers: [TopDevelopers] = []
    var preSale: [PreSale] = []
    var popularProjects: [PopularProjects] = []
    var featuredLocalities: [FeaturedLocalities] = []
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchImages { (completed) in
            
        }
        
        DataService.instance.getData { (completion, data) in
            self.data = data
            
            guard let reco = self.data?.recommended else { return }
            self.recommended = reco
            
            guard let topDev = self.data?.topDevelopers else { return }
            self.topDevelopers = topDev
            
            guard let preS = self.data?.preSale else { return }
            self.preSale = preS
            
            guard let popPro = self.data?.popularProjects else { return }
            self.popularProjects = popPro
            
            guard let featLoc = self.data?.featuredLocalities else { return }
            self.featuredLocalities = featLoc
        }
    }
    
    func fetchImages(completion: @escaping (_ status: Bool)-> ()) {
        for reco in recommended {
            Alamofire.request(reco.image!).responseImage { (response) in
                guard let image = response.result.value else { return }
                self.images.append(image)
                print(self.images.count)
                if self.images.count == self.recommended.count {
                    completion(true)
                    print("Done")
                }
            }
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "rowCell") as? RowCell else { return UITableViewCell() }
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return self.view.frame.width * 0.70
        case 1:
            return self.view.frame.width * 0.50
        case 2:
            return self.view.frame.width * 0.50
        case 3:
            return self.view.frame.width * 0.40
        case 4:
            return self.view.frame.width * 0.30
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? HeaderCell else { return UITableViewCell() }
        cell.configureCell(category: categories[section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "rowCell") as? RowCell else { return }
        //cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommended.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let recommendedObj = recommended[indexPath.row]
        var img = UIImage()
        
        /*Alamofire.request(recommendedObj.image!).responseImage { (response) in
            guard let image = response.result.value else { return }
            img = image
        }*/
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
        cell.configureCell(image: img, address: (recommendedObj.city?.nameEn)!, description: recommendedObj.descriptionValue!, price: recommendedObj.maxPrice!)
        return cell
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 2
        let padding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - padding
        let itemHeight = collectionView.bounds.height - (2 * padding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}



