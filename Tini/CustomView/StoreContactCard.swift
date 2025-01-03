//
//  StoreContactCard.swift
//  Tini
//
//  Created by Omodauda on 03/01/2025.
//

import UIKit

class StoreContactCard: UIView {
    
    private let phoneIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.phoneIcon
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor(hex: "#00AB56")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .left
        label.text = "Phone number"
        return label
    }()
    
    private let phone: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .left
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: Colors.tetiary)
        return view
    }()
    
    private let addressIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.liveLocationIcon
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(hex: Colors.primary)
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .left
        label.text = "Address"
        return label
    }()
    
    private let address: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .left
        return label
    }()

    init(phone: String, address: String){
        super.init(frame: .zero)
        self.phone.text = phone
        self.address.text = address
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        layer.cornerRadius = 8
        backgroundColor = .white
        
        addSubview(phoneIcon)
        addSubview(phoneLabel)
        addSubview(phone)
        addSubview(separator)
        addSubview(addressIcon)
        addSubview(addressLabel)
        addSubview(address)
        
        NSLayoutConstraint.activate([
            phoneIcon.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            phoneIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            phoneIcon.widthAnchor.constraint(equalToConstant: 18),
            phoneIcon.heightAnchor.constraint(equalToConstant: 18),
            
            phoneLabel.centerYAnchor.constraint(equalTo: phoneIcon.centerYAnchor),
            phoneLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 11),
            
            phone.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 4),
            phone.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 11),
            
            separator.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            addressIcon.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            addressIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            addressIcon.widthAnchor.constraint(equalToConstant: 16),
            addressIcon.heightAnchor.constraint(equalToConstant: 20),
            
            addressLabel.centerYAnchor.constraint(equalTo: addressIcon.centerYAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: addressIcon.trailingAnchor, constant: 11),
            
            address.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 4),
            address.leadingAnchor.constraint(equalTo: addressIcon.trailingAnchor, constant: 11),
            address.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
        ])
    }
}
