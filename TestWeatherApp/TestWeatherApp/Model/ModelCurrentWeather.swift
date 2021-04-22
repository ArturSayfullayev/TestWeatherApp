//
//  ModelCurrentWeather.swift
//  TestWeatherApp
//
//  Created by Artur on 20.04.2021.
//

import Foundation

class ModelCurrentWeather: Decodable {
    var weather: [CurrentWeather]
    var main: CurrentMain
    var wind: CurrentWind?
    var rain: CurrentRain?
    var snow: CurrentSnow?
    var name: String
    var code: Int
    
    enum CodingKeys: String, CodingKey {
        case weather = "weather"
        case main = "main"
        case wind = "wind"
        case rain = "rain"
        case snow = "snow"
        case name = "name"
        case code = "cod"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.weather = try container.decode([CurrentWeather].self, forKey: .weather)
        self.main = try container.decode(CurrentMain.self, forKey: .main)
        self.wind = try container.decodeIfPresent(CurrentWind.self, forKey: .wind)
        self.rain = try container.decodeIfPresent(CurrentRain.self, forKey: .rain)
        self.snow = try container.decodeIfPresent(CurrentSnow.self, forKey: .snow)
        self.name = try container.decode(String.self, forKey: .name)
        self.code = try container.decode(Int.self, forKey: .code)
    }
}

class CurrentWeather: Decodable {
    var main: String?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case icon = "icon"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.main = try container.decodeIfPresent(String.self, forKey: .main)
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon)
    }
}

class CurrentMain: Decodable {
    var temperature: Double
    var pressure: Int
    var humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temperature = try container.decode(Double.self, forKey: .temperature)
        self.pressure = try container.decode(Int.self, forKey: .pressure)
        self.humidity = try container.decode(Int.self, forKey: .humidity)
    }
}

class CurrentWind: Decodable {
    var speed: Double
    var degrees: Double
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case degrees = "deg"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.speed = try container.decode(Double.self, forKey: .speed)
        self.degrees = try container.decode(Double.self, forKey: .degrees)
    }
}

class CurrentRain: Decodable {
    var oneHour: Double
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.oneHour = try container.decode(Double.self, forKey: .oneHour)
    }
}

class CurrentSnow: Decodable {
    var oneHour: Double
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.oneHour = try container.decode(Double.self, forKey: .oneHour)
    }
}
