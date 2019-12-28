//
//  CityItemCell.swift
//  SwiftVIPERCitiesDemo
//
//  Created by Neelam on 12/21/19.
//  Copyright © 2019 Neelam. All rights reserved.
//

import UIKit

class CityItemCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure for selected state
    }
    
    func configure(usingViewModel viewModel: CityItemViewModel) -> Void {
        
        nameLabel?.text = viewModel.name
        countryLabel?.text = viewModel.country
    }
}

