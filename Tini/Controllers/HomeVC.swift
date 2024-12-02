//
//  HomeVC.swift
//  Tini
//
//  Created by Omodauda on 29/11/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    private let headerView = HomeHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hex: Colors.background)
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
