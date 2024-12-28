//
//  ProductCard.swift
//  Tini
//
//  Created by Omodauda on 28/12/2024.
//

import UIKit

class ProductCard: UIView {
    
    private let imagePlaceholder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: Colors.secondary)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dark, rich espresso lies in wait under a smoothed and stretched layer of thick milk foam. An alchemy of barista artistry and craft."
        label.numberOfLines = 3
        return label
    }()
    
    private let favBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(product: Product) {
        self.init()
        setupUI()
        configure(with: product)
    }
    
    private func configure(with product: Product) {
        imageView.image = product.image
        nameLabel.text = product.name
        priceLabel.text = String(product.basePrice)
        
        if product.isFavorite {
            favBtn.setImage(Images.favIcon, for: .normal)
        } else {
            favBtn.setImage(Images.favOutlineIcon, for: .normal)
            favBtn.tintColor = UIColor(hex: Colors.secondary)
        }
    }
    
    private func setupUI() {
        layer.cornerRadius = 8
        backgroundColor = .white
        
        addSubview(imagePlaceholder)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(aboutLabel)
        addSubview(favBtn)
        
        imagePlaceholder.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imagePlaceholder.topAnchor.constraint(equalTo: topAnchor),
            imagePlaceholder.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagePlaceholder.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagePlaceholder.heightAnchor.constraint(equalToConstant: 343),
            
            favBtn.topAnchor.constraint(equalTo: imagePlaceholder.bottomAnchor, constant: 12),
            favBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            favBtn.widthAnchor.constraint(equalToConstant: 24),
            favBtn.heightAnchor.constraint(equalToConstant: 24),
            
            nameLabel.topAnchor.constraint(equalTo: imagePlaceholder.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: favBtn.leadingAnchor, constant: -18),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: favBtn.leadingAnchor, constant: -18),
            
            aboutLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            aboutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            aboutLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            imageView.centerXAnchor.constraint(equalTo: imagePlaceholder.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imagePlaceholder.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}
