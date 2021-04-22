//
//  ForecastWeatherPresenter.swift
//  TestWeatherApp
//
//  Created by Artur on 21.04.2021.
//

import Foundation

class ForecastWeatherPresenter: ForecastWeatherViewPresenter {
    unowned let view: ForecastWeatherView
    
    required init(view: ForecastWeatherView) {
        self.view = view
    }
    
    func updateForecastWeatherView() {
        guard let location = self.view.getLocation() else { return }
        
        let apiKey = "5fa178657ab4ab84ce6607386b62a7dc"
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?lat=\(location.latitude)&lon=\(location.longitude)&units=metric&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared
        task.dataTask(with: url) { (data, _, error) in
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(ModelForecastWeather.self, from: data)
                    DispatchQueue.main.async {
                        self.view.setParameters(model: model)
                    }
                } catch {
                    Swift.debugPrint(error)
                }
            }
        }.resume()
    }
}
