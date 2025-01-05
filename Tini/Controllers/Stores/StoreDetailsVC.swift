//
//  StoreDetailsVC.swift
//  Tini
//
//  Created by Omodauda on 03/01/2025.
//

import UIKit

class StoreDetailsVC: UIViewController {
    
    private let store: StoreModel
    
    private let storeViewModel = StoresViewModel.shared
    
    private let headerWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let header: UIView = {
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private let backIconWrapper: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "#DDDDE3")
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let backIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.backIcon
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    private let actionButtonsView = ActionButtonsView()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(hex: Colors.background)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 50, right: -16)
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var storeCard: StoreCard = {
        let card = StoreCard(store: store)
        card.delegate = self
        card.translatesAutoresizingMaskIntoConstraints = false
        card.layer.cornerRadius = 8
        return card
    }()
    
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
    
    private let reservationCard = ReservationCard(showBtns: false)
    private lazy var contactCard = StoreContactCard(phone: store.phone, address: store.address)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureBackButton()
    }
    
    init(store: StoreModel) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBackButton() {
        backIconWrapper.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.addSubview(backIconWrapper)
        header.addSubview(actionButtonsView)
        backIconWrapper.addSubview(backIcon)
        
        actionButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(storeCard)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(pickupView)
        stackView.addArrangedSubview(deliveryView)
        stackView.addSubview(divider)
        
        contentView.addSubview(reservationCard)
        reservationCard.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(contactCard)
        contactCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            header.bottomAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            
            backIconWrapper.topAnchor.constraint(equalTo: header.topAnchor, constant: 12),
            backIconWrapper.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            backIconWrapper.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -12),
            backIconWrapper.widthAnchor.constraint(equalToConstant: 32),
            backIconWrapper.heightAnchor.constraint(equalToConstant: 32),
            
            backIcon.centerXAnchor.constraint(equalTo: backIconWrapper.centerXAnchor),
            backIcon.centerYAnchor.constraint(equalTo: backIconWrapper.centerYAnchor),
            backIcon.widthAnchor.constraint(equalToConstant: 20),
            backIcon.heightAnchor.constraint(equalToConstant: 20),
            
            actionButtonsView.topAnchor.constraint(equalTo: header.topAnchor, constant: 16),
            actionButtonsView.widthAnchor.constraint(equalToConstant: 64),
            actionButtonsView.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
            actionButtonsView.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            
            storeCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            storeCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storeCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: storeCard.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 154),
                        
            divider.widthAnchor.constraint(equalToConstant: 1),
            divider.heightAnchor.constraint(equalToConstant: 48),
            divider.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            divider.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            
            reservationCard.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            reservationCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            reservationCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            contactCard.topAnchor.constraint(equalTo: reservationCard.bottomAnchor, constant: 12),
            contactCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contactCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contactCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension StoreDetailsVC: StoreCardDelegate {
    func didTapFavBtn() {
        storeViewModel.toggleFavorite(store: store)
    }
}
