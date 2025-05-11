//
//  EmptyReservationView.swift
//  Tini
//
//  Created by Omodauda on 08/05/2025.
//

import UIKit

class EmptyReservationView: UIView {
    
    var goToReserveTable: (() -> Void)?
    
    private let emptyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.emptyReservation
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "You don’t have any reservation yet"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.text = "Do you want to reserve a table?"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button = CustomButton(title: "Reserve a table", backgroundColor: UIColor(hex: Colors.primary), image: nil)

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        configureBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBtn() {
        button.addTarget(self, action: #selector(onBtnTapped), for: .touchUpInside)
    }
    
    @objc private func onBtnTapped() {
        goToReserveTable?()
    }
    
    func setupUI() {
        backgroundColor = .white
        
        addSubview(emptyImage)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            emptyImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            emptyImage.widthAnchor.constraint(equalToConstant: 180),
            emptyImage.heightAnchor.constraint(equalToConstant: 180),
            emptyImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: emptyImage.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
}
