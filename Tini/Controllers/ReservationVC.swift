//
//  ReservationVC.swift
//  Tini
//
//  Created by Omodauda on 09/05/2025.
//

import UIKit

class ReservationVC: UIViewController {
    
    private let bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = Images.reservationBg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .clear
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "Find table", showRightIcon: false, rightIcon: nil)
    
    private let formView: UIView = {
        let formView = UIView()
        formView.translatesAutoresizingMaskIntoConstraints = false
        formView.backgroundColor = .white
        formView.layer.cornerRadius = 16
        formView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return formView
    }()
    
    private let storeView = TableStoreView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(bgImage)
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.delegate = self
        header.backgroundColor = .clear
        header.headerTitle.textColor = .white
        header.backIcon.tintColor = .white
        
        view.addSubview(formView)
        formView.addSubview(storeView)
        storeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bgImage.topAnchor.constraint(equalTo: view.topAnchor),
            bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgImage.heightAnchor.constraint(equalToConstant: 437),
            
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerWrapper.heightAnchor.constraint(equalToConstant: 120),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            formView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            formView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            formView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            formView.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
            
            storeView.topAnchor.constraint(equalTo: formView.topAnchor, constant: 16),
            storeView.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 16),
            storeView.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -16),
        ])
    }

}

extension ReservationVC: CustomNavHeaderDelegate {
    func didTapBack() {
        navigationController?.popViewController(animated: false)
    }
    
    func didTapSearch() {
        
    }
    
    
}
