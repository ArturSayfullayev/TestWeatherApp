//
//  ErrorAlert.swift
//  TestWeatherApp
//
//  Created by Artur on 22.04.2021.
//

import UIKit

class ErrorAlert {
    // MARK: - Static properties
    static let shared = ErrorAlert()
    
    // MARK: - Methods
    func errorAlert (error: NetworkError) -> UIAlertController {
        let title: String = "Oops!"
        var message: String = ""
        switch error {
        case .incorrectUrl:
            message = "Incorrect URL"
        case .incorrectRequest:
            message = "Incorrect request"
        case .networkError(error: let error):
            message = "Network error. \(error.localizedDescription)"
        case .serverError(statusCode: let statusCode):
            message = "Server error \(statusCode)"
        case .parsingError(error: let error):
            message = "Parsing error. \(error.localizedDescription)"
        case .unknown:
            message = "Error"
        }
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: "ОК",
                style: .cancel,
                handler: nil ))
        return alert
    }
}
