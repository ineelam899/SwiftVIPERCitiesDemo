//
//  CityListModuleBuilder.swift
//  SwiftVIPERCitiesDemo
//
//  Created by Neelam on 12/21/19.
//  Copyright © 2019 Neelam. All rights reserved.
//

import UIKit

class CityListModuleBuilder {
    
    static func builder() -> UINavigationController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "CityListViewController") as! CityListViewController
        let interactor = CityListInteractor(service: Service.shared)
        let router = CityListRouter(view: view)
        let presenter = CityListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        let navigationController = UINavigationController.init(rootViewController: view)
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.isTranslucent = false
        return navigationController
    }
    
}
