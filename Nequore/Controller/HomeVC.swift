//
//  ViewController.swift
//  Nequore
//
//  Created by Kunal Tyagi on 08/01/19.
//  Copyright © 2019 Kunal Tyagi. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var categories: [String] = ["Recommended", "Top Developers", "Pre-Sales", "Popular Projects", "Featured Localities"]

    var data: Data?
    var recommended: [Recommended] = []
    var topDevelopers: [TopDevelopers] = []
    var preSale: [PreSale] = []
    var popularProjects: [PopularProjects] = []
    var featuredLocalities: [FeaturedLocalities] = []
    var blogs: [Blogs] = []
    
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
            
            guard let blog = self.data?.blogs else { return }
            self.blogs = blog
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
        cell.cellDetails = self.recommended
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
}



