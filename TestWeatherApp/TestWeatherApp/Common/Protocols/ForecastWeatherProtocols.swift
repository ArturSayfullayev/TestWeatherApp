//
//  ForecastWeatherProtocols.swift
//  TestWeatherApp
//
//  Created by Artur on 21.04.2021.
//

import CoreLocation

protocol ForecastWeatherView: class {
    func setParameters(model: ModelForecastWeather)
    func getLocation() -> CLLocationCoordinate2D?
}

protocol ForecastWeatherViewPresenter {
    init(view: ForecastWeatherView)
    func updateForecastWeatherView()
}

