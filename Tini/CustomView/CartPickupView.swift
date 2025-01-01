//
//  CartPickupView.swift
//  Tini
//
//  Created by Omodauda on 01/01/2025.
//

import UIKit

protocol CartPickupViewDelegate: AnyObject {
    func didTapTime()
}

class CartPickupView: UIView {
    
    weak var delegate: CartPickupViewDelegate?

    private let locationLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = Images.liveLocationIcon
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.tintColor = UIColor(hex: Colors.primary)
        return logo
    }()
    
    private let pickLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#28282B")
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Pick up location"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let storeAddress: UILabel = {
        let address = UILabel()
        address.textColor = UIColor(hex: Colors.titleText)
        address.font = .systemFont(ofSize: 14, weight: .bold)
        address.text = "13 Han Thuyen, D.1, HCM city"
        address.numberOfLines = 1
        address.translatesAutoresizingMaskIntoConstraints = false
        return address
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.tetiary)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = Images.clockIcon
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.tintColor = UIColor(hex: "#FC820A")
        return logo
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#28282B")
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Pick up time"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let time: UILabel = {
        let address = UILabel()
        address.textColor = UIColor(hex: Colors.titleText)
        address.font = .systemFont(ofSize: 14, weight: .bold)
        address.text = "10:00, Today"
        address.translatesAutoresizingMaskIntoConstraints = false
        return address
    }()
    
    private let rightIcon: UIButton = {
        let icon = UIButton()
        icon.setImage(Images.rightIcon, for: .normal)
        icon.tintColor = UIColor(hex: Colors.secondary)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        configureSelectBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSelectBtn() {
        rightIcon.addTarget(self, action: #selector(selectTime), for: .touchUpInside)
    }
    
    @objc private func selectTime() {
        delegate?.didTapTime()
    }
    
    private func setupUI() {
        addSubview(locationLogo)
        addSubview(pickLabel)
        addSubview(storeAddress)
        addSubview(separator)
        addSubview(timeLogo)
        addSubview(timeLabel)
        addSubview(time)
        addSubview(rightIcon)
        
        NSLayoutConstraint.activate([
            locationLogo.topAnchor.constraint(equalTo: topAnchor),
            locationLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationLogo.widthAnchor.constraint(equalToConstant: 20),
            locationLogo.heightAnchor.constraint(equalToConstant: 20),
            
            pickLabel.topAnchor.constraint(equalTo: topAnchor),
            pickLabel.leadingAnchor.constraint(equalTo: locationLogo.trailingAnchor, constant: 10),
            
            storeAddress.topAnchor.constraint(equalTo: pickLabel.bottomAnchor, constant: 4),
            storeAddress.leadingAnchor.constraint(equalTo: locationLogo.trailingAnchor, constant: 10),
            
            separator.topAnchor.constraint(equalTo: storeAddress.bottomAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            timeLogo.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            timeLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            timeLogo.widthAnchor.constraint(equalToConstant: 16),
            timeLogo.heightAnchor.constraint(equalToConstant: 20),
            
            timeLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8),
            timeLabel.leadingAnchor.constraint(equalTo: timeLogo.trailingAnchor, constant: 12),
            
            rightIcon.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 35),
            rightIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rightIcon.widthAnchor.constraint(equalToConstant: 12),
            rightIcon.heightAnchor.constraint(equalToConstant: 18),
            
            time.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 4),
            time.leadingAnchor.constraint(equalTo: timeLogo.trailingAnchor, constant: 12),
            time.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16),
            time.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
