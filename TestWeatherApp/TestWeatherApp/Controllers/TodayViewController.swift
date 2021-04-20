//
//  TodayViewController.swift
//  TestWeatherApp
//
//  Created by Artur on 20.04.2021.
//

import UIKit

class TodayViewController: UIViewController {

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

    }
    
    // MARK: - Actions
    @IBAction func pressButtonShare(_ sender: Any) {
    }
}
