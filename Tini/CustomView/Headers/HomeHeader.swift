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
    
    private let actionView: UIStackView = {
        let actionView = UIStackView()
        actionView.axis = .horizontal
        actionView.backgroundColor = .gray
        actionView.layer.cornerRadius = 12
        actionView.translatesAutoresizingMaskIntoConstraints = false
        actionView.alignment = .center
        actionView.distribution = .equalSpacing
        actionView.spacing = 8
        actionView.isLayoutMarginsRelativeArrangement = true
        actionView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10)
        return actionView
    }()
    
    private let moreButton: UIButton = {
        let moreButton = UIButton()
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.tintColor = .black
        return moreButton
    }()
    
    private let divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor.black
        divider.widthAnchor.constraint(equalToConstant: 1).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 16).isActive = true
        return divider
    }()
    
    private let closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.tintColor = .black
        return closeButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
//        backgroundColor = .white
        
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(nameLabel)
        addSubview(actionView)
        
        actionView.addArrangedSubview(moreButton)
        actionView.addArrangedSubview(divider)
        actionView.addArrangedSubview(closeButton)
        
        closeButton.setImage(Images.Home.closeIcon, for: .normal)
        moreButton.setImage(Images.Home.moreIcon, for: .normal)
        
        NSLayoutConstraint.activate([
            moreButton.widthAnchor.constraint(equalToConstant: 13),
            moreButton.heightAnchor.constraint(equalToConstant: 13),
            closeButton.widthAnchor.constraint(equalToConstant: 13),
            closeButton.heightAnchor.constraint(equalToConstant: 13)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            welcomeLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 12),
            
            nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            
            actionView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            actionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            actionView.widthAnchor.constraint(equalToConstant: 64),
            actionView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
}

#Preview {
    HomeHeader()
}
