//
//  HomeHeader.swift
//  Tini
//
//  Created by Omodauda on 01/12/2024.
//

import UIKit

class HomeHeader: UIView {
    
    private let logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.image = Images.Home.storeLogo
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample resturant"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let actionButtonsView = ActionButtonsView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(nameLabel)
        addSubview(actionButtonsView)
        
        actionButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 12),
            
            nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            
            actionButtonsView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            actionButtonsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            actionButtonsView.widthAnchor.constraint(equalToConstant: 64),
            actionButtonsView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
}
