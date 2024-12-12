//
//  ActionButtonsView.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

class ActionButtonsView: UIView {
    
    private let actionView: UIStackView = {
        let actionView = UIStackView()
        actionView.axis = .horizontal
        actionView.backgroundColor = UIColor(hex: Colors.tetiary)
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
        divider.widthAnchor.constraint(equalToConstant: 0.35).isActive = true
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
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
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
    }
    
}
