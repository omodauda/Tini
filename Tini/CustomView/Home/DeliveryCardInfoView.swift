//
//  DeliveryCardInfoView.swift
//  Tini
//
//  Created by Omodauda on 02/12/2024.
//

import UIKit

class DeliveryCardInfoView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()
    
    let desc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.secondary)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    convenience init(image: UIImage, title: String, desc: String) {
        self.init(frame: .zero)
        
        setupUI()
        imageView.image = image
        self.titleLabel.text = title
        self.desc.text = desc
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(desc)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 108),
            imageView.heightAnchor.constraint(equalToConstant: 72),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            desc.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            desc.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            desc.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}
