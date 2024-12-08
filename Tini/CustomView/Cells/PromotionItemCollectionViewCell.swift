//
//  PromotionItemCollectionViewCell.swift
//  Tini
//
//  Created by Omodauda on 04/12/2024.
//

import UIKit

class PromotionItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PromotionItemCell"
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private let itemName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(hex: Colors.titleText)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(hex: Colors.titleText)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(hex: Colors.secondary)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(item: PromotionItemModel) {
        itemImageView.image = item.image
        itemName.text = item.title
        discountLabel.text = item.discountText
        dateLabel.text = item.date
    }
    
    private func setupUI() {
        addSubview(itemImageView)
        addSubview(itemName)
        addSubview(dateLabel)
        addSubview(discountLabel)
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            itemImageView.heightAnchor.constraint(equalToConstant: 164),
            
            itemName.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 8),
            itemName.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemName.trailingAnchor.constraint(equalTo: trailingAnchor),
            itemName.heightAnchor.constraint(equalToConstant: 20),
            
            discountLabel.topAnchor.constraint(equalTo: itemName.bottomAnchor),
            discountLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            discountLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            discountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            dateLabel.topAnchor.constraint(equalTo: discountLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
