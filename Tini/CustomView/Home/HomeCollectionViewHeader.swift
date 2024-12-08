//
//  HomeCollectionViewHeader.swift
//  Tini
//
//  Created by Omodauda on 08/12/2024.
//

import UIKit

class HomeCollectionViewHeader: UICollectionReusableView {
    static let reuseIdentifier = "HomeCollectionViewHeader"
    
    private let deliveryCard = DeliveryCard()
    private let reservationCard = ReservationCard()
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(deliveryCard)
        addSubview(reservationCard)
        addSubview(title)
        
        deliveryCard.translatesAutoresizingMaskIntoConstraints = false
        reservationCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            deliveryCard.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            deliveryCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            deliveryCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            deliveryCard.heightAnchor.constraint(equalToConstant: 154),
            
            reservationCard.topAnchor.constraint(equalTo: deliveryCard.bottomAnchor, constant: 16),
            reservationCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            reservationCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            reservationCard.heightAnchor.constraint(equalToConstant: 154),
            
            title.topAnchor.constraint(equalTo: reservationCard.bottomAnchor, constant: 24),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}
