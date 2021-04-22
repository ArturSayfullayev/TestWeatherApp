//
//  WeatherCell.swift
//  TestWeatherApp
//
//  Created by Artur on 21.04.2021.
//

import UIKit
import SnapKit

class WeatherCell: UITableViewCell {
    // MARK: - Identifier
    static let reuseIdentifier: String = "WeatherCell"
    
    // MARK: - GUI Variables
    private lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Drop")
        return image
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left
        label.textColor = UIColor(named: "CellTextColor")
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left
        label.textColor = UIColor(named: "CellTextColor")
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        label.textColor = .systemBlue
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initView()
        self.constraints()
        self.contentView.backgroundColor = UIColor(named: "CellBackgroundColor")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        self.contentView.addSubview(self.mainImage)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.temperatureLabel)
    }
    
    // MARK: - Constraints
    private func constraints() {
        self.mainImage.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(10)
            make.height.width.equalTo(60)
        }
        self.timeLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(22)
            make.left.equalTo(self.mainImage.snp.right).offset(15)
        }
        self.descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.timeLabel.snp.bottom).offset(8)
            make.left.equalTo(self.mainImage.snp.right).offset(15)
        }
        self.temperatureLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(15)
            make.centerY.equalTo(self.mainImage)
        }
    }
    
    // MARK: - Methods
    func setProperties(image: String, time: String, decription: String, temp: String) {
        self.mainImage.load(with: "http://openweathermap.org/img/w/\(image).png")
        self.timeLabel.text = time
        self.descriptionLabel.text = decription
        self.temperatureLabel.text = temp
    }
}
