//
//  ReservationsVC.swift
//  Tini
//
//  Created by Omodauda on 08/05/2025.
//

import UIKit

class ReservationsVC: UIViewController {
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "My reservations", showRightIcon: false, rightIcon: nil)
    
    private let emptyReservationView = EmptyReservationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.delegate = self
        
        view.addSubview(emptyReservationView)
        emptyReservationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerWrapper.heightAnchor.constraint(equalToConstant: 120),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            emptyReservationView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            emptyReservationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyReservationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyReservationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ReservationsVC: CustomNavHeaderDelegate {
    func didTapBack() {
        navigationController?.popViewController(animated: false)
    }
    
    func didTapSearch() {
        
    }
    
    
}
