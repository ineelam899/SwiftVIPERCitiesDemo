//
//  CityListPresenter.swift
//  SwiftVIPERCitiesDemo
//
//  Created by Neelam on 12/20/19.
//  Copyright © 2019 Neelam. All rights reserved.
//

import Foundation

protocol CityListPresentation {
    func viewDidLoad() -> Void
}

class CityListPresenter: CityListPresentation {
    weak var view: CityListView?
    var interactor: CityListUseCase?
    var router: CityListRouting?
    
    init(view: CityListView, interactor: CityListUseCase, router: CityListRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CityListPresenter {
    
    func viewDidLoad() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor?.getCities(completion: { result in
                let cityList = result.cities.compactMap({ CityItemViewModel(using: $0) })
                DispatchQueue.main.async { [weak self] in
                    self?.view?.updateCities(cityList: cityList)
                }
            })
        }
    }
}

struct CityItemViewModel {
    let country: String
    let name: String
    
    init(using cityModel: City) {
        self.country = cityModel.country ?? ""
        self.name = cityModel.name ?? ""
    }
}
