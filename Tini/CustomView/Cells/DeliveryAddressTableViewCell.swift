//
//  DeliveryAddressTableViewCell.swift
//  Tini
//
//  Created by Omodauda on 13/12/2024.
//

import UIKit

class DeliveryAddressTableViewCell: UITableViewCell {

    static let identifier = "DeliveryAddressTableViewCell"
    
    private let cellView: UIView = {
        let cellView = UIView()
        cellView.backgroundColor = .white
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.layer.cornerRadius = 8
        return cellView
    }()
    
    private let locationIcon: UIImageView = {
        let locationIcon = UIImageView()
        locationIcon.image = Images.liveLocationIcon
        locationIcon.contentMode = .scaleAspectFit
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        return locationIcon
    }()
    
    private let addressText: UILabel = {
        let addressText = UILabel()
        addressText.font = .systemFont(ofSize: 14, weight: .medium)
        addressText.textColor = UIColor(hex: Colors.titleText)
        addressText.lineBreakMode = .byTruncatingTail
        addressText.translatesAutoresizingMaskIntoConstraints = false
        addressText.numberOfLines = 1
        return addressText
    }()
    
    private let recipientDetailText: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 12, weight: .regular)
        text.textColor = UIColor(hex: Colors.secondary)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.setImage(Images.trashIcon, for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.tintColor = UIColor(hex: Colors.secondary)
        return deleteButton
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(deliveryAddress: DeliveryAddressModel) {
        addressText.text = "\(deliveryAddress.address),\(deliveryAddress.city),\(deliveryAddress.district),\(deliveryAddress.ward)"
        recipientDetailText.text = "\(deliveryAddress.recipientName) - \(deliveryAddress.recipientPhoneNumber)"
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(cellView)
        
        cellView.addSubview(locationIcon)
        cellView.addSubview(addressText)
        cellView.addSubview(recipientDetailText)
        cellView.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            locationIcon.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            locationIcon.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            locationIcon.widthAnchor.constraint(equalToConstant: 16),
            locationIcon.heightAnchor.constraint(equalToConstant: 20),
            
            deleteButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -19),
            
            addressText.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            addressText.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 13),
            addressText.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -48),
            
            recipientDetailText.topAnchor.constraint(equalTo: addressText.bottomAnchor, constant: 4),
            recipientDetailText.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 13),
            recipientDetailText.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -48)
        ])
    }

}
