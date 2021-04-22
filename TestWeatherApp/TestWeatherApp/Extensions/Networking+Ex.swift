//
//  Networking+Ex.swift
//  TestWeatherApp
//
//  Created by Artur on 22.04.2021.
//

import Foundation

extension Networking {
    /// Method for get url from several parts
    func getUrlWith(url: String, path: String) -> URL? {
        guard let components = URLComponents(string: url + path) else { return nil }
        return components.url
    }
}
