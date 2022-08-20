//
//  WeatherData.swift
//  WeatherAppWithJson
//
//  Created by Кирилл on 06.08.2022.
//

import Foundation

struct  WeatherData: Codable {
    
    let info: Info
    
    let fact: Fact

}

struct Info: Codable {
    
    let url: String
    
}

struct Fact: Codable {
//TODO: Добавить использование enum в код
    let temp: Int?
    let icon: String
    let condition: String
    let windSpeed: Double
    let pressureMm: Int
    //let tempMin, tempMax: Int?
    
    enum CodingKeys: String, CodingKey{
           
           case temp
            
           case icon
            
           case condition
        
           case windSpeed = "wind_speed"
           
           case pressureMm = "pressure_mm"
           
           //case tempMin = "temp_min"
                
           //case tempMax = "temp_max"
       }
}



