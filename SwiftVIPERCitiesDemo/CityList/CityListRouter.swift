//
//  CityListRouter.swift
//  SwiftVIPERCitiesDemo
//
//  Created by Neelam on 12/20/19.
//  Copyright © 2019 Neelam. All rights reserved.
//

import UIKit

protocol CityListRouting {}

class CityListRouter {
    var viewController: UIViewController?
    
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension CityListRouter: CityListRouting {}

