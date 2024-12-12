//
//  CustomNavHeader.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

protocol CustomNavHeaderDelegate: AnyObject {
    func didTapBack()
}

class CustomNavHeader: UIView {
    
    var delegate: CustomNavHeaderDelegate?
    
    private let backIcon: UIButton = {
        let backIcon = UIButton()
        backIcon.translatesAutoresizingMaskIntoConstraints = false
        backIcon.tintColor = UIColor(hex: Colors.titleText)
        return backIcon
    }()
    
    private let headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.text = "Store pickup"
        headerTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        headerTitle.textColor = UIColor(hex: Colors.titleText)
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        return headerTitle
    }()
    
    private let searchIcon: UIButton = {
        let searchButton = UIButton()
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.tintColor = UIColor(hex: Colors.titleText)
        return searchButton
    }()
    
    private let actionButtonsView = ActionButtonsView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        headerTitle.text = title
        
        setupUI()
        configureBackButton()
    }
    
    private func configureBackButton() {
        backIcon.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc private func goBack() {
        delegate?.didTapBack()
    }
    
    private func setupUI() {
        backgroundColor = .white
        backIcon.setImage(Images.backIcon, for: .normal)
        searchIcon.setImage(Images.searchIcon, for: .normal)
        
        addSubview(backIcon)
        addSubview(headerTitle)
        addSubview(searchIcon)
        addSubview(actionButtonsView)
        
        actionButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backIcon.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            backIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -21),
            backIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            headerTitle.leadingAnchor.constraint(equalTo: backIcon.trailingAnchor, constant: 16),
            headerTitle.centerYAnchor.constraint(equalTo: backIcon.centerYAnchor),
            
            actionButtonsView.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            actionButtonsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -21),
            actionButtonsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            actionButtonsView.widthAnchor.constraint(equalToConstant: 64),
            actionButtonsView.heightAnchor.constraint(equalToConstant: 24),
            
            searchIcon.centerYAnchor.constraint(equalTo: actionButtonsView.centerYAnchor),
            searchIcon.trailingAnchor.constraint(equalTo: actionButtonsView.leadingAnchor, constant: -11),
        ])
    }
    
}
