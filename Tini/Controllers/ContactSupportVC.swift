//
//  ContactSupportView.swift
//  Tini
//
//  Created by Omodauda on 18/04/2025.
//

import UIKit

protocol ContactSupportDelegate: AnyObject {
    func close()
}

class ContactSupportVC: UIViewController {
    
    weak var delegate: ContactSupportDelegate?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imagePlaceholder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.masksToBounds = true
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.storeImage
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let storeName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SB han Thuyen"
        return label
    }()
    
    private let contactLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Store contact informations"
        return label
    }()
    
    private lazy var contactCard = StoreContactCard(phone: "08141637335", address: "13 Han Thuyan")
    
    private let closeBtn: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Close"
        configuration.baseBackgroundColor = .clear
        
        let btn = UIButton(configuration: configuration)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        btn.layer.borderColor = UIColor(hex: Colors.primary).cgColor
        btn.setTitleColor(UIColor(hex: Colors.primary), for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 20
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCloseBtn()
    }
    
    func configureCloseBtn() {
        closeBtn.addTarget(self, action: #selector(handleCloseBtn), for: .touchUpInside)
    }
    
    @objc func handleCloseBtn() {
        dismiss(animated: true)
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        view.addSubview(contentView)
        contentView.addSubview(imagePlaceholder)
        imagePlaceholder.addSubview(imageView)
        contentView.addSubview(storeName)
        contentView.addSubview(contactLabel)
        contentView.addSubview(contactCard)
        contactCard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(closeBtn)
        
        NSLayoutConstraint.activate([
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            imagePlaceholder.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagePlaceholder.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePlaceholder.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePlaceholder.heightAnchor.constraint(equalToConstant: 103),
            
            imageView.topAnchor.constraint(equalTo: imagePlaceholder.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: imagePlaceholder.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imagePlaceholder.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: imagePlaceholder.bottomAnchor),
            
            storeName.topAnchor.constraint(equalTo: imagePlaceholder.bottomAnchor, constant: 8),
            storeName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            storeName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            contactLabel.topAnchor.constraint(equalTo: storeName.bottomAnchor, constant: 16),
            contactLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contactLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            contactCard.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 16),
            contactCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contactCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            
            closeBtn.topAnchor.constraint(equalTo: contactCard.bottomAnchor , constant: 16),
            closeBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            closeBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            closeBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            closeBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
