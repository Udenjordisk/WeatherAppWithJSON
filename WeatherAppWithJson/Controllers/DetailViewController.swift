//
//  DetailViewController.swift
//  WeatherAppWithJson
//
//  Created by Кирилл on 08.08.2022.
//

import UIKit
import SwiftSVG

class DetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var conditionView: UIView!
    
    
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!

    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshLabels()
    }
    
    func refreshLabels(){
        
        cityNameLabel.text = weatherModel?.name
        
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weatherModel!.conditionCode).svg")
        
        let weatherImage = UIView(SVGURL: url!){(image) in
            image.resizeToFit(self.conditionView.bounds)
        }
        
        self.conditionView.addSubview(weatherImage)
        
        conditionLabel.text = weatherModel?.conditionString
        tempLabel.text = weatherModel?.temperature.toString()
        
        pressureLabel.text = weatherModel?.pressureMm.toString()
        
        windSpeedLabel.text = weatherModel?.windSpeed.toString()
        
        
    }
    
    
    

}
