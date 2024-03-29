//
//  DateAndRepeatViewController.swift
//  Workout App
//
//  Created by Evgenii Lukin on 29.06.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGreen
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    private let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = .specialGreen
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    private let dateLabel = UILabel(text: "Date",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private let repeatLabel = UILabel(text: "Repeat every 7 days",
                                      font: .robotoMedium18(),
                                      textColor: .specialGray)
    
    private var dateStackView = UIStackView()
    private var repeatStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        
        dateStackView = UIStackView(arrangedSubviews: [dateLabel,
                                                       datePicker],
                                    axis: .horizontal,
                                    spacing: 10)
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel,
                                                         repeatSwitch],
                                      axis: .horizontal,
                                      spacing: 10)
    }
    
    private func setupViews() {
        
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(dateStackView)
        addSubview(repeatStackView)
    }
    
    private func getDateAndRepeat() -> (Date, Bool) {
        (datePicker.date, repeatSwitch.isOn)
    }
    
    private func refreshWorkoutObjects() {
        
        datePicker.setDate(Date(), animated: true)
        repeatSwitch.isOn = true
    }
    
    public func refreshDatePickerAndSwitch() {
        refreshWorkoutObjects()
    }
    
    public func setDateAndRepeat() -> (Date, Bool) {
        getDateAndRepeat()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
