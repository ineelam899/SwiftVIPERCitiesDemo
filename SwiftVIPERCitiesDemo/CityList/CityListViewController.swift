//
//  CityListViewController.swift
//  SwiftVIPERCitiesDemo
//
//  Created by Neelam on 12/20/19.
//  Copyright © 2019 Neelam. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

protocol CityListView: class {
    func updateCities(cityList: [CityItemViewModel]) -> ()
}

class CityListViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var tableView: UITableView!
    
    private static let cityCellID = "cityCellID"
    
    var presenter: CityListPresentation?
    var datasource: [CityItemViewModel] = [] {
        
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startAnimating()
        self.presenter?.viewDidLoad()
        self.title = "Cities"
        self.tableView.register(UINib(nibName: "CityItemCell", bundle: nil), forCellReuseIdentifier: CityListViewController.cityCellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension CityListViewController: CityListView {
    
    func  updateCities(cityList: [CityItemViewModel])  {
        self.stopAnimating()
        self.datasource = cityList
    }
}

extension CityListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let viewModel = datasource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CityListViewController.cityCellID, for: indexPath) as! CityItemCell
        cell.configure(usingViewModel: viewModel)
        return cell
    }

}

extension CityListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
}
