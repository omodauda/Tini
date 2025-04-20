//
//  OrderItemView.swift
//  Tini
//
//  Created by Omodauda on 19/04/2025.
//

import UIKit

class OrderItemView: UIView {
    
    private let orderItem: CartItemModel
    
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let productName: UILabel = {
        let name = UILabel()
        name.font = .systemFont(ofSize: 14, weight: .bold)
        name.textColor = UIColor(hex: Colors.titleText)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let size: UILabel = {
        let size = UILabel()
        size.font = .systemFont(ofSize: 12, weight: .regular)
        size.textColor = UIColor(hex: Colors.secondary)
        size.translatesAutoresizingMaskIntoConstraints = false
        return size
    }()
    
    private let amount: UILabel = {
        let amount = UILabel()
        amount.font = .systemFont(ofSize: 14, weight: .bold)
        amount.textColor = UIColor(hex: Colors.titleText)
        amount.translatesAutoresizingMaskIntoConstraints = false
        return amount
    }()

    init(item: CartItemModel) {
        self.orderItem = item
        super.init(frame: .zero)
        setupUI()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        productImage.image = orderItem.productImage
        productName.text = orderItem.productName
        size.text = "Size: \(orderItem.size ?? "")"
        amount.text = "\(orderItem.totalPrice) x \(orderItem.quantity)"
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(productImage)
        addSubview(productName)
        addSubview(size)
        addSubview(amount)
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: topAnchor),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImage.widthAnchor.constraint(equalToConstant: 40),
            productImage.heightAnchor.constraint(equalToConstant: 40),
            
            productName.topAnchor.constraint(equalTo: topAnchor),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            productName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            size.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 4),
            size.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            size.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            amount.topAnchor.constraint(equalTo: size.bottomAnchor, constant: 4),
            amount.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            amount.trailingAnchor.constraint(equalTo: trailingAnchor),
            amount.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
}
