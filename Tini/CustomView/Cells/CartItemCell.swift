//
//  CartItemCell.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import UIKit

protocol CartItemCellDelegate: AnyObject {
    func didTapIncreaseQty(_ cell: CartItemCell)
    func didTapDecreaseQty(_ cell: CartItemCell)
}

class CartItemCell: UITableViewCell {
    
    static let identifier = "CartItemCell"
    
    weak var delegate: CartItemCellDelegate?
    
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
    
    private let decreaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(hex: Colors.primary).cgColor
        button.tintColor = UIColor(hex: Colors.primary)
        button.layer.borderWidth = 1
        return button
    }()
    
    private let quantityWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        return view
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(hex: Colors.primary).cgColor
        button.tintColor = UIColor(hex: Colors.primary)
        button.layer.borderWidth = 1
        return button
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.tetiary)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButtons() {
        increaseButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
        decreaseButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)
    }
    
    @objc func increase() {
        delegate?.didTapIncreaseQty(self)
    }
    
    @objc func decrease() {
        delegate?.didTapDecreaseQty(self)
    }
    
    func configure(with item: CartItemModel) {
        productImage.image = item.productImage
        productName.text = item.productName
        size.text = "Size: \(item.size)"
        amount.text = String(item.totalPrice)
        quantityLabel.text = String(item.quantity)
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        backgroundColor = .clear
        
        addSubview(productImage)
        addSubview(productName)
        addSubview(size)
        addSubview(amount)
        addSubview(decreaseButton)
        addSubview(quantityWrapper)
        addSubview(increaseButton)
        addSubview(separator)
        
        quantityWrapper.addSubview(quantityLabel)
        
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
            
            decreaseButton.topAnchor.constraint(equalTo: amount.bottomAnchor, constant: 12),
            decreaseButton.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            decreaseButton.widthAnchor.constraint(equalToConstant: 40),
            decreaseButton.heightAnchor.constraint(equalToConstant: 40),
            
            quantityWrapper.centerYAnchor.constraint(equalTo: decreaseButton.centerYAnchor),
            quantityWrapper.leadingAnchor.constraint(equalTo: decreaseButton.trailingAnchor, constant: 4),
            quantityWrapper.widthAnchor.constraint(equalToConstant: 40),
            quantityWrapper.heightAnchor.constraint(equalToConstant: 40),
            
            quantityLabel.centerYAnchor.constraint(equalTo: quantityWrapper.centerYAnchor),
            quantityLabel.centerXAnchor.constraint(equalTo: quantityWrapper.centerXAnchor),
            
            increaseButton.centerYAnchor.constraint(equalTo: quantityWrapper.centerYAnchor),
            increaseButton.leadingAnchor.constraint(equalTo: quantityWrapper.trailingAnchor, constant: 4),
            increaseButton.widthAnchor.constraint(equalToConstant: 40),
            increaseButton.heightAnchor.constraint(equalToConstant: 40),
            
            separator.topAnchor.constraint(equalTo: decreaseButton.bottomAnchor, constant: 16),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
