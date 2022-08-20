//
//  NetworkWeatherManager.swift
//  WeatherAppWithJson
//
//  Created by Кирилл on 06.08.2022.
//

import Foundation

struct NetworkWeatherManager {
    //completionHandler: @escaping (Weather) -> Void
    func fetchWeather(latitude: Double,longitude: Double, completionHandler: @escaping(Weather)->Void){
    
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)&[lang=ru_RU]"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print(error!)
                return
            }
            if let weather = self.parseJSON(WithData: data){
               completionHandler(weather)
            }
        }
        
        task.resume()
    }
    func parseJSON(WithData data: Data) -> Weather?{
        let decoder = JSONDecoder()
        
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else { return nil }
            return weather
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        return nil
    }
}
