//
//  ModelForecastWeather.swift
//  TestWeatherApp
//
//  Created by Artur on 21.04.2021.
//

import Foundation

enum Section: CaseIterable {
    case one, two, three, four, five
}


class ModelForecastWeather: Decodable {
    var list: [ForecastList]
    var city: ForecastCity
    
    enum CodingKeys: String, CodingKey {
        case list = "list"
        case city = "city"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.list = try container.decode([ForecastList].self, forKey: .list)
        self.city = try container.decode(ForecastCity.self, forKey: .city)
    }
}

class ForecastList: Decodable {
    var main: ForecastMain
    var weather: [ForecastWeather]
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case weather = "weather"
        case date = "dt_txt"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.main = try container.decode(ForecastMain.self, forKey: .main)
        self.weather = try container.decode([ForecastWeather].self, forKey: .weather)
        self.date = try container.decode(String.self, forKey: .date)
    }
}

class ForecastMain: Decodable {
    var temperature: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temperature = try container.decode(Double.self, forKey: .temperature)
    }
}

class ForecastWeather: Decodable {
    var main: String
    var icon: String
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case icon = "icon"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.main = try container.decode(String.self, forKey: .main)
        self.icon = try container.decode(String.self, forKey: .icon)
    }
}

class ForecastCity: Decodable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
    }
}

