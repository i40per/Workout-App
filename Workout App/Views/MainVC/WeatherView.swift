//
//  WeatherView.swift
//  Workout App
//
//  Created by Evgenii Lukin on 07.04.2022.
//

import UIKit

class WeatherView: UIView {
    
    private let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let weatherDiscriptionLabel: UILabel = {
        let label = UILabel()
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
        
        addSubview(weatherIconImageView)
        addSubview(weatherStatusLabel)
        addSubview(weatherDiscriptionLabel)
    }
    
    private func updateLabel(model: WeatherModel) {
        weatherStatusLabel.text = model.weather[0].myDescription + " \(model.main.temperatureCelsius)°C"
        
        switch model.weather[0].weatherDescription {

        case "clear sky":
            weatherDiscriptionLabel.text = "Отличный день для прогулки"
        case "few clouds":
            weatherDiscriptionLabel.text = "Возможны осадки"
        case "scattered clouds":
            weatherDiscriptionLabel.text = "Возможны осадки"
        case "broken clouds":
            weatherDiscriptionLabel.text = "Возможны осадки"
        case "shower rain":
            weatherDiscriptionLabel.text = "Лучше захватить с собой зонт"
        case "rain":
            weatherDiscriptionLabel.text = "Лучше захватить с собой зонт"
        case "thunderstorm":
            weatherDiscriptionLabel.text = "Лучше остаться дома и провести домашнюю тренировку"
        case "snow":
            weatherDiscriptionLabel.text = "Лучше одеться потеплее"
        case "mist":
            weatherDiscriptionLabel.text = "Будте внимательны на дороге"
        default :
            weatherDiscriptionLabel.text = "Нет данных о погоде"
        }
    }
    
    private func updateImage(data: Data) {
        
        guard let image = UIImage(data: data) else { return }
        weatherIconImageView.image = image
    }
    
    public func setWeather(model: WeatherModel) {
        updateLabel(model: model)
    }
    
    public func setImage(data: Data) {
        updateImage(data: data)
    }
}

extension WeatherView {
    
    private func setContraints() {
        
        NSLayoutConstraint.activate([
            weatherIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 60),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 60),
            
            weatherStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherStatusLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor, constant: -10),
            weatherStatusLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weatherDiscriptionLabel.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor, constant: 0),
            weatherDiscriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherDiscriptionLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor, constant: -10),
            weatherDiscriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
