//
//  NetworkError.swift
//  TestWeatherApp
//
//  Created by Artur on 22.04.2021.
//

import Foundation

enum NetworkError {
    case incorrectUrl
    case incorrectRequest
    case networkError(error: Error)
    case serverError(statusCode: Int)
    case parsingError(error: Error)
    case unknown
}
