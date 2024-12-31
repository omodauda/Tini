//
//  CartVC.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import UIKit

class CartVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupUI() {
        view.backgroundColor = .red
    }
}
