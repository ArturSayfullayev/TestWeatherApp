//
//  TodayViewController.swift
//  TestWeatherApp
//
//  Created by Artur on 20.04.2021.
//

import UIKit
import CoreLocation

class TodayViewController: UIViewController, CurrentWeatherView {
    // MARK: - Properties
    private var temperatureForShare: Int?
    let locationManager = CLLocationManager()
    var location: CLLocationCoordinate2D? {
        didSet {
            let presenter = CurrentWeatherPresenter(view: self)
            presenter.updateCurrentWeatherView()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var tempDiscriptionLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var speedOfWindLabel: UILabel!
    @IBOutlet weak var directionOfWind: UILabel!
 
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.setPropertiesLocationManager()
        self.setProperties()
    }
    
    // MARK: - Methods
    private func setProperties() {
        self.button.layer.borderWidth = 1
        self.button.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        self.temperatureLabel.textColor = UIColor(named: "TextColor")
        self.tempDiscriptionLabel.textColor = UIColor(named: "TextColor")
    }
    
    private func shareTemperature() {
        guard let temperature = temperatureForShare else { return }
        let alert = ShareAlert.shared.shareAlert(message: temperature)
        self.present(alert, animated: true)
    }
    
    private func setPropertiesLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func setParameters(model: ModelCurrentWeather) {
        self.mainImage.load(with: "http://openweathermap.org/img/w/\(model.weather[0].icon ?? " ").png")
        
        self.cityNameLabel.text = model.name
        self.temperatureLabel.text = "\(Int(model.main.temperature))°C"
        self.tempDiscriptionLabel.text = model.weather[0].main
        self.humidityLabel.text = "\(model.main.humidity)%"
        self.precipitationLabel.text = "\(model.rain?.oneHour ?? model.snow?.oneHour ?? 0.0) mm"
        self.pressureLabel.text = "\(model.main.pressure) hPa"
        self.speedOfWindLabel.text = "\(model.wind?.speed ?? 0.0) km/h"
        self.directionOfWind.text = model.wind?.degrees.directionOfWind()
        
        self.temperatureForShare = Int(model.main.temperature)
    }
    
    func handleError(error: NetworkError) {
        let alert = ErrorAlert.shared.errorAlert(error: error)
        self.present(alert, animated: true)
    }
    
    func getLocation() -> CLLocationCoordinate2D? {
        self.location
    }
    
    // MARK: - Actions
    @IBAction func pressButtonShare(_ sender: Any) {
        self.shareTemperature()
    }
}
