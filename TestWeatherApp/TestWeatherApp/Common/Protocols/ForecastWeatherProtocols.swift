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
    func handleError(error: NetworkError)
}

protocol ForecastWeatherViewPresenter {
    init(view: ForecastWeatherView)
    func updateForecastWeatherView()
}

