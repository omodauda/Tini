//
//  HomeCollectionViewHeader.swift
//  Tini
//
//  Created by Omodauda on 08/12/2024.
//

import UIKit

class HomeCollectionViewHeader: UICollectionReusableView {
    static let reuseIdentifier = "HomeCollectionViewHeader"
    
    var onPickupPressed: (() -> Void)?
    var onDeliveryPressed: (() -> Void)?
    
    private let discountCollection = DiscountCollectionView()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 8
        return stackView
    }()
    
    private let pickupView = DeliveryCardInfoView(image: Images.Home.pickupImage!, title: "Store pickup", desc: "Best quality")
    
    private let divider: UIView = {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(hex: Colors.tetiary)
        return divider
    }()
    
    private let deliveryView = DeliveryCardInfoView(image: Images.Home.deliveryImage!, title: "Delivery", desc: "Always on time")
    
    private let reservationCard = ReservationCard(showBtns: true)
    private let title: UILabel = {
        let title = UILabel()
        title.text = "Promotion campaign"
        title.textColor = UIColor(hex: Colors.titleText)
        title.font = .systemFont(ofSize: 16, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addTapGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTapGestures() {
        let pickupTapGesture = UITapGestureRecognizer(target: self, action: #selector(handlePickupPressed))
        pickupView.addGestureRecognizer(pickupTapGesture)
        pickupView.isUserInteractionEnabled = true
        
        let deliveryTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDeliveryPressed))
        deliveryView.addGestureRecognizer(deliveryTapGesture)
        deliveryView.isUserInteractionEnabled = true
    }
    
    @objc private func handlePickupPressed() {
        onPickupPressed?()
    }
    
    @objc private func handleDeliveryPressed() {
        onDeliveryPressed?()
    }
    
    private func setupUI() {
        
        addSubview(discountCollection)
        addSubview(stackView)
        addSubview(reservationCard)
        addSubview(title)
        
        discountCollection.translatesAutoresizingMaskIntoConstraints = false
        
        pickupView.translatesAutoresizingMaskIntoConstraints = false
        deliveryView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(pickupView)
        stackView.addArrangedSubview(deliveryView)
        stackView.addSubview(divider)
        
        reservationCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            discountCollection.topAnchor.constraint(equalTo: topAnchor),
            discountCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            discountCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            discountCollection.heightAnchor.constraint(equalToConstant: 134),
            
            stackView.topAnchor.constraint(equalTo: discountCollection.bottomAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 154),
            
            divider.widthAnchor.constraint(equalToConstant: 1),
            divider.heightAnchor.constraint(equalToConstant: 48),
            divider.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            divider.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            
            reservationCard.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            reservationCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            reservationCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            title.topAnchor.constraint(equalTo: reservationCard.bottomAnchor, constant: 24),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}
