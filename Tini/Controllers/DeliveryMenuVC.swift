//
//  DeliveryMenuVC.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

class DeliveryMenuVC: UIViewController {

    private let header = CustomNavHeader(title: "Delivery")
    
    private let deliveryDetailView: UIView = {
        let deliveryDetailView = UIView()
        deliveryDetailView.translatesAutoresizingMaskIntoConstraints = false
        deliveryDetailView.backgroundColor = .white
        return deliveryDetailView
    }()
    
    private let deliveryLogo: UIImageView = {
        let deliveryLogo = UIImageView()
        deliveryLogo.image = Images.deliveryAddressLogo
        deliveryLogo.translatesAutoresizingMaskIntoConstraints = false
        return deliveryLogo
    }()
    
    private let deliveryLabel: UILabel = {
        let deliveryLabel = UILabel()
        deliveryLabel.text = "Deliver to"
        deliveryLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        deliveryLabel.textColor = UIColor(hex: Colors.titleText)
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        return deliveryLabel
    }()
    
    private let deliveryAdress: UILabel = {
        let deliveryAdress = UILabel()
        deliveryAdress.text = "256 CMT8, D.10, HCM city"
        deliveryAdress.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        deliveryAdress.textColor = UIColor(hex: Colors.titleText)
        deliveryAdress.lineBreakMode = .byTruncatingTail
        deliveryAdress.translatesAutoresizingMaskIntoConstraints = false
        return deliveryAdress
    }()
    
    private let selectAddressIcon: UIButton = {
        let selectAddressIcon = UIButton()
        selectAddressIcon.translatesAutoresizingMaskIntoConstraints = false
        selectAddressIcon.tintColor = UIColor(hex: Colors.secondary)
        selectAddressIcon.setImage(Images.rightIcon, for: .normal)
        return selectAddressIcon
    }()
    
    private let descriptionText: UILabel = {
        let descriptionText = UILabel()
        descriptionText.text = "Nick 0896969696"
        descriptionText.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        descriptionText.textColor = UIColor(hex: Colors.secondary)
        descriptionText.lineBreakMode = .byTruncatingTail
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        return descriptionText
    }()
    
    private let storePickerView: UIView = {
        let storePickerView = UIView()
        storePickerView.translatesAutoresizingMaskIntoConstraints = false
        storePickerView.layer.borderWidth = 1
        storePickerView.layer.cornerRadius = 4
        storePickerView.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        return storePickerView
    }()
    
    private let storeLabel: UILabel = {
        let storeLabel = UILabel()
        storeLabel.text = "Store"
        storeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        storeLabel.textColor = UIColor(hex: Colors.titleText)
        storeLabel.translatesAutoresizingMaskIntoConstraints = false
        return storeLabel
    }()
    
    private let divider: UIView = {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(hex: "#EBEBF0")
        return divider
    }()
    
    private let dropDownButton: UIButton = {
        let dropDownButton = UIButton()
        dropDownButton.setImage(Images.downIcon, for: .normal)
        dropDownButton.translatesAutoresizingMaskIntoConstraints = false
        dropDownButton.tintColor = UIColor(hex: Colors.secondary)
        return dropDownButton
    }()
    
    private let storeAddress: UILabel = {
        let storeAddress = UILabel()
        storeAddress.text = "SB Han Thuyen, 113 Han Thuyen, Ho Chi Minh Ho Chi Minh"
        storeAddress.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        storeAddress.textColor = UIColor(hex: Colors.titleText)
        storeAddress.lineBreakMode = .byTruncatingTail
        storeAddress.translatesAutoresizingMaskIntoConstraints = false
        return storeAddress
    }()
    
