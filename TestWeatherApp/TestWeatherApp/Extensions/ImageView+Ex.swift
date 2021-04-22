//
//  ImageView+Ex.swift
//  TestWeatherApp
//
//  Created by Artur on 22.04.2021.
//

import UIKit

extension UIImageView {
    func load(with url: String) {
        DispatchQueue.global().async {
            guard let url = URL(string: url),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
