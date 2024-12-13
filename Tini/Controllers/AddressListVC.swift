//
//  AddressListVC.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

class AddressListVC: UIViewController {
    
    private let deliveryAddressViewModel = DeliveryAddressViewModel()
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        return headerWrapper
    }()

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
    
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let headerText: UILabel = {
        let headerText = UILabel()
        headerText.text = "Saved places"
        headerText.font = .systemFont(ofSize: 16, weight: .bold)
        headerText.textColor = UIColor(hex: Colors.titleText)
        headerText.translatesAutoresizingMaskIntoConstraints = false
        return headerText
    }()
    
    private let footerView: UIView = {
        let footer = UIView()
        footer.backgroundColor = .white
        footer.layer.cornerRadius = 8
//        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()
    
    private let footerIcon: UIImageView = {
        let footerIcon = UIImageView()
        footerIcon.image = Images.addIcon
        footerIcon.tintColor = UIColor(hex: Colors.primary)
        footerIcon.translatesAutoresizingMaskIntoConstraints = false
        return footerIcon
    }()
    
    private let footerText: UILabel = {
        let footerText = UILabel()
        footerText.text = "New place"
        footerText.font = .systemFont(ofSize: 14, weight: .bold)
        footerText.textColor = UIColor(hex: Colors.titleText)
        footerText.translatesAutoresizingMaskIntoConstraints = false
        return footerText
    }()
    
    // address table view
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DeliveryAddressTableViewCell.self, forCellReuseIdentifier: DeliveryAddressTableViewCell.identifier)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableHeader()
        configureTableFooter()
//        configureFooterBtn()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.layoutIfNeeded()
        footerView.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureTableHeader() {
        tableView.tableHeaderView = headerView
        
        headerView.addSubview(headerText)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            headerView.heightAnchor.constraint(equalToConstant: 24),
            
            headerText.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerText.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
        ])
    }
    
    private func configureTableFooter() {
        tableView.tableFooterView = footerView
        tableView.tableFooterView?.backgroundColor = .white
        tableView.tableFooterView?.layer.cornerRadius = 8

        footerView.addSubview(footerIcon)
        footerView.addSubview(footerText)
        
        NSLayoutConstraint.activate([
            
            footerIcon.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 13),
            footerIcon.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 21),
            footerIcon.widthAnchor.constraint(equalToConstant: 14),
            
            footerText.centerYAnchor.constraint(equalTo: footerIcon.centerYAnchor),
            footerText.leadingAnchor.constraint(equalTo: footerIcon.trailingAnchor, constant: 13),
        ])
    }
    
//    private func configureFooterBtn() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addNewPressed))
//        footerView.addGestureRecognizer(tapGesture)
//        footerView.isUserInteractionEnabled = true
//    }
//    
//    @objc private func addNewPressed() {
//        print("I was tapped")
//    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(headerWrapper)
        
        headerWrapper.addSubview(header)
        header.delegate = self
        header.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(addressBookView)
        addressBookView.addSubview(addressIcon)
        addressBookView.addSubview(addressBookLabel)
        addressBookView.addSubview(addressBookDescriptionLabel)
        addressBookView.addSubview(arrowRightIcon)
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerWrapper.heightAnchor.constraint(equalToConstant: 100),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
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
            arrowRightIcon.trailingAnchor.constraint(equalTo: addressBookView.trailingAnchor, constant: -24),
            
            tableView.topAnchor.constraint(equalTo: addressBookView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension AddressListVC: CustomNavHeaderDelegate {
    
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension AddressListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deliveryAddressViewModel.deliveryAddress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryAddressTableViewCell.identifier, for: indexPath) as? DeliveryAddressTableViewCell else {
            return UITableViewCell()
        }
        let deliveryAddress = deliveryAddressViewModel.deliveryAddress[indexPath.row]
        cell.configure(deliveryAddress: deliveryAddress)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacer = UIView()
        spacer.backgroundColor = .clear
        return spacer
    }
}
