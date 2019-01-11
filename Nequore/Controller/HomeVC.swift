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
            
            self.tableView.reloadData()
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
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
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
            return self.view.frame.width * 0.40
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
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let index = collectionView.tag
        
        switch index {
        case 0:
            return recommended.count
        case 1:
            return topDevelopers.count
        case 2:
            return preSale.count
        case 3:
            return popularProjects.count
        case 4:
            return featuredLocalities.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let recommendedObj = recommended[indexPath.row]
        let topDev = topDevelopers[indexPath.row]
        let featLoc = featuredLocalities[indexPath.row]
        
        var cell = UICollectionViewCell()
        
        let index = collectionView.tag
        
        switch index {
        case 0:
            guard let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            
            recommendedCell.configureCell(imageUrl: URL(string: recommendedObj.image ?? "https://httpbin.org/image/png")!, address: (recommendedObj.city?.nameEn)!, description: recommendedObj.descriptionValue!, price: recommendedObj.maxPrice!)
            
            cell = recommendedCell
        case 1:
            /*guard let topDevelopersCell = collectionView.dequeueReusableCell(withReuseIdentifier: "topDevelopersCell", for: indexPath) as? TopDevelopersCell else { return UICollectionViewCell() }

            print("url:", topDev.image ?? "https://httpbin.org/image/png")
            print("num:", topDev.buildingsCount ?? 0)
            print("dev:", topDev.developerTitle ?? "no value")
            print("devDesc:", topDev.developerDesc ?? "no value")
            
            topDevelopersCell.configureCell(imageUrl: URL(string: topDev.image ?? "https://httpbin.org/image/png")!, numberOfProjects: topDev.buildingsCount ?? 0, developer: topDev.developerTitle ?? "no value", developerDesc: topDev.developerDesc ?? "no value")
            
            cell = topDevelopersCell*/
            guard let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            
            recommendedCell.configureCell(imageUrl: URL(string: recommendedObj.image ?? "https://httpbin.org/image/png")!, address: (recommendedObj.city?.nameEn)!, description: recommendedObj.descriptionValue!, price: recommendedObj.maxPrice!)
            
            cell = recommendedCell
        case 2:
            guard let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            
            recommendedCell.configureCell(imageUrl: URL(string: recommendedObj.image ?? "https://httpbin.org/image/png")!, address: (recommendedObj.city?.nameEn)!, description: recommendedObj.descriptionValue!, price: recommendedObj.maxPrice!)
            
            cell = recommendedCell
        case 3:
            guard let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            
            recommendedCell.configureCell(imageUrl: URL(string: recommendedObj.image ?? "https://httpbin.org/image/png")!, address: (recommendedObj.city?.nameEn)!, description: recommendedObj.descriptionValue!, price: recommendedObj.maxPrice!)
            
            cell = recommendedCell
        case 4:
            guard let featuredLocalitiesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredLocalitiesCell", for: indexPath) as? FeaturedLocalitiesCell else { return UICollectionViewCell() }
            
            featuredLocalitiesCell.configureCell(locality: featLoc.name ?? "", price: featLoc.pricePerSqft ?? 0, numberofProjects: featLoc.buildingsCount ?? 0)
            
            cell = featuredLocalitiesCell
        default:
            cell = UICollectionViewCell()
        }
        
        return cell
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding:CGFloat = 5
        var itemWidth: CGFloat = 0.0
        
        let index = collectionView.tag
        
        switch index {
        case 0:
            itemWidth = self.view.bounds.width * 0.7
        case 1:
            itemWidth = self.view.bounds.width * 0.5
        case 2:
            itemWidth = self.view.bounds.width * 0.9
        case 3:
            itemWidth = self.view.bounds.width * 0.8
        case 4:
            itemWidth = self.view.bounds.width * 0.8
        default:
            itemWidth = 0
        }
        
        let itemHeight = collectionView.bounds.height - (2 * padding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}



