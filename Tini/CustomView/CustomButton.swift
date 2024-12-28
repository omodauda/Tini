//
//  CustomButton.swift
//  Tini
//
//  Created by Omodauda on 04/12/2024.
//

import UIKit

enum Type {
    case primary
}

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, backgroundColor: UIColor?, image: UIImage?) {
        self.init(frame: .zero)
        configure()
        
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        if backgroundColor == nil {
            layer.borderWidth = 1
            layer.borderColor = UIColor(hex: Colors.primary).cgColor
            tintColor = UIColor(hex: Colors.primary)
            setTitleColor(UIColor(hex: Colors.primary), for: .normal)
        } else {
            self.backgroundColor = backgroundColor
            tintColor = .white
            setTitleColor(.white, for: .normal)
        }
        
        if image != nil {
            configuration?.image = image
            configuration?.imagePadding = 8
        }
    }
    
    private func configure() {
        configuration = .plain()
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
