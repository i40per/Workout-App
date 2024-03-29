//
//  ProfileCollectionViewCell.swift
//  Workout App
//
//  Created by Evgenii Lukin on 03.09.2022.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "PUSH UPS"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoBold24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let workoutImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "1")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "180"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoBold48()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        layer.cornerRadius = 20
        backgroundColor = .specialDarkYellow
        
        addSubview(nameLabel)
        addSubview(workoutImageView)
        addSubview(numberLabel)
    }
    
    func cellConfigure(model: ResultWorkout) {
        
        nameLabel.text = model.name
        numberLabel.text = "\(model.result)"
        
        guard let data = model.imageData else { return }
        let image = UIImage(data: data)
        workoutImageView.image = image
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            workoutImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            workoutImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            workoutImageView.heightAnchor.constraint(equalToConstant: 57),
            workoutImageView.widthAnchor.constraint(equalToConstant: 57),
            
            numberLabel.centerYAnchor.constraint(equalTo: workoutImageView.centerYAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: workoutImageView.trailingAnchor, constant: 10)
        ])
    }
}
