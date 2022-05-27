//
//  WeatherView.swift
//  Workout App
//
//  Created by MacBook on 07.04.2022.
//

import UIKit

class WeatherView: UIView {
    
    private let weatherIcomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let weatherDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .specialGray
        label.font = .robotoMedium14()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(weatherIcomImageView)
        addSubview(weatherStatusLabel)
        addSubview(weatherDiscriptionLabel)
        
    }

}

extension WeatherView {
    
    private func setContraints() {
        
        NSLayoutConstraint.activate([
            weatherIcomImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIcomImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherIcomImageView.widthAnchor.constraint(equalToConstant: 60),
            weatherIcomImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            weatherStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherStatusLabel.trailingAnchor.constraint(equalTo: weatherIcomImageView.leadingAnchor, constant: -10),
            weatherStatusLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            weatherDiscriptionLabel.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor, constant: 0),
            weatherDiscriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherDiscriptionLabel.trailingAnchor.constraint(equalTo: weatherIcomImageView.leadingAnchor, constant: -10),
            weatherDiscriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}

