//
//  EmptyStateView.swift
//  Tini
//
//  Created by Omodauda on 24/12/2024.
//

import UIKit

class EmptyStateView: UIView {
    
    private let emptySvg: UIImageView = {
        let svg = UIImageView()
        svg.image = Images.emptyStateSvg
        svg.contentMode = .scaleAspectFit
        svg.clipsToBounds = true
        svg.translatesAutoresizingMaskIntoConstraints = false
        return svg
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.text = "Sorry, we nearly found it!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.text = "Please try again, better luck next time"
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
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(emptySvg)
        addSubview(titleLabel)
        addSubview(descLabel)
        
        NSLayoutConstraint.activate([
            emptySvg.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            emptySvg.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptySvg.widthAnchor.constraint(equalToConstant: 180),
            emptySvg.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: emptySvg.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
