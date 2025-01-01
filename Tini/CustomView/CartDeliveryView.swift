//
//  CartDeliveryView.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import UIKit

protocol CartDeliveryViewDelegate: AnyObject {
    func didTapDeliveryAddress()
}

class CartDeliveryView: UIView {
    
    weak var delegate: CartDeliveryViewDelegate?
    
    private let storeLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = Images.storeIcon
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.tintColor = UIColor(hex: Colors.primary)
        return logo
    }()
    
    private let fromLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#28282B")
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "From store"
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
    
    private let locationLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = Images.liveLocationIcon
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.tintColor = UIColor(hex: "#00AB56")
        return logo
    }()
    
    private let toLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#28282B")
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "To"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let deliveryAddress: UILabel = {
        let address = UILabel()
        address.textColor = UIColor(hex: Colors.titleText)
        address.font = .systemFont(ofSize: 14, weight: .bold)
        address.text = "13 Han Thuyen, D.1, HCM city"
        address.translatesAutoresizingMaskIntoConstraints = false
        return address
    }()
    
    private let descriptionText: UILabel = {
        let descriptionText = UILabel()
        descriptionText.text = "Nick 0896969696"
        descriptionText.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        descriptionText.textColor = UIColor(hex: Colors.secondary)
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        return descriptionText
    }()
    
//    private let rightIcon: UIImageView = {
//        let icon = UIImageView()
//        icon.image = Images.rightIcon
//        icon.contentMode = .scaleAspectFit
//        icon.translatesAutoresizingMaskIntoConstraints = false
//        icon.tintColor = UIColor(hex: Colors.secondary)
//        return icon
//    }()
    
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
        rightIcon.addTarget(self, action: #selector(selectAddress), for: .touchUpInside)
    }
    
    @objc private func selectAddress() {
        delegate?.didTapDeliveryAddress()
    }
    
    private func setupUI() {
        addSubview(storeLogo)
        addSubview(fromLabel)
        addSubview(storeAddress)
        addSubview(separator)
        addSubview(locationLogo)
        addSubview(toLabel)
        addSubview(rightIcon)
        addSubview(deliveryAddress)
        addSubview(descriptionText)
        
        
        NSLayoutConstraint.activate([
            storeLogo.topAnchor.constraint(equalTo: topAnchor),
            storeLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            storeLogo.widthAnchor.constraint(equalToConstant: 20),
            storeLogo.heightAnchor.constraint(equalToConstant: 20),
            
            fromLabel.topAnchor.constraint(equalTo: topAnchor),
            fromLabel.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 10),
            
            storeAddress.topAnchor.constraint(equalTo: fromLabel.bottomAnchor, constant: 4),
            storeAddress.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 10),
            
            separator.topAnchor.constraint(equalTo: storeAddress.bottomAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            locationLogo.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            locationLogo.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationLogo.widthAnchor.constraint(equalToConstant: 16),
            locationLogo.heightAnchor.constraint(equalToConstant: 20),
            
            toLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8),
            toLabel.leadingAnchor.constraint(equalTo: locationLogo.trailingAnchor, constant: 12),
            
            rightIcon.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 35),
            rightIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rightIcon.widthAnchor.constraint(equalToConstant: 12),
            rightIcon.heightAnchor.constraint(equalToConstant: 18),
            
            deliveryAddress.topAnchor.constraint(equalTo: toLabel.bottomAnchor, constant: 4),
            deliveryAddress.leadingAnchor.constraint(equalTo: locationLogo.trailingAnchor, constant: 12),
            deliveryAddress.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16),
            
            descriptionText.topAnchor.constraint(equalTo: deliveryAddress.bottomAnchor, constant: 4),
            descriptionText.leadingAnchor.constraint(equalTo: locationLogo.trailingAnchor, constant: 12),
            descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
        ])
    }
    
}
