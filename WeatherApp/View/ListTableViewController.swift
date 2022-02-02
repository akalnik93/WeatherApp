import UIKit

class ListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear

        self.tableView.register(CustomCell.self, forCellReuseIdentifier: idCustomCell)

        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCity, count: nameCitiesArray.count)
        }
        
        addCities()
    }
    
    let idCustomCell = "idCustomCell"
    
    var networkManager = NetworkManager()
    
    let emptyCity = Weather()
    
    var citiesArray = [Weather]()
    let nameCitiesArray = ["Москва", "Санкт-Петербург", "Нижний Новгород", "Сочи", "Орёл", "Адлер", "Тверь", "Астана", "Владивосток"]
    
    func addCities() {
        getCityWeather(citiesArray: nameCitiesArray) { index, weather in
            self.citiesArray[index] = weather
            self.citiesArray[index].name = self.nameCitiesArray[index]
            print(self.citiesArray)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: idCustomCell, for: indexPath) as! CustomCell
        cell.selectionStyle = .none
        cell.configureCellCity(cityName: self.citiesArray[indexPath.row].name, cityTemp: String(self.citiesArray[indexPath.row].temp))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

}
