//
//  CurrentWeatherProtocols.swift
//  TestWeatherApp
//
//  Created by Artur on 20.04.2021.
//

import CoreLocation

protocol CurrentWeatherView: class {
    func setParameters(model: ModelCurrentWeather)
    func getLocation() -> CLLocationCoordinate2D?
}

protocol CurrentWeatherViewPresenter {
    init(view: CurrentWeatherView)
    func updateCurrentWeatherView()
}
