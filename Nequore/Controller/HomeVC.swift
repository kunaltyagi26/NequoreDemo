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

class Category {
    static var categories: [String] = ["Recommended", "Top Developers", "Pre-Sales", "Popular Projects", "Featured Localities"]
}

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //var categories: [String] = ["Recommended", "Top Developers", "Pre-Sales", "Popular Projects", "Featured Localities"]
    
    var data: Data?
    var recommended: [Recommended] = []
    var topDevelopers: [TopDevelopers] = []
    var preSale: [PreSale] = []
    var popularProjects: [PopularProjects] = []
    var featuredLocalities: [FeaturedLocalities] = []
    
    var container: UIView!
    var loadingView: UIView!
    var actInd: UIActivityIndicatorView!
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        showActivityIndicator()
        
        DataService.instance.getData { (completion, data) in
            self.data = data
            
            guard let reco = self.data?.recommended else { return }
            if reco.count == 0 {
               Category.categories = Category.categories.filter{ $0 != "Recommended" }
            } else {
                self.recommended = reco
            }
            
            guard let topDev = self.data?.topDevelopers else { return }
            if topDev.count == 0 {
                Category.categories = Category.categories.filter{ $0 != "Top Developers" }
            } else {
                self.topDevelopers = topDev
            }
            
            guard let preS = self.data?.preSale else { return }
            if preS.count == 0 {
                Category.categories = Category.categories.filter{ $0 != "Pre-Sales" }
            } else {
                self.preSale = preS
            }
            
            guard let popPro = self.data?.popularProjects else { return }
            if popPro.count == 0 {
                Category.categories = Category.categories.filter{ $0 != "Popular Projects" }
            } else {
                self.popularProjects = popPro
            }
            
            guard let featLoc = self.data?.featuredLocalities else { return }
            if featLoc.count == 0 {
                Category.categories = Category.categories.filter{ $0 != "Featured Localities" }
            } else {
                self.featuredLocalities = featLoc
            }
            
            self.stopActivityIndicator()
            self.tableView.reloadData()
        }
    }
    
    func showActivityIndicator() {
        self.view.isUserInteractionEnabled = false
        container = UIView()
        container.frame = self.view.frame
        container.center.x = self.view.center.x
        container.center.y = self.view.center.y
        container.backgroundColor = UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 0.4)
        
        loadingView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = self.view.center
        loadingView.backgroundColor = UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 0.4)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        actInd = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        actInd.style =
            UIActivityIndicatorView.Style.whiteLarge
        actInd.center =  CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        self.view.addSubview(container)
        actInd.startAnimating()
    }
    
    func stopActivityIndicator() {
        self.view.isUserInteractionEnabled = true
        actInd.stopAnimating()
        actInd.removeFromSuperview()
        loadingView.removeFromSuperview()
        container.removeFromSuperview()
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "rowCell") as? RowCell else { return UITableViewCell() }
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let category: String = Category.categories[indexPath.section]
        
        /*switch indexPath.section {
        case 0:
            return self.view.frame.width * 0.80
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
        }*/
        
        if category == "Recommended" {
            return self.view.frame.width * 0.80
        } else if category == "Top Developers" {
            return self.view.frame.width * 0.50
        } else if category == "Pre-Sales" {
            return self.view.frame.width * 0.50
        } else if category == "Popular Projects" {
            return self.view.frame.width * 0.40
        } else if category == "Featured Localities" {
            return self.view.frame.width * 0.40
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? HeaderCell else { return UITableViewCell() }
        cell.configureCell(category:Category.categories[section])
        return cell
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let index = collectionView.tag
        let category: String = Category.categories[index]
        
        /*switch index {
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
        }*/
        
        if category == "Recommended" {
            return recommended.count
        } else if category == "Top Developers" {
            return topDevelopers.count
        } else if category == "Pre-Sales" {
            return preSale.count
        } else if category == "Popular Projects" {
            return popularProjects.count
        } else if category == "Featured Localities" {
            return featuredLocalities.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var recommendedObj = recommended[0]
        if indexPath.row < recommended.count {
            recommendedObj = recommended[indexPath.row]
        }
        
        var topDeveloper = topDevelopers[0]
        if indexPath.row < topDevelopers.count{
            topDeveloper = topDevelopers[indexPath.row]
        }
        
        var preSaleObj = preSale[0]
        if indexPath.row < preSale.count{
            preSaleObj = preSale[indexPath.row]
        }
        
        var featLoc = featuredLocalities[0]
        if indexPath.row < featuredLocalities.count {
            featLoc = featuredLocalities[indexPath.row]
        }
        
        var popularProj = popularProjects[0]
        if indexPath.row < popularProjects.count {
            popularProj = popularProjects[indexPath.row]
        }
        
        
        
        var cell = UICollectionViewCell()
        
        let index = collectionView.tag
        let category: String = Category.categories[index]
        
        if category == "Recommended" {
            guard let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            
            recommendedCell.configureCell(imageUrl: URL(string: recommendedObj.image ?? "https://httpbin.org/image/png")!, address: recommendedObj.city?.name ?? "", description: recommendedObj.descriptionValue ?? "", price: recommendedObj.minPrice ?? 0)
            
            cell = recommendedCell
        } else if category == "Top Developers" {
            guard let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            
            recommendedCell.configureCell(imageUrl: URL(string: recommendedObj.image ?? "https://httpbin.org/image/png")!, address: recommendedObj.city?.name ?? "", description: recommendedObj.descriptionValue ?? "", price: recommendedObj.minPrice ?? 0)
            
            cell = recommendedCell
        } else if category == "Pre-Sales" {
            guard let preSalesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "preSalesCell", for: indexPath) as? PreSalesCell else { return UICollectionViewCell() }
            
            preSalesCell.configureCell(imageUrl: URL(string: preSaleObj.mainImage ?? "https://httpbin.org/image/png")!, price: (preSaleObj.startingPrice ?? 0) / 1000, desc: preSaleObj.configurations?[0].config?.name ?? "", owner: preSaleObj.name ?? "")
            
            cell = preSalesCell
        } else if category == "Popular Projects" {
            guard let popularProjectsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularProjectsCell", for: indexPath) as? PopularProjectsCell else { return UICollectionViewCell() }
            
            popularProjectsCell.configureCell(imageUrl: URL(string: popularProj.mainImage ?? "https://httpbin.org/image/png")!, owner: popularProj.developer?.name ?? "", projectName: popularProj.name ?? "", desc: popularProj.configurations?[0].config?.name ?? "", price: (popularProj.startingPrice ?? 0) / 1000)
            
            cell = popularProjectsCell
        } else if category == "Featured Localities" {
            guard let featuredLocalitiesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredLocalitiesCell", for: indexPath) as? FeaturedLocalitiesCell else { return UICollectionViewCell() }
            
            featuredLocalitiesCell.configureCell(locality: featLoc.name ?? "", price: featLoc.pricePerSqft ?? 0, numberofProjects: featLoc.buildingsCount ?? 0)
            
            cell = featuredLocalitiesCell
        }
        else {
            cell = UICollectionViewCell()
        }
        
        /*switch index {
        case 0:
            guard let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            
            recommendedCell.configureCell(imageUrl: URL(string: recommendedObj.image ?? "https://httpbin.org/image/png")!, address: recommendedObj.city?.name ?? "", description: recommendedObj.descriptionValue ?? "", price: recommendedObj.minPrice ?? 0)
            
            cell = recommendedCell
        case 1:
            /*guard let topDevelopersCell = collectionView.dequeueReusableCell(withReuseIdentifier: "topDevelopersCell", for: indexPath) as? TopDevelopersCell else { return UICollectionViewCell() }
            
            topDevelopersCell.configureCell(imageUrl: URL(string: topDeveloper.image ?? "https://httpbin.org/image/png")!, numberOfProjects: topDeveloper.buildingsCount ?? 0, developer: topDeveloper.name ?? "", developerDesc: topDeveloper.developerTitle ?? "")
            
            cell = topDevelopersCell*/
            guard let recommendedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedCell", for: indexPath) as? RecommendedCell else { return UICollectionViewCell() }
            
            recommendedCell.configureCell(imageUrl: URL(string: recommendedObj.image ?? "https://httpbin.org/image/png")!, address: (recommendedObj.city?.nameEn)!, description: recommendedObj.descriptionValue!, price: recommendedObj.maxPrice!)
            
            cell =  recommendedCell
        case 2:
            guard let preSalesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "preSalesCell", for: indexPath) as? PreSalesCell else { return UICollectionViewCell() }
            
            preSalesCell.configureCell(imageUrl: URL(string: preSaleObj.mainImage ?? "https://httpbin.org/image/png")!, price: (preSaleObj.startingPrice ?? 0) / 1000, desc: preSaleObj.configurations?[0].config?.name ?? "", owner: preSaleObj.name ?? "")
            
            cell = preSalesCell
        case 3:
            guard let popularProjectsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularProjectsCell", for: indexPath) as? PopularProjectsCell else { return UICollectionViewCell() }
            
            popularProjectsCell.configureCell(imageUrl: URL(string: popularProj.mainImage ?? "https://httpbin.org/image/png")!, owner: popularProj.developer?.name ?? "", projectName: popularProj.name ?? "", desc: popularProj.configurations?[0].config?.name ?? "", price: (popularProj.startingPrice ?? 0) / 1000)
            
            cell = popularProjectsCell
        case 4:
            guard let featuredLocalitiesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredLocalitiesCell", for: indexPath) as? FeaturedLocalitiesCell else { return UICollectionViewCell() }
            
            featuredLocalitiesCell.configureCell(locality: featLoc.name ?? "", price: featLoc.pricePerSqft ?? 0, numberofProjects: featLoc.buildingsCount ?? 0)
            
            cell = featuredLocalitiesCell
        default:
            cell = UICollectionViewCell()
        }*/
        
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        cell.layer.shouldRasterize = true
        cell.layer.cornerRadius = 10
        cell.layer.shadowRadius = 5
        
        return cell
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding:CGFloat = 5
        var itemWidth: CGFloat = 0.0
        
        let index = collectionView.tag
        let category: String = Category.categories[index]
        
        if category == "Recommended" {
            itemWidth = self.view.bounds.width * 0.7
        } else if category == "Top Developers" {
            itemWidth = self.view.bounds.width * 0.5
        } else if category == "Pre-Sales" {
            itemWidth = self.view.bounds.width * 0.9
        } else if category == "Popular Projects" {
            itemWidth = self.view.bounds.width * 0.8
        } else if category == "Featured Localities" {
            itemWidth = self.view.bounds.width * 0.8
        }
        else {
            itemWidth = 0
        }
        
        /*switch index {
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
        }*/
        
        let itemHeight = collectionView.bounds.height - (2 * padding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}



