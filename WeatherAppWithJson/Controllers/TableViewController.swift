//
//  TableViewController.swift
//  WeatherAppWithJson
//
//  Created by Кирилл on 05.08.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    
    var citiesArray = [Weather]()
    
    let emptyCity = Weather()
    var filterCity = [Weather]()
    
    var nameCitiesArray = ["Симферополь","Севастополь","Ростов-на-Дону","Москва","Краснодар","Казань","Ялта","Алушта","Санкт-Петербург","Воронеж"]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false}
        return text.isEmpty
    }

    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        addCities()
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
    }
    
    
    
    @IBAction func pressPlusButton(_ sender: Any) {
        alertPlusCity(name: "Город", placeholder: "Введите название города") { city in
            self.nameCitiesArray.append(city)
            self.citiesArray.append(self.emptyCity)
            self.addCities()
        }
    }
    
    func addCities(){
        getCitiesWeather(citiesArray: self.nameCitiesArray) { index, weather in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filterCity.count
        }
        
        return citiesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell

        
        
        
        var weather = Weather()
        if isFiltering {
            weather = filterCity[indexPath.row]
        }else{
        weather = citiesArray[indexPath.row]
        }
        cell.configure(weather: weather)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _,_,_  in
            
            let editingRow = self.nameCitiesArray[indexPath.row]
            if let index = self.nameCitiesArray.firstIndex(of: editingRow) {
                
                
                if self.isFiltering{
                    self.filterCity.remove(at: index)
                    //Todo: удалять из основного массива
                } else {
                    self.citiesArray.remove(at: index)
                }
                
                self.citiesArray.remove(at: index)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            
            if isFiltering {
                
                let filter = filterCity[indexPath.row]
                let detailVC = segue.destination as! DetailViewController
                detailVC.weatherModel = filter
                
            } else {
            
            let cityWeather = citiesArray[indexPath.row]
            let detailVC = segue.destination as! DetailViewController
            detailVC.weatherModel = cityWeather
                
            }
            
    }
    
}
}
extension TableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    private func filterContentForSearchText(_ searchtext: String){
        filterCity = citiesArray.filter{
            $0.name.contains(searchtext)
        }
        tableView.reloadData()
    }
}
