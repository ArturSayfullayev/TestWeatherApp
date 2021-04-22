//
//  CurrentWeatherPresenter.swift
//  TestWeatherApp
//
//  Created by Artur on 20.04.2021.
//

import UIKit

class CurrentWeatherPresenter: CurrentWeatherViewPresenter {
    // MARK: - Properties
    unowned let view: CurrentWeatherView
    
    // MARK: - Initialization
    required init(view: CurrentWeatherView) {
        self.view = view
    }
    
    // MARK: - Methods
    func updateCurrentWeatherView() {
        guard let location = self.view.getLocation() else { return }
        let apiKey = "5fa178657ab4ab84ce6607386b62a7dc"
        let urlPath = "weather?lat=\(location.latitude)&lon=\(location.longitude)&units=metric&appid=\(apiKey)"
        Networking.shared.request(
            url: urlPath,
            successHandler: { (model: ModelCurrentWeather) in
                self.view.setParameters(model: model)
            },
            errorHandler: { (error: NetworkError) in
                self.view.handleError(error: error)
            })
    }
}
