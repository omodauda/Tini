//
//  HomeVC.swift
//  Tini
//
//  Created by Omodauda on 29/11/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    private let headerView = HomeHeader()
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let deliveryCard = DeliveryCard()
    private let reservationCard = ReservationCard()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hex: Colors.background)
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.pinToEdges(of: scrollView)
//        contentView.backgroundColor = .red
        
        contentView.addSubview(deliveryCard)
        deliveryCard.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(reservationCard)
        reservationCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.heightAnchor.constraint(equalToConstant: 56),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            deliveryCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            deliveryCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            deliveryCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            deliveryCard.heightAnchor.constraint(equalToConstant: 154),
            
            reservationCard.topAnchor.constraint(equalTo: deliveryCard.bottomAnchor, constant: 16),
            reservationCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reservationCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            reservationCard.heightAnchor.constraint(equalToConstant: 154)
        ])
    }
}
