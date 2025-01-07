//
//  DeliveryOrdersVC.swift
//  Tini
//
//  Created by Omodauda on 05/01/2025.
//

import UIKit

class DeliveryOrdersVC: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(OrderDeliveryCell.self, forCellReuseIdentifier: OrderDeliveryCell.identifier)
        tableView.backgroundColor = UIColor(hex: Colors.background)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 227
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension DeliveryOrdersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderDeliveryCell.identifier, for: indexPath) as? OrderDeliveryCell else { return UITableViewCell() }
        return cell
    }
}
