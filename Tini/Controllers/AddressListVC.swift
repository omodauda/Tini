//
//  AddressListVC.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

class AddressListVC: UIViewController {

    private let header = CustomNavHeader(title: "Deliver to")
    
    private let addressBookView: UIView = {
        let addressBookView = UIView()
        addressBookView.backgroundColor = .white
        addressBookView.translatesAutoresizingMaskIntoConstraints = false
        addressBookView.layer.cornerRadius = 8
        return addressBookView
    }()
    
    private let addressIcon: UIImageView = {
        let addressIcon = UIImageView()
        addressIcon.image = Images.addressIcon
        addressIcon.translatesAutoresizingMaskIntoConstraints = false
        return addressIcon
    }()
    
    private let addressBookLabel: UILabel = {
        let addressBookLabel = UILabel()
        addressBookLabel.text = "Address book"
        addressBookLabel.font = .systemFont(ofSize: 14, weight: .medium)
        addressBookLabel.textColor = UIColor(hex: Colors.titleText)
        addressBookLabel.translatesAutoresizingMaskIntoConstraints = false
        return addressBookLabel
    }()
    
    private let addressBookDescriptionLabel: UILabel = {
        let addressBookDescriptionLabel = UILabel()
        addressBookDescriptionLabel.text = "Use your Tiki's saved address"
        addressBookDescriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        addressBookDescriptionLabel.textColor = UIColor(hex: Colors.secondary)
        addressBookDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return addressBookDescriptionLabel
    }()
    
    private let arrowRightIcon: UIImageView = {
        let arrowRightIcon = UIImageView()
        arrowRightIcon.image = Images.rightIcon
        arrowRightIcon.tintColor = UIColor(hex: Colors.secondary)
        arrowRightIcon.translatesAutoresizingMaskIntoConstraints = false
        return arrowRightIcon
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        header.delegate = self
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(addressBookView)
        addressBookView.addSubview(addressIcon)
        addressBookView.addSubview(addressBookLabel)
        addressBookView.addSubview(addressBookDescriptionLabel)
        addressBookView.addSubview(arrowRightIcon)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            addressBookView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 16),
            addressBookView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addressBookView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            addressIcon.topAnchor.constraint(equalTo: addressBookView.topAnchor, constant: 11),
            addressIcon.leadingAnchor.constraint(equalTo: addressBookView.leadingAnchor, constant: 18),
            addressIcon.widthAnchor.constraint(equalToConstant: 20),
            addressIcon.heightAnchor.constraint(equalToConstant: 20),
            
            addressBookLabel.topAnchor.constraint(equalTo: addressBookView.topAnchor, constant: 8),
            addressBookLabel.leadingAnchor.constraint(equalTo: addressIcon.trailingAnchor, constant: 10),
            
            addressBookDescriptionLabel.topAnchor.constraint(equalTo: addressBookLabel.bottomAnchor, constant: 4),
            addressBookDescriptionLabel.leadingAnchor.constraint(equalTo: addressIcon.trailingAnchor, constant: 10),
            addressBookDescriptionLabel.bottomAnchor.constraint(equalTo: addressBookView.bottomAnchor, constant: -8),
            
            arrowRightIcon.centerYAnchor.constraint(equalTo: addressBookView.centerYAnchor),
            arrowRightIcon.trailingAnchor.constraint(equalTo: addressBookView.trailingAnchor, constant: -24)
            
        ])
    }
}

extension AddressListVC: CustomNavHeaderDelegate {
    
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
