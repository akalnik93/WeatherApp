import UIKit

class CustomCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.setConstraintsCellContainer()
        self.setConstraintsCellCityName()
        self.setConstraintsCellCityTemp()
    }
    
    var cellCityName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Calibry", size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cellCityTemp: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Calibry", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cellContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func configureCellCity(cityName: String, cityTemp: String) {
        self.cellCityName.text = cityName
        self.cellCityTemp.text = cityTemp
    }
    
}

extension CustomCell {
    
    func setConstraintsCellContainer() {
        self.addSubview(cellContainer)
        NSLayoutConstraint.activate([
            cellContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cellContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            cellContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            cellContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
            ])
    }
    
    func setConstraintsCellCityName() {
        self.cellContainer.addSubview(cellCityName)
        NSLayoutConstraint.activate([
            cellCityName.topAnchor.constraint(equalTo: self.cellContainer.topAnchor),
            cellCityName.leadingAnchor.constraint(equalTo: self.cellContainer.leadingAnchor, constant: 16),
            cellCityName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellCityName.heightAnchor.constraint(equalToConstant: 28)
            ])
    }
    
    func setConstraintsCellCityTemp() {
        self.cellContainer.addSubview(cellCityTemp)
        NSLayoutConstraint.activate([
            cellCityTemp.bottomAnchor.constraint(equalTo: self.cellContainer.bottomAnchor, constant: -9),
            cellCityTemp.leadingAnchor.constraint(equalTo: self.cellCityName.leadingAnchor),
            cellCityTemp.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellCityTemp.heightAnchor.constraint(equalToConstant: 20)
            ])
    }

}
