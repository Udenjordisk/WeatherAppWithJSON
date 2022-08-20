//
//  AddCity.swift
//  WeatherAppWithJson
//
//  Created by Кирилл on 09.08.2022.
//

import UIKit

extension UIViewController{
    func alertPlusCity(name: String, placeholder: String, comletionHandler: @escaping (String) -> Void){
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ок", style: .default) { (action) in
            
            let tftext = alertController.textFields?.first
            
            guard let text = tftext?.text else {return}
            
            comletionHandler(text)
            
        }
        alertController.addTextField { tf in
            tf.placeholder = placeholder
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { UIAlertAction in }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }
}
