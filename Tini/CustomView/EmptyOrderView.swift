//
//  EmptyOrderView.swift
//  Tini
//
//  Created by Omodauda on 05/01/2025.
//

import UIKit

class EmptyOrderView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.emptyOrdersSvg
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "You have no order"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "How about trying our new drinks?"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let orderBtn = CustomButton(title: "Order now!", backgroundColor: UIColor(hex: Colors.primary), image: nil)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(orderBtn)
        
        orderBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 76),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.widthAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            orderBtn.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            orderBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            orderBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
