//
//  ForecastViewController.swift
//  TestWeatherApp
//
//  Created by Artur on 20.04.2021.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController, ForecastWeatherView {
    // MARK: - Properties
    private let locationManager = CLLocationManager()
    private var model: ModelForecastWeather? {
        didSet {
            guard let model = self.model else { return }
            self.sortArrayModel(model: model)
        }
    }
    
    private var arrayModel: [[ForecastList]] = [[]] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var location: CLLocationCoordinate2D? {
        didSet {
            let presenter = ForecastWeatherPresenter(view: self)
            presenter.updateForecastWeatherView()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setPropertiesLocationManager()
        self.tableView.register(WeatherCell.self,
                                forCellReuseIdentifier: WeatherCell.reuseIdentifier)
    }
    
    // MARK: - Methods
    private func setPropertiesLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    private func sortArrayModel(model: ModelForecastWeather) {
        var array1: [ForecastList] = []
        var array2: [ForecastList] = []
        var array3: [ForecastList] = []
        var array4: [ForecastList] = []
        var array5: [ForecastList] = []
        var array6: [ForecastList] = []
        
        for list in model.list {
            if array1.isEmpty || array1[0].date.fullDateToDay() == list.date.fullDateToDay() {
                array1.append(list)
            } else if
                array2.isEmpty || array2[0].date.fullDateToDay() == list.date.fullDateToDay() {
                array2.append(list)
            } else if
                array3.isEmpty || array3[0].date.fullDateToDay() == list.date.fullDateToDay() {
                array3.append(list)
            } else if
                array4.isEmpty || array4[0].date.fullDateToDay() == list.date.fullDateToDay() {
                array4.append(list)
            } else if
                array5.isEmpty || array5[0].date.fullDateToDay() == list.date.fullDateToDay() {
                array5.append(list)
            } else if
                array6.isEmpty || array6[0].date.fullDateToDay() == list.date.fullDateToDay() {
                array6.append(list)
            }
        }
        self.arrayModel = [array1]
        self.arrayModel.append(array2)
        self.arrayModel.append(array3)
        self.arrayModel.append(array4)
        self.arrayModel.append(array5)
        self.arrayModel.append(array6)
    }
    
    func setParameters(model: ModelForecastWeather) {
        self.model = model
    }
    func handleError(error: NetworkError) {
        let alert = ErrorAlert.shared.errorAlert(error: error)
        self.present(alert, animated: true)
    }
    
    func getLocation() -> CLLocationCoordinate2D? {
        guard let location = self.location else { return nil }
        return location
        }
}

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        self.arrayModel.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.arrayModel[section].first?.date.fullDateToName()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayModel[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: WeatherCell.reuseIdentifier, for: indexPath)
        
        if let cell = cell as? WeatherCell {
            cell.setProperties(image: self.arrayModel[indexPath.section][indexPath.row].weather[0].icon,
                               time: self.arrayModel[indexPath.section][indexPath.row].date.fullDateToTime() ?? "Error",
                               decription: self.arrayModel[indexPath.section][indexPath.row].weather[0].main,
                               temp: "\(Int(self.arrayModel[indexPath.section][indexPath.row].main.temperature))°")
            cell.selectionStyle = .none
        }
        return cell
    }
}
