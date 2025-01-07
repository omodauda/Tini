//
//  OrderCell.swift
//  Tini
//
//  Created by Omodauda on 07/01/2025.
//

import UIKit

class OrderDeliveryCell: UITableViewCell {
    
    static let identifier = "OrderCell"
    
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
        statusView.layer.cornerRadius = 16
        return statusView
    }()
    
    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = .white
        statusLabel.font = .systemFont(ofSize: 14, weight: .medium)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private let orderDateLabel: UILabel = {
        let orderDateLabel = UILabel()
        orderDateLabel.textColor = UIColor(hex: Colors.secondary)
        orderDateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        orderDateLabel.translatesAutoresizingMaskIntoConstraints = false
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
        return address
    }()
    
    private let separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = UIColor(hex: Colors.secondary)
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
        return address
    }()
    
    private let orderItems: UILabel = {
        let items = UILabel()
        items.textColor = UIColor(hex: Colors.titleText)
        items.font = .systemFont(ofSize: 14, weight: .regular)
        items.translatesAutoresizingMaskIntoConstraints = false
        return items
    }()
    
    private let orderTotal: UILabel = {
        let total = UILabel()
        total.textColor = UIColor(hex: Colors.titleText)
        total.font = .systemFont(ofSize: 14, weight: .bold)
        total.translatesAutoresizingMaskIntoConstraints = false
        return total
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
