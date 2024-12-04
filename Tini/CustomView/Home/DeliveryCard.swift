//
//  DeliveryCard.swift
//  Tini
//
//  Created by Omodauda on 02/12/2024.
//

import UIKit

class DeliveryCard: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
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

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        backgroundColor = .white
        layer.cornerRadius = 8
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(stackView)
        stackView.addArrangedSubview(pickupView)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(deliveryView)
        
        pickupView.translatesAutoresizingMaskIntoConstraints = false
        deliveryView.translatesAutoresizingMaskIntoConstraints = false
    
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pickupView.heightAnchor.constraint(equalToConstant: 122),
            pickupView.widthAnchor.constraint(equalToConstant: 139),
            
            deliveryView.widthAnchor.constraint(equalToConstant: 139),
            deliveryView.heightAnchor.constraint(equalToConstant: 122),
            
            divider.widthAnchor.constraint(equalToConstant: 1),
            divider.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
}

#Preview {
    DeliveryCard()
}
