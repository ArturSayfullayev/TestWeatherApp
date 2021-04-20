//
//  ForecastViewController.swift
//  TestWeatherApp
//
//  Created by Artur on 20.04.2021.
//

import UIKit

class ForecastViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = "123"
        return cell!
    }
    
    
}
