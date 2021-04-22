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
    let locationManager = CLLocationManager()
    var model: ModelCurrentWeather?
    var location: CLLocationCoordinate2D? {
        didSet {
            let presenter = CurrentWeatherPresenter(view: self)
            presenter.updateCurrentWeatherView()
        }
    }
    
    // MARK: - Outlets
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
   
    }
    
    func setParameters(model: ModelCurrentWeather) {
        self.mainImage.load(with: "http://openweathermap.org/img/w/\(model.weather[0].icon ?? " ").png")
        
        self.cityNameLabel.text = model.name
        self.temperatureLabel.text = "\(Int(model.main.temperature))°C"
        self.tempDiscriptionLabel.text = model.weather[0].main
        self.humidityLabel.text = "\(model.main.humidity)"
        self.precipitationLabel.text = "\(model.rain?.oneHour ?? model.snow?.oneHour ?? 0.0)"
        self.pressureLabel.text = "\(model.main.pressure)"
        self.speedOfWindLabel.text = "\(model.wind?.speed ?? 0.0)"
        
        guard let wind = model.wind else { return }
        switch wind.degrees {
        case 0.0...11.24:
            self.directionOfWind.text = "N"
        case 11.25...33.74:
            self.directionOfWind.text = "NNE"
        case 33.75...56.24:
            self.directionOfWind.text = "NE"
        case 56.25...78.74:
            self.directionOfWind.text = "ENE"
        case 78.25...101.24:
            self.directionOfWind.text = "E"
        case 101.25...123.74:
            self.directionOfWind.text = "ESE"
        case 123.75...146.24:
            self.directionOfWind.text = "SE"
        case 146.25...168.74:
            self.directionOfWind.text = "SSE"
        case 168.75...191.24:
            self.directionOfWind.text = "S"
        case 191.25...213.74:
            self.directionOfWind.text = "SSW"
        case 213.75...236.24:
            self.directionOfWind.text = "SW"
        case 236.25...258.74:
            self.directionOfWind.text = "WSW"
        case 258.75...281.24:
            self.directionOfWind.text = "W"
        case 281.25...303.74:
            self.directionOfWind.text = "WNW"
        case 303.75...326.24:
            self.directionOfWind.text = "NW"
        case 326.25...348.74:
            self.directionOfWind.text = "NNW"
        case 348.75...360.0:
            self.directionOfWind.text = "N"
        default:
            self.directionOfWind.text = "- -"
        }
        
    }
    
    func setPropertiesLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func getLocation() -> CLLocationCoordinate2D? {
        self.location
    }
    
    // MARK: - Actions
    @IBAction func pressButtonShare(_ sender: Any) {
        let presenter = CurrentWeatherPresenter(view: self)
        presenter.updateCurrentWeatherView()
    }
}
