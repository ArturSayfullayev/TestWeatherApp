//
//  String+Ex.swift
//  TestWeatherApp
//
//  Created by Artur on 22.04.2021.
//

import Foundation

extension String {
    func fullDateToDay() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: self) else { return nil }
        dateFormatter.dateFormat = "yyyy-MM-dd"
    
        return dateFormatter.string(from: date)
    }
    
    func fullDateToTime() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: self) else { return nil }
        dateFormatter.dateFormat = "HH:mm"
    
        return dateFormatter.string(from: date)
    }
    
    func fullDateToName() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: self) else { return nil }
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let today = dateFormatter.string(from: Date())
        let day = dateFormatter.string(from: date)
        
        if today == day {
            return "Today"
        } else {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
        }
    }
}
