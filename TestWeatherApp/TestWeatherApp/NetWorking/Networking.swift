//
//  Networking.swift
//  TestWeatherApp
//
//  Created by Artur on 22.04.2021.
//

import Foundation

class Networking {
    // MARK: - Static
    static let shared = Networking()
    
    // MARK: - Variables
    private let baseUrl: String = "http://api.openweathermap.org/data/2.5/"
    
    // MARK: - Methods
    /// Generic request method
    func request<Generic: Decodable>(url: String,
                                     successHandler: @escaping (Generic) -> Void,
                                     errorHandler: @escaping (NetworkError) -> Void) {
        
        // Generate url with baseUrl, path and parameters
        guard let fullUrl = self.getUrlWith(url: self.baseUrl,
                                            path: url) else {
            errorHandler(.incorrectUrl)
            return
        }
        
        // let request = URLRequest(url: fullUrl)
        let task = URLSession.shared
        task.dataTask(with: fullUrl) { data, response, error in
            if let error = error {
                // Network error handling
                DispatchQueue.main.async {
                    errorHandler(.networkError(error: error))
                }
                return
                
            } else if let data: Data = data,
                      let response: HTTPURLResponse = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200..<300:
                    // Success server response handling
                    do {
                        let model = try JSONDecoder().decode(Generic.self, from: data)
                        DispatchQueue.main.async {
                            successHandler(model)
                        }
                    } catch let error {
                        DispatchQueue.main.async {
                            errorHandler(.parsingError(error: error))
                        }
                    }
                case 400..<500:
                    // Handle incorrect request
                    DispatchQueue.main.async {
                        errorHandler(.incorrectRequest)
                    }
                case 500...:
                    // Handle server errors
                    DispatchQueue.main.async {
                        errorHandler(.serverError(statusCode: response.statusCode))
                    }
                default:
                    // Handle every unknown error
                    DispatchQueue.main.async {
                        errorHandler(.unknown)
                    }
                }
            }
        }.resume()
    }
}
