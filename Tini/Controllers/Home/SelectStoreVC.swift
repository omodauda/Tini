//
//  SelectStoreVC.swift
//  Tini
//
//  Created by Omodauda on 22/12/2024.
//

import UIKit

class SelectStoreVC: UIViewController {
    
    private let storesViewModel = StoresViewModel.shared
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "Select store", showRightIcon: false, rightIcon: nil)
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.cornerRadius = 4
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        searchBar.searchTextField.autocapitalizationType = .none
        searchBar.searchTextField.autocorrectionType = .no
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.searchTextField.textColor = UIColor(hex: Colors.titleText)
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search store", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: Colors.secondary)])
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        table.register(SelectStoreTableViewCell.self, forCellReuseIdentifier: SelectStoreTableViewCell.identifier)
        table.register(SelectStoreTableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: SelectStoreTableSectionHeaderView.identifier)
        return table
    }()
    
    private let emptyStateView = EmptyStateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createDismissKeyboardTapGesture()
        storesViewModel.loadSections()
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
        if storesViewModel.sections.isEmpty {
            tableView.isHidden = true
            emptyStateView.isHidden = false
        } else {
            tableView.isHidden = false
            emptyStateView.isHidden = true
        }
        tableView.reloadData()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        view.addSubview(headerWrapper)
        
        headerWrapper.addSubview(header)
        header.delegate = self
        header.translatesAutoresizingMaskIntoConstraints = false
        
        headerWrapper.addSubview(searchBar)
        searchBar.delegate = self
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(emptyStateView)
        emptyStateView.isHidden = true
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: header.bottomAnchor),
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

extension SelectStoreVC: CustomNavHeaderDelegate {
    func didTapSearch() {}
    
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension SelectStoreVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return storesViewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storesViewModel.sections[section].stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectStoreTableViewCell.identifier, for: indexPath) as? SelectStoreTableViewCell else {
            return UITableViewCell()
        }
        let store = storesViewModel.sections[indexPath.section].stores[indexPath.row]
        cell.configure(store: store)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: SelectStoreTableSectionHeaderView.identifier) as? SelectStoreTableSectionHeaderView else {
            return UITableViewHeaderFooterView()
        }
        let title = storesViewModel.sections[section].title
        sectionHeader.configure(title: title)
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let store = storesViewModel.sections[indexPath.section].stores[indexPath.row]
        let vc = StoreDetailsVC(store: store)
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension SelectStoreVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            tableView.sectionHeaderHeight = 0
        } else {
            tableView.sectionHeaderHeight = 24
        }
        storesViewModel.searchStores(with: searchText)
        updateView()
    }
}
