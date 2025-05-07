//
//  DeleteAddressVC.swift
//  Tini
//
//  Created by Omodauda on 06/05/2025.
//

import UIKit

//protocol DeleteAddressDelegate: AnyObject {
//    func didTapDeleteAddress(index: Int)
//}

class DeleteAddressVC: UIViewController {
    
//    weak var delegate: DeleteAddressDelegate?
    private let deliveryAddressViewModel = DeliveryAddressViewModel.shared
    
    private let addressId: UUID
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.text = "Confirmation"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.text = "Do you want to remove this address?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(hex: Colors.primary), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitle("Yes", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(hex: Colors.primary).cgColor
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitle("No", for: .normal)
        button.backgroundColor = UIColor(hex: Colors.primary)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        configureBtns()
    }
    
    init(id: UUID) {
        addressId = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBtns() {
        confirmButton.addTarget(self, action: #selector(deleteItem), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
    }
    
    @objc private func deleteItem() {
        deliveryAddressViewModel.deleteAddress(id: addressId)
        dismiss(animated: true)
    }
    
    @objc private func dismissModal() {
        dismiss(animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        view.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(confirmButton)
        stackView.addArrangedSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            confirmButton.heightAnchor.constraint(equalToConstant: 40),
            dismissButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
