//
//  ShareAlert.swift
//  TestWeatherApp
//
//  Created by Artur on 22.04.2021.
//

import UIKit

class ShareAlert {
    // MARK: - Static properties
    static let shared = ShareAlert()
    
    // MARK: - Methods
    func shareAlert(message: Int) -> UIAlertController {
        let title: String = "Hello!"
        let fullMessage: String = "Today \(format: message) degrees!"
        
        let alert = UIAlertController(
            title: title,
            message: fullMessage,
            preferredStyle: .actionSheet)
        alert.addAction(
            UIAlertAction(
                title: "ОК",
                style: .default,
                handler: nil ))
        return alert
    }
}
