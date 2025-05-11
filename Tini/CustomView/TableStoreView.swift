//
//  TableStoreView.swift
//  Tini
//
//  Created by Omodauda on 09/05/2025.
//

import UIKit

class TableStoreView: UIView {
    
    private let storeLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.storeIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(hex: Colors.primary)
        return imageView
    }()
    
    private let storeName: UILabel = {
        let label = UILabel()
        label.text = "SB CMT8"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()
    
    private let storeAddress: UILabel = {
        let label = UILabel()
        label.text = "24 bis Cach Mang Thang 8, D.3, HCM Adeniji Lagos, Marina, Nigeria, Africa"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.titleText)
        label.numberOfLines = 1
        return label
    }()
    
    private let rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.rightIcon
        imageView.tintColor = UIColor(hex: Colors.secondary)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        
        addSubview(storeLogo)
        addSubview(rightIcon)
        addSubview(storeName)
        addSubview(storeAddress)
        
        NSLayoutConstraint.activate([
            storeLogo.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            storeLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            storeLogo.widthAnchor.constraint(equalToConstant: 20),
            storeLogo.heightAnchor.constraint(equalToConstant: 20),
            
            rightIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            rightIcon.widthAnchor.constraint(equalToConstant: 8),
            rightIcon.heightAnchor.constraint(equalToConstant: 14),
            
            storeName.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            storeName.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 8),
            storeName.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16),
            
            storeAddress.topAnchor.constraint(equalTo: storeName.bottomAnchor, constant: 4),
            storeAddress.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 8),
            storeAddress.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16),
            storeAddress.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
}
