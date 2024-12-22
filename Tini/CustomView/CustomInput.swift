//
//  CustomInput.swift
//  Tini
//
//  Created by Omodauda on 19/12/2024.
//

import UIKit

class CustomInput: UITextField {

    private let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 40))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(placeholder: String) {
        self.init()
        configure(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(placeholder: String) {
        translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        font = .systemFont(ofSize: 14, weight: .regular)
        textColor = UIColor(hex: Colors.titleText)
        layer.borderWidth = 1
        layer.cornerRadius = 4
        layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        textAlignment = .left
        leftViewMode = .always
        leftView = paddingView
    }
    
}
