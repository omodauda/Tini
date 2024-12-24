//
//  SelectStoreTableViewCell.swift
//  Tini
//
//  Created by Omodauda on 22/12/2024.
//

import UIKit

class SelectStoreTableViewCell: UITableViewCell {
    
    static let identifier: String = "SelectStoreTableViewCell"
    
    private let cellView: UIView = {
        let cellView = UIView()
        cellView.backgroundColor = .white
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.layer.cornerRadius = 8
        return cellView
    }()
    
    private let storeLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = Images.storeIcon
        logo.contentMode = .scaleAspectFill
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let storeName: UILabel = {
        let name = UILabel()
        name.textColor = UIColor(hex: Colors.titleText)
        name.font = .systemFont(ofSize: 14, weight: .medium)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let storeAddress: UILabel = {
        let address = UILabel()
        address.textColor = UIColor(hex: Colors.secondary)
        address.font = .systemFont(ofSize: 12, weight: .regular)
        address.translatesAutoresizingMaskIntoConstraints = false
        return address
    }()
    
    private let favIcon: UIImageView = {
        let icon = UIImageView()
//        icon.image = Images.favIcon
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(store: StoreModel) {
        storeName.text = store.name
        storeAddress.text = store.address
        if store.isFavorite {
            favIcon.image = Images.favIcon
        } else {
            favIcon.image = UIImage()
        }
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(cellView)
        cellView.addSubview(storeLogo)
        cellView.addSubview(storeName)
        cellView.addSubview(storeAddress)
        cellView.addSubview(favIcon)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            storeLogo.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            storeLogo.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            storeLogo.widthAnchor.constraint(equalToConstant: 24),
            storeLogo.heightAnchor.constraint(equalToConstant: 24),
            
            favIcon.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            favIcon.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            favIcon.widthAnchor.constraint(equalToConstant: 20),
            favIcon.heightAnchor.constraint(equalToConstant: 20),
            
            storeName.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8),
            storeName.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 10),
            storeName.trailingAnchor.constraint(equalTo: favIcon.leadingAnchor, constant: -10),
            
            storeAddress.topAnchor.constraint(equalTo: storeName.bottomAnchor, constant: 4),
            storeAddress.leadingAnchor.constraint(equalTo: storeLogo.trailingAnchor, constant: 10),
            storeAddress.trailingAnchor.constraint(equalTo: favIcon.leadingAnchor, constant: -10),
            storeAddress.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -8),
        ])
    }
}
