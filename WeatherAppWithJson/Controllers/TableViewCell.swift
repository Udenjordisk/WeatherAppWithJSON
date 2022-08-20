//
//  TableViewCell.swift
//  WeatherAppWithJson
//
//  Created by Кирилл on 07.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameCityLabel: UILabel!
    
    @IBOutlet weak var conditionCityLabel: UILabel!
    
    @IBOutlet weak var tempCityLabel: UILabel!
    
    
    func configure(weather: Weather){
        
        self.nameCityLabel.text = weather.name
        self.conditionCityLabel.text = weather.conditionString
        self.tempCityLabel.text = String(weather.temperature)
        
    }
    
    
    
}
