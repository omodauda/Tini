//
//  StorePickupMenuVC.swift
//  Tini
//
//  Created by Omodauda on 11/12/2024.
//

import UIKit

class StorePickupMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: Colors.background)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

}
