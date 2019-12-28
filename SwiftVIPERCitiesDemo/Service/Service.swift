//
//  Service.swift
//  SwiftVIPERCitiesDemo
//
//  Created by Neelam on 12/22/19.
//  Copyright © 2019 Neelam. All rights reserved.
//

import Foundation

typealias CitiesClosure = (CityResult) -> (Void)
protocol CitiesApi {
    func fetchCities(completion: CitiesClosure) -> (Void)
}

class Service {
    static let shared: Service = Service()
    private init() {}
}

extension Service: CitiesApi {
    
    func fetchCities(completion: CitiesClosure) {
        
        if let url = Bundle.main.url(forResource: "world-cities", withExtension: "json"){
            
            do{
                let data = try Data(contentsOf: url)
                let cities = try JSONDecoder().decode([City].self, from: data)
                completion(CityResult(cities: cities))
            } catch {
                print("Something wrong error: \(error)")
            }
        }
    }
}
