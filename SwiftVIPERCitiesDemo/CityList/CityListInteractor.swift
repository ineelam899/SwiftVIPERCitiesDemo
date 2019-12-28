//
//  ListInteractor.swift
//  SwiftVIPERCitiesDemo
//
//  Created by Neelam on 12/20/19.
//  Copyright © 2019 Neelam. All rights reserved.
//

import Foundation

protocol CityListUseCase {
    func getCities(completion: CitiesClosure) -> (Void)
}

class CityListInteractor: CityListUseCase {
    
    var service: CitiesApi
    init(service: CitiesApi) {
        self.service = service
    }
}

extension CityListInteractor {
    
    func getCities(completion: (CityResult) -> (Void)) {
        self.service.fetchCities { (result) in
            completion(result)
        }
    }
}