    // table view
    var menuList = ProductsListViewModel()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MenuListTableViewCell.self, forCellReuseIdentifier: MenuListTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuListTableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: MenuListTableSectionHeaderView.identifier)
        tableView.tableHeaderView?.backgroundColor = .white
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 68, right: 0)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableHeader()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureTableHeader() {
        deliveryDetailView.layoutIfNeeded()
        tableView.tableHeaderView = deliveryDetailView
        
        deliveryDetailView.addSubview(deliveryLogo)
        deliveryDetailView.addSubview(deliveryLabel)
        deliveryDetailView.addSubview(deliveryAdress)
        deliveryDetailView.addSubview(selectAddressIcon)
        deliveryDetailView.addSubview(descriptionText)
        
        storePickerView.addSubview(storeLabel)
        storePickerView.addSubview(divider)
        storePickerView.addSubview(storeAddress)
        storePickerView.addSubview(dropDownButton)
        
        deliveryDetailView.addSubview(storePickerView)
        
        NSLayoutConstraint.activate([
            deliveryDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            deliveryDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            deliveryDetailView.heightAnchor.constraint(equalToConstant: 110),
            
            deliveryLogo.topAnchor.constraint(equalTo: deliveryDetailView.topAnchor, constant: 8),
            deliveryLogo.leadingAnchor.constraint(equalTo: deliveryDetailView.leadingAnchor, constant: 16),
            deliveryLogo.widthAnchor.constraint(equalToConstant: 40),
            deliveryLogo.heightAnchor.constraint(equalToConstant: 40),
//            deliveryLogo.bottomAnchor.constraint(equalTo: deliveryDetailView.bottomAnchor, constant: -14),
            
            deliveryLabel.leadingAnchor.constraint(equalTo: deliveryLogo.trailingAnchor, constant: 8),
            deliveryLabel.topAnchor.constraint(equalTo: deliveryDetailView.topAnchor, constant: 8),
            
            deliveryAdress.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 4),
            deliveryAdress.leadingAnchor.constraint(equalTo: deliveryLogo.trailingAnchor, constant: 8),
            deliveryAdress.trailingAnchor.constraint(equalTo: selectAddressIcon.leadingAnchor, constant: -25),
            
            selectAddressIcon.centerYAnchor.constraint(equalTo: deliveryDetailView.centerYAnchor),
            selectAddressIcon.trailingAnchor.constraint(equalTo: deliveryDetailView.trailingAnchor, constant: -24),
            
            descriptionText.topAnchor.constraint(equalTo: deliveryAdress.bottomAnchor, constant: 4),
            descriptionText.leadingAnchor.constraint(equalTo: deliveryLogo.trailingAnchor, constant: 8),
            
            storePickerView.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
            storePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            storePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            storePickerView.heightAnchor.constraint(equalToConstant: 40),
            
            storeLabel.topAnchor.constraint(equalTo: storePickerView.topAnchor, constant: 9.5),
            storeLabel.leadingAnchor.constraint(equalTo: storePickerView.leadingAnchor, constant: 16),
            storeLabel.bottomAnchor.constraint(equalTo: storePickerView.bottomAnchor, constant: -9.5),
            
            divider.centerYAnchor.constraint(equalTo: storeLabel.centerYAnchor),
            divider.widthAnchor.constraint(equalToConstant: 1),
            divider.heightAnchor.constraint(equalToConstant: 24),
            divider.leadingAnchor.constraint(equalTo: storeLabel.trailingAnchor, constant: 8),
            
            dropDownButton.centerYAnchor.constraint(equalTo: divider.centerYAnchor),
            dropDownButton.trailingAnchor.constraint(equalTo: storePickerView.trailingAnchor, constant: -16),
            
            storeAddress.centerYAnchor.constraint(equalTo: divider.centerYAnchor),
            storeAddress.leadingAnchor.constraint(equalTo: divider.trailingAnchor, constant: 8),
            storeAddress.trailingAnchor.constraint(equalTo: dropDownButton.leadingAnchor, constant: -40)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.delegate = self
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension DeliveryMenuVC: CustomNavHeaderDelegate {
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension DeliveryMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuList.productsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.productsList[section].products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuListTableViewCell.identifier, for: indexPath) as? MenuListTableViewCell else { return UITableViewCell() }
        let product = menuList.productsList[indexPath.section].products[indexPath.row]
        cell.configure(product: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: MenuListTableSectionHeaderView.identifier) as? MenuListTableSectionHeaderView else {
            return nil
        }
        let sectionTitle = menuList.productsList[section].title
        sectionHeader.configure(title: sectionTitle)
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}
