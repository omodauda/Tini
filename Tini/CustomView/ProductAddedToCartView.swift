//
//  ProductAddedToCartView.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import UIKit

protocol ProductAddedToCartViewDelegate: AnyObject {
    func didTap()
}

class ProductAddedToCartView: UIView {
    
    weak var delegate: ProductAddedToCartViewDelegate?
    
    let iconWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        return view
    }()
    
    let cartIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.cartIcon
        imageView.tintColor = UIColor(hex: Colors.primary)
        return imageView
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "#A6A6B0")
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    let rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.rightIcon
        imageView.tintColor = UIColor(hex: "#A6A6B0")
        return imageView
    }()

    init(total price: Double, quantity: Int, productName: String) {
        super.init(frame: .zero)
        totalLabel.text = String(price)
        itemLabel.text = "\(productName) (x\(quantity))"
        
        setupUI()
        addTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        delegate?.didTap()
    }
    
    private func setupUI() {
        backgroundColor = UIColor(hex: Colors.titleText)
        layer.cornerRadius = 8
        
        addSubview(iconWrapper)
        addSubview(totalLabel)
        addSubview(itemLabel)
        addSubview(rightIcon)
        
        iconWrapper.addSubview(cartIcon)
        
        NSLayoutConstraint.activate([
            iconWrapper.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            iconWrapper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            iconWrapper.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            iconWrapper.widthAnchor.constraint(equalToConstant: 36),
            iconWrapper.heightAnchor.constraint(equalToConstant: 36),
            
            cartIcon.centerXAnchor.constraint(equalTo: iconWrapper.centerXAnchor),
            cartIcon.centerYAnchor.constraint(equalTo: iconWrapper.centerYAnchor),
            cartIcon.widthAnchor.constraint(equalToConstant: 19),
            cartIcon.heightAnchor.constraint(equalToConstant: 19),
            
            rightIcon.centerYAnchor.constraint(equalTo: iconWrapper.centerYAnchor),
            rightIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            rightIcon.widthAnchor.constraint(equalToConstant: 8),
            rightIcon.heightAnchor.constraint(equalToConstant: 14),
            
            totalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            totalLabel.leadingAnchor.constraint(equalTo: iconWrapper.trailingAnchor, constant: 10),
            totalLabel.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16),
            
            itemLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 4),
            itemLabel.leadingAnchor.constraint(equalTo: iconWrapper.trailingAnchor, constant: 10),
            itemLabel.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16)
        ])
    }
}
