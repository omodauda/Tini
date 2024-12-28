//
//  MenuListTableViewCell.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

class MenuListTableViewCell: UITableViewCell {
    
    static let identifier: String = "MenuListTableViewCell"
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let productName: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 14, weight: .regular)
        nameLabel.textColor = UIColor(hex: Colors.titleText)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let productPrice: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = .systemFont(ofSize: 14, weight: .bold)
        priceLabel.textColor = UIColor(hex: Colors.titleText)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    private let availabilityLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = .systemFont(ofSize: 10, weight: .regular)
        priceLabel.textColor = UIColor(hex: Colors.titleText)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(product: Product) {
        productImageView.image = product.image
        productName.text = product.name
        productPrice.text = String(product.basePrice)
        
        let alpha: CGFloat = product.isAvailable ? 1 : 0.3
        productImageView.alpha = alpha
        productName.alpha = alpha
        productPrice.alpha = alpha
        contentView.alpha = alpha
        
        if !product.isAvailable {
            availabilityLabel.text = "Not available at this store"
        }
    }
    
    private func setupUI() {
        backgroundView = UIView()
        backgroundView?.backgroundColor = .white
        
        addSubview(productImageView)
        addSubview(productName)
        addSubview(productPrice)
        addSubview(availabilityLabel)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 68),
            productImageView.heightAnchor.constraint(equalToConstant: 68),
            
            productName.topAnchor.constraint(equalTo: topAnchor),
            productName.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16),
            productName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 4),
            productPrice.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16),
            productPrice.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            availabilityLabel.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 4),
            availabilityLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16),
            availabilityLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

}
