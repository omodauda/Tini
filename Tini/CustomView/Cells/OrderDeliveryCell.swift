//
//  OrderCell.swift
//  Tini
//
//  Created by Omodauda on 07/01/2025.
//

import UIKit

class OrderDeliveryCell: UITableViewCell {
    
    static let identifier = "OrderDeliveryCell"
    
    private let cellView: UIView = {
        let cellView = UIView()
        cellView.backgroundColor = .white
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.layer.cornerRadius = 8
        return cellView
    }()
    
    private let statusView: UIView = {
        let statusView = UIView()
        statusView.backgroundColor = .red
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusView.layer.cornerRadius = 14
        return statusView
    }()
    
    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = .blue
        statusLabel.font = .systemFont(ofSize: 14, weight: .medium)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Preparing"
        return statusLabel
    }()
    
    private let orderDateLabel: UILabel = {
        let orderDateLabel = UILabel()
        orderDateLabel.textColor = UIColor(hex: Colors.secondary)
        orderDateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        orderDateLabel.translatesAutoresizingMaskIntoConstraints = false
        orderDateLabel.text = "20/04/2020, 04:20"
        return orderDateLabel
    }()
    
    private let storeLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = Images.storeIcon
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let storeAddress: UILabel = {
        let address = UILabel()
        address.textColor = UIColor(hex: Colors.titleText)
        address.font = .systemFont(ofSize: 14, weight: .regular)
        address.translatesAutoresizingMaskIntoConstraints = false
        address.textAlignment = .left
        address.text = "13 Han Thuyen, D.1, HCM city"
        return address
    }()
    
    private let separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor(hex: "#EBEBF0")
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private let locationLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = Images.liveLocationIcon
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let deliveryAddress: UILabel = {
        let address = UILabel()
        address.textColor = UIColor(hex: Colors.titleText)
        address.font = .systemFont(ofSize: 14, weight: .regular)
        address.translatesAutoresizingMaskIntoConstraints = false
        address.text = "13 Han Thuyen, D.1, HCM city"
        return address
    }()
    
    private let orderItems: UILabel = {
        let items = UILabel()
        items.textColor = UIColor(hex: Colors.titleText)
        items.font = .systemFont(ofSize: 14, weight: .regular)
        items.translatesAutoresizingMaskIntoConstraints = false
        items.text = "Capucino (x1), Smoky hamburger (x1), Capucino (x1), Smoky hamburger (x1)"
        items.numberOfLines = 0
        items.lineBreakMode = .byWordWrapping
        return items
    }()
    
    private let orderTotal: UILabel = {
        let total = UILabel()
        total.textColor = UIColor(hex: Colors.titleText)
        total.font = .systemFont(ofSize: 14, weight: .bold)
        total.translatesAutoresizingMaskIntoConstraints = false
        total.text = "334.00"
        return total
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(cellView)
        cellView.addSubview(statusView)
        statusView.addSubview(statusLabel)
        cellView.addSubview(orderDateLabel)
        cellView.addSubview(storeLogo)
        cellView.addSubview(storeAddress)
        cellView.addSubview(separator)
        cellView.addSubview(locationLogo)
        cellView.addSubview(deliveryAddress)
        cellView.addSubview(orderItems)
        cellView.addSubview(orderTotal)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            statusView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 16),
            statusView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            
            statusLabel.topAnchor.constraint(equalTo: statusView.topAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 12),
            statusLabel.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -12),
            statusLabel.bottomAnchor.constraint(equalTo: statusView.bottomAnchor, constant: -8),
            
            orderDateLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 21),
            orderDateLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            
            storeLogo.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 22),
            storeLogo.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            storeLogo.widthAnchor.constraint(equalToConstant: 20),
            storeLogo.heightAnchor.constraint(equalToConstant: 20),
            
            storeAddress.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 10),
            storeAddress.centerYAnchor.constraint(equalTo: storeLogo.centerYAnchor),
            storeAddress.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            
            separator.topAnchor.constraint(equalTo: storeLogo.bottomAnchor, constant: 10),
            separator.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            locationLogo.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10),
            locationLogo.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            locationLogo.widthAnchor.constraint(equalToConstant: 16),
            locationLogo.heightAnchor.constraint(equalToConstant: 20),
            
            deliveryAddress.leadingAnchor.constraint(equalTo: locationLogo.trailingAnchor, constant: 10),
            deliveryAddress.centerYAnchor.constraint(equalTo: locationLogo.centerYAnchor),
            deliveryAddress.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            
            orderItems.topAnchor.constraint(equalTo: locationLogo.bottomAnchor, constant: 22),
            orderItems.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            orderItems.widthAnchor.constraint(equalToConstant: 230),
            orderItems.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -24),
            
            orderTotal.topAnchor.constraint(equalTo: locationLogo.bottomAnchor, constant: 22),
            orderTotal.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
        ])
    }
}
