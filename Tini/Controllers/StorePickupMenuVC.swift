//
//  StorePickupMenuVC.swift
//  Tini
//
//  Created by Omodauda on 11/12/2024.
//

import UIKit

class StorePickupMenuVC: UIViewController {
    
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
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
    
    // current pickup store view
    private let currentPickupStoreView: UIView = {
        let currentPickupStoreView = UIView()
        currentPickupStoreView.translatesAutoresizingMaskIntoConstraints = false
        return currentPickupStoreView
    }()
    
    private let storeLogo: UIImageView = {
        let storeLogo = UIImageView()
        storeLogo.image = Images.pickupStoreLogo
        storeLogo.translatesAutoresizingMaskIntoConstraints = false
        return storeLogo
    }()
    
    private let pickupLabel: UILabel = {
        let pickupLabel = UILabel()
        pickupLabel.text = "Pickup at"
        pickupLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        pickupLabel.textColor = UIColor(hex: Colors.titleText)
        pickupLabel.translatesAutoresizingMaskIntoConstraints = false
        return pickupLabel
    }()
    
    private let storeAddress: UILabel = {
        let storeAddress = UILabel()
        storeAddress.text = "SB Han Thuyen, 13 Han Thuyen, Dakatar, Indonesia Indonesia Indonesia"
        storeAddress.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        storeAddress.textColor = UIColor(hex: Colors.titleText)
        storeAddress.lineBreakMode = .byTruncatingTail
        storeAddress.translatesAutoresizingMaskIntoConstraints = false
        return storeAddress
    }()
    
    private let selectStoreIcon: UIButton = {
        let selectStoreIcon = UIButton()
        selectStoreIcon.translatesAutoresizingMaskIntoConstraints = false
        selectStoreIcon.tintColor = UIColor(hex: Colors.titleText)
        return selectStoreIcon
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureBackButton() {
        backIcon.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        
        backIcon.setImage(Images.backIcon, for: .normal)
        searchIcon.setImage(Images.searchIcon, for: .normal)
        
        headerView.addSubview(backIcon)
        headerView.addSubview(headerTitle)
        headerView.addSubview(searchIcon)
        headerView.addSubview(actionButtonsView)
        
        actionButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        // store details view
        view.addSubview(currentPickupStoreView)
        selectStoreIcon.setImage(Images.rightIcon, for: .normal)
        
        currentPickupStoreView.addSubview(storeLogo)
        currentPickupStoreView.addSubview(pickupLabel)
        currentPickupStoreView.addSubview(storeAddress)
        currentPickupStoreView.addSubview(selectStoreIcon)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backIcon.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 21),
            backIcon.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -21),
            backIcon.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
            
            headerTitle.leadingAnchor.constraint(equalTo: backIcon.trailingAnchor, constant: 16),
            headerTitle.centerYAnchor.constraint(equalTo: backIcon.centerYAnchor),
            
            actionButtonsView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 21),
            actionButtonsView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -21),
            actionButtonsView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            actionButtonsView.widthAnchor.constraint(equalToConstant: 64),
            actionButtonsView.heightAnchor.constraint(equalToConstant: 24),
            
            searchIcon.centerYAnchor.constraint(equalTo: actionButtonsView.centerYAnchor),
            searchIcon.trailingAnchor.constraint(equalTo: actionButtonsView.leadingAnchor, constant: -11),
            
            currentPickupStoreView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            currentPickupStoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currentPickupStoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            storeLogo.topAnchor.constraint(equalTo: currentPickupStoreView.topAnchor, constant: 8),
            storeLogo.leadingAnchor.constraint(equalTo: currentPickupStoreView.leadingAnchor, constant: 16),
            storeLogo.widthAnchor.constraint(equalToConstant: 40),
            storeLogo.heightAnchor.constraint(equalToConstant: 40),
            storeLogo.bottomAnchor.constraint(equalTo: currentPickupStoreView.bottomAnchor, constant: -14),
            
            pickupLabel.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 8),
            pickupLabel.topAnchor.constraint(equalTo: currentPickupStoreView.topAnchor, constant: 8),
            
            storeAddress.topAnchor.constraint(equalTo: pickupLabel.bottomAnchor, constant: 4),
            storeAddress.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 8),
            
            selectStoreIcon.centerYAnchor.constraint(equalTo: currentPickupStoreView.centerYAnchor),
            selectStoreIcon.trailingAnchor.constraint(equalTo: currentPickupStoreView.trailingAnchor, constant: -24),
            selectStoreIcon.leadingAnchor.constraint(equalTo: storeAddress.trailingAnchor, constant: 16)
            
        ])
    }

}
