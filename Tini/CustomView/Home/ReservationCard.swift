//
//  ReservationCard.swift
//  Tini
//
//  Created by Omodauda on 03/12/2024.
//

import UIKit

class ReservationCard: UIView {
    
    var onReservationsTapped: (() -> Void)?
    var onReserveTableTapped: (() -> Void)?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let textView: UIView = {
        let textView = UIView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let title: UILabel = {
        let title = UILabel()
        title.text = "Online reservation"
        title.textColor = UIColor(hex: Colors.titleText)
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let desc: UILabel = {
        let desc = UILabel()
        desc.text = "Table booking"
        desc.textColor = UIColor(hex: Colors.secondary)
        desc.font = .systemFont(ofSize: 12, weight: .regular)
        desc.translatesAutoresizingMaskIntoConstraints = false
        return desc
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.Home.reservationImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buttonGroup: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let reserveTableButton = CustomButton(title: "Reserve a table", backgroundColor: nil, image: UIImage(systemName: "calendar"))
    private let reservationsButton = CustomButton(title: "My reservations", backgroundColor: nil, image: nil)
    
    
    init(showBtns: Bool) {
        super.init(frame: .zero)
        setupUI()
        configureBtns(showBtns)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBtns(_ showBtns: Bool) {
        if showBtns {
            addSubview(buttonGroup)
            buttonGroup.addArrangedSubview(reserveTableButton)
            buttonGroup.addArrangedSubview(reservationsButton)
            
            NSLayoutConstraint.activate([
                buttonGroup.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                buttonGroup.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                buttonGroup.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
                buttonGroup.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ])
            reservationsButton.addTarget(self, action: #selector(goToReservations), for: .touchUpInside)
            reserveTableButton.addTarget(self, action: #selector(goToReserveTable), for: .touchUpInside)
        } else {
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        }
    }
    
    @objc func goToReservations() {
        onReservationsTapped?()
    }
    
    @objc func goToReserveTable() {
        onReserveTableTapped?()
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 8
        addSubview(stackView)
        
        textView.addSubview(title)
        textView.addSubview(desc)
        
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: textView.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            desc.topAnchor.constraint(equalTo: title.bottomAnchor),
            desc.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 108),
            imageView.heightAnchor.constraint(equalToConstant: 72),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
    }
    
}
