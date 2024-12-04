//
//  DeliveryCardInfoView.swift
//  Tini
//
//  Created by Omodauda on 02/12/2024.
//

import UIKit

class DeliveryCardInfoView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()
    
    private let desc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.secondary)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init(image: UIImage, title: String, desc: String) {
        self.init(frame: .zero)
        
        setup()
        imageView.image = image
        self.title.text = title
        self.desc.text = desc
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(imageView)
        addSubview(title)
        addSubview(desc)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 108),
            imageView.heightAnchor.constraint(equalToConstant: 72),
            
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            title.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            desc.topAnchor.constraint(equalTo: title.bottomAnchor),
            desc.centerXAnchor.constraint(equalTo: title.centerXAnchor)
        ])
        
    }
    
}
