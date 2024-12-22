//
//  StorePickupMenuVC.swift
//  Tini
//
//  Created by Omodauda on 11/12/2024.
//

import UIKit

class StorePickupMenuVC: UIViewController {
    
    private let header = CustomNavHeader(title: "Store pickup", showRightIcon: true, rightIcon: nil)
    
    // current pickup store view
    private let currentPickupStoreView: UIView = {
        let currentPickupStoreView = UIView()
        currentPickupStoreView.translatesAutoresizingMaskIntoConstraints = false
        currentPickupStoreView.backgroundColor = .white
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
        selectStoreIcon.tintColor = UIColor(hex: Colors.secondary)
        selectStoreIcon.setImage(Images.rightIcon, for: .normal)
        return selectStoreIcon
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
        configureSelectStore()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        currentPickupStoreView.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureTableHeader() {
//        currentPickupStoreView.layoutIfNeeded()
        tableView.tableHeaderView = currentPickupStoreView
        
        currentPickupStoreView.addSubview(storeLogo)
        currentPickupStoreView.addSubview(pickupLabel)
        currentPickupStoreView.addSubview(storeAddress)
        currentPickupStoreView.addSubview(selectStoreIcon)
        
        NSLayoutConstraint.activate([
            currentPickupStoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currentPickupStoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currentPickupStoreView.heightAnchor.constraint(equalToConstant: 62),
            
            storeLogo.topAnchor.constraint(equalTo: currentPickupStoreView.topAnchor, constant: 8),
            storeLogo.leadingAnchor.constraint(equalTo: currentPickupStoreView.leadingAnchor, constant: 16),
            storeLogo.widthAnchor.constraint(equalToConstant: 40),
            storeLogo.heightAnchor.constraint(equalToConstant: 40),
            
            pickupLabel.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 8),
            pickupLabel.topAnchor.constraint(equalTo: currentPickupStoreView.topAnchor, constant: 8),
            
            storeAddress.topAnchor.constraint(equalTo: pickupLabel.bottomAnchor, constant: 4),
            storeAddress.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 8),
            
            selectStoreIcon.centerYAnchor.constraint(equalTo: currentPickupStoreView.centerYAnchor),
            selectStoreIcon.trailingAnchor.constraint(equalTo: currentPickupStoreView.trailingAnchor, constant: -24),
            selectStoreIcon.leadingAnchor.constraint(equalTo: storeAddress.trailingAnchor, constant: 16),
        ])
    }
    
    private func configureSelectStore() {
        selectStoreIcon.addTarget(self, action: #selector(handleSelectStore), for: .touchUpInside)
    }
    
    @objc private func handleSelectStore() {
        let vc = SelectStoreVC()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: false)
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

extension StorePickupMenuVC: CustomNavHeaderDelegate {
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension StorePickupMenuVC: UITableViewDelegate, UITableViewDataSource {
    
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
