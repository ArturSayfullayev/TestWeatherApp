//
//  Double+Ex.swift
//  TestWeatherApp
//
//  Created by Artur on 28.04.2021.
//

extension Double {
    func directionOfWind() -> String {
        let direction = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
        let index = Int((self + 11.25).truncatingRemainder(dividingBy: 360) / 22.5)
        return direction[index]
    }
}
