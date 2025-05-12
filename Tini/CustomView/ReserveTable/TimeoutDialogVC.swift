//
//  TimeoutDialogVC.swift
//  Tini
//
//  Created by Omodauda on 12/05/2025.
//

import UIKit

class TimeoutDialogVC: UIViewController {
    
    var onReselectTable: (() -> Void)?
    
    private let modalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.timeoutTableImg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Oh no..."
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.text = "The table you have selected is released after 5 minutes of reviewing. Please kindly re-select the table."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let btn = CustomButton(title: "Re-select table", backgroundColor: UIColor(hex: Colors.primary), image: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureBtn()
    }
    
    private func configureBtn() {
        btn.addTarget(self, action: #selector(handleReselect), for: .touchUpInside)
    }
    
    @objc private func handleReselect() {
        dismiss(animated: false)
        onReselectTable?()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        view.addSubview(modalView)
        modalView.addSubview(imageView)
        modalView.addSubview(titleLabel)
        modalView.addSubview(descLabel)
        modalView.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            modalView.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 32),
            modalView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -32),
            
            imageView.topAnchor.constraint(equalTo: modalView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            
            btn.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 16),
            btn.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            btn.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            btn.bottomAnchor.constraint(equalTo: modalView.bottomAnchor, constant: -16)
        ])
    }

}
