//
//  SelectStoreVC.swift
//  Tini
//
//  Created by Omodauda on 22/12/2024.
//

import UIKit

class SelectStoreVC: UIViewController {
    
    private let storesViewModel = StoresViewModel()
    
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
        searchBar.placeholder = "Search store"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.layer.cornerRadius = 4
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createDismissKeyboardTapGesture()
        storesViewModel.loadSetions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        view.addSubview(headerWrapper)
        
        headerWrapper.addSubview(header)
        header.delegate = self
        header.translatesAutoresizingMaskIntoConstraints = false
        
        headerWrapper.addSubview(searchBar)
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
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
            
            tableView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SelectStoreVC: CustomNavHeaderDelegate {
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
}
