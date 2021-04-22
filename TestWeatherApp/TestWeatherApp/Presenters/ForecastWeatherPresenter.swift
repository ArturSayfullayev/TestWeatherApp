//
//  ForecastWeatherPresenter.swift
//  TestWeatherApp
//
//  Created by Artur on 21.04.2021.
//

import Foundation

class ForecastWeatherPresenter: ForecastWeatherViewPresenter {
    // MARK: - Properties
    unowned let view: ForecastWeatherView
    
    // MARK: - Initialization
    required init(view: ForecastWeatherView) {
        self.view = view
    }
    
    // MARK: - Methods
    func updateForecastWeatherView() {
        guard let location = self.view.getLocation() else { return }
        let apiKey = "5fa178657ab4ab84ce6607386b62a7dc"
        let urlPath = "forecast?lat=\(location.latitude)&lon=\(location.longitude)&units=metric&appid=\(apiKey)"
        Networking.shared.request(
            url: urlPath,
            successHandler: { (model: ModelForecastWeather) in
                self.view.setParameters(model: model)
            },
            errorHandler: { (error: NetworkError) in
                Swift.debugPrint(error)
                self.view.handleError(error: error)
            })
    }
}
