//
//  CityResult.swift
//  SwiftVIPERCitiesDemo
//
//  Created by Neelam on 12/21/19.
//  Copyright © 2019 Neelam. All rights reserved.
//

import Foundation

struct CityResult: Decodable {
    let cities: [City]
}

struct City: Decodable{
    let country: String?
    let geonameid: Int?
    let name: String?
    let subcountry: String?
}
