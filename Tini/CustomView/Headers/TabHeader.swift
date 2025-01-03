//
//  TabHeader.swift
//  Tini
//
//  Created by Omodauda on 02/01/2025.
//

import UIKit

class TabHeader: UIView {
    
    private let headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.text = "Store pickup"
        headerTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        headerTitle.textColor = UIColor(hex: Colors.titleText)
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        return headerTitle
    }()
    
    private let actionButtonsView = ActionButtonsView()
    
    init(title: String) {
        super.init(frame: .zero)
        setupUI()
        headerTitle.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(headerTitle)
        addSubview(actionButtonsView)
        actionButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            headerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            actionButtonsView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            actionButtonsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            actionButtonsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            actionButtonsView.widthAnchor.constraint(equalToConstant: 64)
        ])
    }

}
