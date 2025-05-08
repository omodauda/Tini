//
//  SearchProductVC.swift
//  Tini
//
//  Created by Omodauda on 24/12/2024.
//

import UIKit

class SearchProductVC: UIViewController {
    
    private let menuList = ProductsListViewModel.shared
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "Search", showRightIcon: false, rightIcon: nil)
    
    private let currentPickupStoreView: UIView = {
        let currentPickupStoreView = UIView()
        currentPickupStoreView.translatesAutoresizingMaskIntoConstraints = false
        currentPickupStoreView.backgroundColor = .white
        return currentPickupStoreView
    }()
    
    private let storeLogo: UIImageView = {
        let storeLogo = UIImageView()
        storeLogo.image = Images.storeIcon
        storeLogo.translatesAutoresizingMaskIntoConstraints = false
        return storeLogo
    }()
    
    private let storeAddress: UILabel = {
        let storeAddress = UILabel()
        storeAddress.text = "SB Han Thuyen, 13 Han Thuyen, Dakatar, Indonesia Indonesia Indonesia"
        storeAddress.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        storeAddress.textColor = UIColor(hex: Colors.titleText)
        storeAddress.lineBreakMode = .byTruncatingTail
        storeAddress.translatesAutoresizingMaskIntoConstraints = false
        return storeAddress
    }()
    
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.cornerRadius = 4
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        searchBar.searchTextField.autocapitalizationType = .none
        searchBar.searchTextField.autocorrectionType = .no
        searchBar.searchTextField.textColor = UIColor(hex: Colors.titleText)
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "What are you craving for?", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: Colors.secondary)])
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(MenuListTableViewCell.self, forCellReuseIdentifier: MenuListTableViewCell.identifier)
        tableView.tableHeaderView?.backgroundColor = .white
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 68, right: 0)
        return tableView
    }()
    
    private let emptyStateView = EmptyStateView()

    override func viewDidLoad() {
        super.viewDidLoad()
        menuList.loadSections()
        setupUI()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    private func updateView() {
        if menuList.favoritesList.isEmpty {
            tableView.isHidden = true
            emptyStateView.isHidden = false
        } else {
            tableView.isHidden = false
            emptyStateView.isHidden = true
        }
        tableView.reloadData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(headerWrapper)
        
        headerWrapper.addSubview(header)
        header.delegate = self
        header.translatesAutoresizingMaskIntoConstraints = false
        
        headerWrapper.addSubview(currentPickupStoreView)
        currentPickupStoreView.addSubview(storeLogo)
        currentPickupStoreView.addSubview(storeAddress)
        
        headerWrapper.addSubview(searchBar)
        searchBar.delegate = self
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(emptyStateView)
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        emptyStateView.isHidden = true
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            currentPickupStoreView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 9),
            currentPickupStoreView.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            currentPickupStoreView.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            storeLogo.topAnchor.constraint(equalTo: currentPickupStoreView.topAnchor, constant: 10),
            storeLogo.leadingAnchor.constraint(equalTo: currentPickupStoreView.leadingAnchor, constant: 16),
            storeLogo.bottomAnchor.constraint(equalTo: currentPickupStoreView.bottomAnchor, constant: -10),
            storeLogo.widthAnchor.constraint(equalToConstant: 24),
            storeLogo.heightAnchor.constraint(equalToConstant: 24),
            
            storeAddress.centerYAnchor.constraint(equalTo: storeLogo.centerYAnchor),
            storeAddress.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 10),
            storeAddress.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor, constant: -56),
            
            searchBar.topAnchor.constraint(equalTo: currentPickupStoreView.bottomAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor, constant: -16),
            searchBar.bottomAnchor.constraint(equalTo: headerWrapper.bottomAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyStateView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            emptyStateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyStateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyStateView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension SearchProductVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        menuList.searchFavorites(with: searchText)
        updateView()
    }
}

extension SearchProductVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.favoritesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuListTableViewCell.identifier, for: indexPath) as? MenuListTableViewCell else { return UITableViewCell() }
        let product = menuList.favoritesList[indexPath.row]
        cell.configure(product: product)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = menuList.favoritesList[indexPath.row]
        let vc = ProductDetailVC(product: product, orderType: .delivery)
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: false)
    }
}


extension SearchProductVC: CustomNavHeaderDelegate {
    func didTapSearch() {}
    
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}
