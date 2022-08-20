//
//  Weather.swift
//  WeatherAppWithJson
//
//  Created by Кирилл on 06.08.2022.
//

import Foundation

struct Weather {
    
    var name: String = "Загрузка"
    var temperature: Int = 0
    var conditionCode: String = ""
    var url: String = ""
    var condition: String = ""
    var pressureMm: Int = 0
    
    //var tempMin: Int = 0
    //var tempMax: Int = 0
    
    var windSpeed: Double = 0.0
    
    var conditionString: String{
        switch condition{
            
        case "clear": return "Ясно"
        case "partly-cloudy": return "Малооблачно"
        case "cloudy": return "Облачно с прояснениями"
        case "overcast": return "Пасмурно"
        case "drizzle": return "Морось"
        case "light-rain": return "Небольшой дождь"
        case "rain": return "Дождь"
        case "moderate-rain" : return "Умеренно сильный дождь"
        case "heavy-rain" : return "Сильный дождь"
        case "continuous-heavy-rain" : return "Длительный сильный дождь"
        case "showers" : return "Ливень"
        case "wet-snow" : return "Дождь со снегом"
        case "light-snow" : return "Небольшой снег"
        case "snow" : return "Снег"
        case "snow-showers": return "Снегопад"
        case "hail": return "Град"
        case "thunderstorm": return "Гроза"
        case "thunderstorm-with-rain": return "Дождь с грозой"
        case "thunderstorm-with-hail": return "Гроза с градом"
        default: return "Загрузка"
            
        }
    }
    
    init?(weatherData: WeatherData){
    
         temperature = weatherData.fact.temp ?? 0
         conditionCode = weatherData.fact.icon
         url = weatherData.info.url
         condition = weatherData.fact.condition
         pressureMm = weatherData.fact.pressureMm
        
         //tempMin = weatherData.fact.tempMin ?? 0
         //tempMax = weatherData.fact.tempMax ?? 0
        
         windSpeed = weatherData.fact.windSpeed
        
    }
    
    init(){
        
    }
    
    
}
extension Int{
    func toString() -> String{
        return String(self)
    }
    
}

extension Double{
    func toString() -> String{
        return String(self)
    }
}
