//
//  DeliveryOrdersVC.swift
//  Tini
//
//  Created by Omodauda on 05/01/2025.
//

import UIKit
import Combine

class DeliveryOrdersVC: UIViewController {
    
    private let ordersViewModel = OrdersViewModel.shared
    
    var cancellables = Set<AnyCancellable>()
    
    var orders: [OrderModel] = []
    
    private let emptyView = EmptyOrderView()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(OrderItemCell.self, forCellReuseIdentifier: OrderItemCell.identifier)
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
        ordersViewModel.ordersPublisher
            .map({ orders in
                orders.filter { order in
                    order.type == .delivery
                }
            })
            .sink { [weak self] orders in
                self?.orders = orders
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
        updateUI()
    }
    
    func updateUI() {
        if orders.isEmpty {
            tableView.isHidden = true
            emptyView.isHidden = false
        } else {
            tableView.isHidden = false
            emptyView.isHidden = true
        }
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(emptyView)
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyView.topAnchor.constraint(equalTo: view.topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension DeliveryOrdersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderItemCell.identifier, for: indexPath) as? OrderItemCell else { return UITableViewCell() }
        let order = orders[indexPath.row]
        cell.configure(order: order)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let order = orders[indexPath.row]
        let vc = OrderDetailsVC(order: order)
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: false)
    }
}
